package com.smartride.util;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.util.regex.*;

/**
 * Utility OCR ảnh CCCD/CMND dùng ocr.space API.
 * Demo key "helloworld" hoạt động ngay (1000 req/tháng với key riêng).
 * Đăng ký key miễn phí tại: https://ocr.space/ocrapi/freekey
 */
public class IdCardVerifier {

    // Key "helloworld" là demo key chính thức của ocr.space, hoạt động ngay không cần đăng ký
    // Đăng ký key miễn phí tại ocr.space để dùng tiếng Việt (language=vie) không giới hạn hơn
    public static final String OCR_API_KEY = "helloworld";
    private static final String OCR_API_URL = "https://api.ocr.space/parse/image";

    /**
     * Kết quả xác thực CCCD.
     */
    public static class VerifyResult {
        public boolean configured;
        public boolean success;
        public boolean idMatch;
        public boolean nameMatch;
        public boolean doeValid;
        public boolean valid;
        public String ocrId;
        public String ocrName;
        public String ocrDob;
        public String ocrDoe;
        public String ocrSex;
        public String type;
        public String errorMsg;
        public java.util.List<String> fieldErrors = new java.util.ArrayList<>();
    }

    /**
     * Xác thực từ đường dẫn file ảnh (local path hoặc http URL).
     */
    public static VerifyResult verify(String imagePath, String webRootPath,
                                      String storedId, String storedName) {
        VerifyResult r = new VerifyResult();
        r.configured = true;

        if (imagePath == null || imagePath.trim().isEmpty()) {
            r.success  = false;
            r.valid    = false;
            r.errorMsg = "Không có ảnh CCCD";
            return r;
        }

        // Gọi OCR API
        String ocrText;
        try {
            if (imagePath.trim().startsWith("http")) {
                ocrText = callOcrByUrl(imagePath.trim());
            } else {
                File imageFile;
                String path = imagePath.trim();
                imageFile = new File(webRootPath, "upload" + File.separator + path);
                if (!imageFile.exists()) imageFile = new File(webRootPath, path);
                if (!imageFile.exists()) {
                    r.success  = false;
                    r.valid    = false;
                    r.errorMsg = "Không tìm thấy file ảnh: " + imagePath;
                    return r;
                }
                ocrText = callOcrByFile(imageFile);
            }
        } catch (Exception e) {
            r.success  = false;
            r.valid    = false;
            r.errorMsg = "Lỗi gọi OCR API: " + e.getMessage();
            return r;
        }

        if (ocrText == null || ocrText.trim().isEmpty()) {
            r.success  = false;
            r.valid    = false;
            r.errorMsg = "Không đọc được nội dung ảnh. Kiểm tra lại chất lượng ảnh.";
            return r;
        }

        r.success = true;
        r.type = "CCCD/CMND";

        // Parse các trường từ OCR text của CCCD Việt Nam
        r.ocrId   = parseId(ocrText);
        r.ocrName = parseName(ocrText);
        r.ocrDob  = parseDob(ocrText);
        r.ocrDoe  = parseDoe(ocrText);
        r.ocrSex  = parseSex(ocrText);

        // So khớp số CCCD (chỉ cần số khớp là được)
        r.idMatch = storedId != null && isValid(r.ocrId)
                && normalizeDigits(storedId).equals(normalizeDigits(r.ocrId));

        // So khớp họ tên (fuzzy - bỏ qua ký tự lỗi OCR)
        r.nameMatch = false;
        if (storedName != null && isValid(r.ocrName)) {
            String normDB  = normalizeLetters(normalizeVN(storedName));
            String normOCR = normalizeLetters(normalizeVN(r.ocrName));
            if (normDB.equalsIgnoreCase(normOCR)) {
                r.nameMatch = true;
            } else {
                // So từng chữ (bỏ qua thứ tự)
                java.util.Set<String> dbSet  = new java.util.HashSet<>(java.util.Arrays.asList(normDB.split("\\s+")));
                java.util.Set<String> ocrSet = new java.util.HashSet<>(java.util.Arrays.asList(normOCR.split("\\s+")));
                r.nameMatch = !dbSet.isEmpty() && dbSet.equals(ocrSet);
            }
        }

        // Kiểm tra ngày hết hạn
        r.doeValid = true;
        if (isValid(r.ocrDoe)) {
            try {
                java.time.LocalDate expiry = parseDate(r.ocrDoe);
                if (expiry != null && expiry.isBefore(java.time.LocalDate.now())) {
                    r.doeValid = false;
                }
            } catch (Exception ignored) {}
        }

        // Tổng hợp lỗi chi tiết
        if (!r.idMatch) {
            r.fieldErrors.add("❌ Số CCCD/CMND không khớp: DB [" + (storedId != null ? storedId : "?") + "] – AI đọc [" + (r.ocrId != null ? r.ocrId : "?") + "]");
        }
        if (!r.nameMatch) {
            r.fieldErrors.add("❌ Họ và tên không khớp: DB [" + (storedName != null ? storedName : "?") + "] – AI đọc [" + (r.ocrName != null ? r.ocrName : "?") + "]");
        }
        if (!r.doeValid) {
            r.fieldErrors.add("❌ CCCD/CMND đã hết hạn (ngày hết hạn: " + r.ocrDoe + ").");
        }

        r.valid = r.idMatch && r.nameMatch && r.doeValid;
        if (!r.valid && r.fieldErrors.isEmpty()) {
            r.fieldErrors.add("❌ Thông tin không khớp với ảnh CCCD/CMND.");
        }
        return r;
    }

    // ─── OCR API calls ─────────────────────────────────────────────────────────

    private static String callOcrByUrl(String imageUrl) throws Exception {
        String body = "apikey=" + URLEncoder.encode(OCR_API_KEY, "UTF-8")
                + "&url=" + URLEncoder.encode(imageUrl, "UTF-8")
                + "&language=eng"
                + "&OCREngine=2"
                + "&scale=true";
        return postForm(body);
    }

    private static String callOcrByFile(File imageFile) throws Exception {
        String boundary = "----OcrBoundary" + System.currentTimeMillis();
        URL url = new URL(OCR_API_URL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
        conn.setConnectTimeout(20000);
        conn.setReadTimeout(30000);

        try (DataOutputStream dos = new DataOutputStream(conn.getOutputStream())) {
            writeField(dos, boundary, "apikey", OCR_API_KEY);
            writeField(dos, boundary, "language", "eng");
            writeField(dos, boundary, "OCREngine", "2");
            writeField(dos, boundary, "scale", "true");
            dos.writeBytes("--" + boundary + "\r\n");
            dos.writeBytes("Content-Disposition: form-data; name=\"file\"; filename=\"" + imageFile.getName() + "\"\r\n");
            dos.writeBytes("Content-Type: image/jpeg\r\n\r\n");
            Files.copy(imageFile.toPath(), dos);
            dos.writeBytes("\r\n--" + boundary + "--\r\n");
            dos.flush();
        }
        return extractParsedText(readRaw(conn));
    }

    private static String postForm(String body) throws Exception {
        URL url = new URL(OCR_API_URL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setConnectTimeout(20000);
        conn.setReadTimeout(30000);
        try (OutputStream os = conn.getOutputStream()) {
            os.write(body.getBytes("UTF-8"));
        }
        return extractParsedText(readRaw(conn));
    }

    private static String readRaw(HttpURLConnection conn) throws Exception {
        int code = conn.getResponseCode();
        InputStream is = null;
        try { is = conn.getInputStream(); } catch (Exception e) { is = conn.getErrorStream(); }
        if (is == null) return null;
        StringBuilder sb = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"))) {
            String line; while ((line = br.readLine()) != null) sb.append(line).append("\n");
        }
        return sb.toString();
    }

    private static String extractParsedText(String json) {
        if (json == null) return null;
        int idx = json.indexOf("\"ParsedText\"");
        if (idx < 0) return null;
        int start = json.indexOf('"', idx + 13) + 1;
        if (start <= 0) return null;
        int end = start;
        while (end < json.length()) {
            char c = json.charAt(end);
            if (c == '"' && (end == 0 || json.charAt(end - 1) != '\\')) break;
            end++;
        }
        return json.substring(start, end)
                .replace("\\n", "\n").replace("\\r", "\r")
                .replace("\\t", "\t").replace("\\/", "/")
                .replace("\\\"", "\"").replace("\\\\", "\\");
    }

    private static void writeField(DataOutputStream dos, String boundary, String name, String value) throws IOException {
        dos.writeBytes("--" + boundary + "\r\n");
        dos.writeBytes("Content-Disposition: form-data; name=\"" + name + "\"\r\n\r\n");
        dos.writeBytes(value + "\r\n");
    }

    // ─── CCCD text parsers ──────────────────────────────────────────────────────

    private static String parseId(String text) {
        // "No.: 045205001036" - chuẩn CCCD 12 số bắt đầu bằng 0
        Matcher m = Pattern.compile("[Nn]o\\.?\\s*[:\\-]?\\s*(0\\d{11})").matcher(text);
        if (m.find()) return m.group(1);
        // Hoặc "S./No.: 045205001036"
        Matcher m2 = Pattern.compile("S[^/]*/[Nn]o\\.?\\s*[:\\-]?\\s*(0\\d{11})").matcher(text);
        if (m2.find()) return m2.group(1);
        // Fallback: 12 chữ số liên tiếp bắt đầu bằng 0
        Matcher m3 = Pattern.compile("\\b(0\\d{11})\\b").matcher(text);
        if (m3.find()) return m3.group(1);
        // CMND 9 chữ số
        Matcher m4 = Pattern.compile("\\b(\\d{9})\\b").matcher(text);
        if (m4.find()) return m4.group(1);
        return "N/A";
    }

    private static String parseName(String text) {
        // "Full name:\nLÊ QUANG MINH" hoặc "Full name: LÊ QUANG MINH"
        Matcher m = Pattern.compile("(?:[Ff]ull\\s*name|Full name)[/\\\\]?[^:]*:\\s*\\n?([A-Z][A-Z?Ê\\s]{3,40}?)(?=\\n|\\r|$)").matcher(text);
        if (m.find()) return m.group(1).trim();
        // Thử pattern với dòng kế tiếp sau "Full name:"
        String[] lines = text.split("\n");
        for (int i = 0; i < lines.length - 1; i++) {
            if (lines[i].toLowerCase().contains("full name")) {
                String nextLine = lines[i + 1].trim();
                if (nextLine.matches("[A-Z?Ê][A-Z?\\s]{3,40}")) return nextLine;
                // Có thể tên trên cùng dòng với "Full name:"
                Matcher m2 = Pattern.compile("[Ff]ull\\s*name[^:]*:\\s*([A-Z][A-Z?\\s]{3,40})").matcher(lines[i]);
                if (m2.find()) return m2.group(1).trim();
            }
        }
        return "N/A";
    }

    private static String parseDob(String text) {
        Matcher m = Pattern.compile("(?:[Dd]ate\\s*of\\s*birth|Date of birth)[^:]*:\\s*(\\d{2}[/-]\\d{2}[/-]\\d{4})").matcher(text);
        if (m.find()) return m.group(1);
        return "N/A";
    }

    private static String parseDoe(String text) {
        // "Date of expiry\n01/09/2030" hoặc "expiry: 01/09/2030"
        Matcher m = Pattern.compile("(?:[Dd]ate\\s*of\\s*expiry|[Cc][óo]\\s*gi[áa][^:]*)[^:]*:?\\s*\\n?(\\d{2}[/-]\\d{2}[/-]\\d{4})").matcher(text);
        if (m.find()) return m.group(1);
        // Tìm ngày đầu tiên trong text (ưu tiên ngày muộn hơn = ngày hết hạn)
        Matcher m2 = Pattern.compile("(\\d{2}/\\d{2}/\\d{4})").matcher(text);
        String latest = null;
        while (m2.find()) {
            String d = m2.group(1);
            if (latest == null || d.compareTo(latest) > 0) latest = d;
        }
        return latest != null ? latest : "N/A";
    }

    private static String parseSex(String text) {
        if (Pattern.compile("\\bNam\\b").matcher(text).find()) return "Nam";
        if (Pattern.compile("\\b[Nn][uữ]\\b|Female").matcher(text).find()) return "Nữ";
        return "N/A";
    }

    private static java.time.LocalDate parseDate(String dateStr) {
        if (!isValid(dateStr)) return null;
        try {
            if (dateStr.matches("\\d{2}/\\d{2}/\\d{4}"))
                return java.time.LocalDate.parse(dateStr, java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy"));
            if (dateStr.matches("\\d{2}-\\d{2}-\\d{4}"))
                return java.time.LocalDate.parse(dateStr, java.time.format.DateTimeFormatter.ofPattern("dd-MM-yyyy"));
            if (dateStr.matches("\\d{4}-\\d{2}-\\d{2}"))
                return java.time.LocalDate.parse(dateStr);
        } catch (Exception ignored) {}
        return null;
    }

    // ─── Helpers ────────────────────────────────────────────────────────────────

    private static boolean isValid(String s) {
        return s != null && !s.isBlank() && !s.equalsIgnoreCase("N/A");
    }

    private static String normalizeDigits(String s) {
        return s == null ? "" : s.replaceAll("[^0-9]", "");
    }

    /** Chuẩn hóa tên: bỏ dấu tiếng Việt, bỏ ký tự lỗi OCR (?, ?, etc.), chỉ giữ chữ cái */
    private static String normalizeVN(String s) {
        if (s == null) return "";
        s = s.trim().toUpperCase();
        s = java.text.Normalizer.normalize(s, java.text.Normalizer.Form.NFD);
        s = s.replaceAll("[\\p{InCombiningDiacriticalMarks}]", "");
        s = s.replace("Đ", "D").replace("đ", "D");
        return s.replaceAll("\\s+", " ").trim();
    }

    /** Bỏ tất cả ký tự không phải chữ cái A-Z (dùng cho fuzzy match tên) */
    private static String normalizeLetters(String s) {
        return s == null ? "" : s.replaceAll("[^A-Z ]", "").replaceAll("\\s+", " ").trim();
    }
}

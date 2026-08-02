import java.io.*;
import java.net.*;

public class test_ocr {
    public static void main(String[] args) throws Exception {
        String apiKey = "helloworld"; // Demo key miễn phí của ocr.space
        String imgUrl = "https://zfvgigfjmbtgwgirdify.supabase.co/storage/v1/object/public/motor-images/imageIdC9_1785621202941_front.jpg";
        
        // Note: helloworld key chỉ hỗ trợ eng, dùng key riêng để hỗ trợ vie
        String body = "apikey=" + URLEncoder.encode(apiKey, "UTF-8")
                + "&url=" + URLEncoder.encode(imgUrl, "UTF-8")
                + "&language=eng"
                + "&OCREngine=2"
                + "&scale=true";
        
        URL url = new URL("https://api.ocr.space/parse/image");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setConnectTimeout(20000);
        conn.setReadTimeout(30000);
        
        try (OutputStream os = conn.getOutputStream()) {
            os.write(body.getBytes("UTF-8"));
        }
        
        int code = conn.getResponseCode();
        System.out.println("HTTP Status: " + code);
        
        InputStream is = (code < 300) ? conn.getInputStream() : conn.getErrorStream();
        StringBuilder sb = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"))) {
            String line; while ((line = br.readLine()) != null) sb.append(line).append("\n");
        }
        String json = sb.toString();
        
        // Extract ParsedText
        int idx = json.indexOf("ParsedText");
        if (idx >= 0) {
            int start = json.indexOf('"', idx + 12) + 1;
            int end = start;
            while (end < json.length()) {
                char c = json.charAt(end);
                if (c == '"' && json.charAt(end-1) != '\\') break;
                end++;
            }
            String text = json.substring(start, end)
                .replace("\\n", "\n").replace("\\r", "").replace("\\t", "\t");
            System.out.println("=== OCR Text ===\n" + text);
        } else {
            System.out.println("=== Full Response ===\n" + json.substring(0, Math.min(500, json.length())));
        }
    }
}

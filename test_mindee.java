import java.io.*;
import java.net.*;
import java.nio.file.*;

public class test_mindee {
    public static void main(String[] args) throws Exception {
        String apiKey = "md_Q0o6ixm5-z4ZSwKXNE2qE_zfDNJdxlJF9UoqFd7o2f0";
        // Try pre-built International ID v2
        String apiUrl = "https://api.mindee.net/v1/products/mindee/international_id/v2/predict";

        // Download CCCD image from Supabase
        System.out.println("Downloading CCCD image...");
        URL imgUrlObj = new URL("https://zfvgigfjmbtgwgirdify.supabase.co/storage/v1/object/public/motor-images/imageIdC9_1785621202941_front.jpg");
        File tmpFile = File.createTempFile("cccd_test_", ".jpg");
        tmpFile.deleteOnExit();
        try (InputStream in = imgUrlObj.openStream(); FileOutputStream fos = new FileOutputStream(tmpFile)) {
            byte[] buf = new byte[4096]; int n;
            while ((n = in.read(buf)) != -1) fos.write(buf, 0, n);
        }
        System.out.println("Image downloaded: " + tmpFile.length() + " bytes");

        // Call Mindee API
        String boundary = "----MindeeBoundary" + System.currentTimeMillis();
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Authorization", "Token " + apiKey);
        conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
        conn.setConnectTimeout(15000);
        conn.setReadTimeout(30000);

        try (DataOutputStream dos = new DataOutputStream(conn.getOutputStream())) {
            dos.writeBytes("--" + boundary + "\r\n");
            dos.writeBytes("Content-Disposition: form-data; name=\"document\"; filename=\"cccd.jpg\"\r\n");
            dos.writeBytes("Content-Type: image/jpeg\r\n\r\n");
            Files.copy(tmpFile.toPath(), dos);
            dos.writeBytes("\r\n--" + boundary + "--\r\n");
            dos.flush();
        }

        int httpCode = conn.getResponseCode();
        System.out.println("HTTP Status: " + httpCode);
        
        // Print full response
        InputStream is = null;
        try { is = conn.getInputStream(); } catch (Exception e) { is = conn.getErrorStream(); }
        if (is != null) {
            StringBuilder sb = new StringBuilder();
            try (BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"))) {
                String line; while ((line = br.readLine()) != null) sb.append(line).append("\n");
            }
            System.out.println("Full Response:\n" + sb);
        } else {
            System.out.println("No response body");
        }
        tmpFile.delete();
    }
}

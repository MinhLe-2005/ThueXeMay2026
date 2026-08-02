import java.io.*;
import java.net.*;
import java.nio.file.*;

public class test_fpt_api {
    public static void main(String[] args) throws Exception {
        String apiKey = "6wNP06jo9FT0N0rihPRgR0GgHAkw5jdQ";
        String apiUrl = "https://api.fpt.ai/vision/idr/vnm/";

        // Download a sample CCCD image from Supabase
        String imgUrl = "https://zfvgigfjmbtgwgirdify.supabase.co/storage/v1/object/public/motor-images/imageIdC9_1785621202941_front.jpg";
        URL imgUrlObj = new URL(imgUrl);
        File tmpFile = File.createTempFile("cccd_test_", ".jpg");
        tmpFile.deleteOnExit();
        try (InputStream in = imgUrlObj.openStream();
             FileOutputStream fos = new FileOutputStream(tmpFile)) {
            byte[] buf = new byte[4096];
            int n;
            while ((n = in.read(buf)) != -1) fos.write(buf, 0, n);
        }
        System.out.println("Downloaded image: " + tmpFile.length() + " bytes");

        // Call FPT API
        String boundary = "----FPTBoundary" + System.currentTimeMillis();
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("api-key", apiKey);
        conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
        conn.setConnectTimeout(15000);
        conn.setReadTimeout(15000);

        try (DataOutputStream dos = new DataOutputStream(conn.getOutputStream())) {
            dos.writeBytes("--" + boundary + "\r\n");
            dos.writeBytes("Content-Disposition: form-data; name=\"image\"; filename=\"cccd.jpg\"\r\n");
            dos.writeBytes("Content-Type: image/jpeg\r\n\r\n");
            Files.copy(tmpFile.toPath(), dos);
            dos.writeBytes("\r\n--" + boundary + "--\r\n");
            dos.flush();
        }

        int httpCode = conn.getResponseCode();
        System.out.println("HTTP Status: " + httpCode);
        InputStream is = (httpCode == 200) ? conn.getInputStream() : conn.getErrorStream();
        StringBuilder sb = new StringBuilder();
        if (is != null) {
            try (BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"))) {
                String line;
                while ((line = br.readLine()) != null) sb.append(line).append("\n");
            }
        }
        System.out.println("Response:\n" + sb);
        tmpFile.delete();
    }
}

import java.net.HttpURLConnection;
import java.net.URL;

public class check_http {
    public static void main(String[] args) {
        try {
            URL url = new URL("https://zfvgigfjmbtgwgirdify.supabase.co/storage/v1/object/public/motor-images/imageIdC9_1785621202941_front.jpg");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            System.out.println("Status Code: " + conn.getResponseCode());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

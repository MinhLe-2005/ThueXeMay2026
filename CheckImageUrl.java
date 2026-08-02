import java.net.HttpURLConnection;
import java.net.URL;

public class CheckImageUrl {
    public static void main(String[] args) {
        String[] urls = {
            "https://zfvgigfjmbtgwgirdify.supabase.co/storage/v1/object/public/motor-images/imageIdC9_1785621202941_front.jpg",
            "https://zfvgigfjmbtgwgirdify.supabase.co/storage/v1/object/public/motor-images/imageIdC9_1785621202941_back.jpg"
        };
        for (String urlString : urls) {
            try {
                URL url = new URL(urlString);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("HEAD");
                int responseCode = connection.getResponseCode();
                System.out.println(urlString + " -> HTTP " + responseCode);
            } catch (Exception e) {
                System.out.println(urlString + " -> Exception: " + e.getMessage());
            }
        }
    }
}

import java.sql.*;
public class check_cust_image {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://aws-1-ap-northeast-1.pooler.supabase.com:6543/postgres?sslmode=require";
        String user = "postgres.zfvgigfjmbtgwgirdify";
        String pass = "Bimdiendie1@";
        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT c.\"IdentityCardImage\", c.\"IdentityCard\" FROM \"Customer\" c " +
                "JOIN \"Booking\" b ON c.\"CustomerID\" = b.\"CustomerID\" WHERE b.\"BookingID\" = 'BK00568012'");
            if (rs.next()) {
                System.out.println("IdentityCardImage: " + rs.getString(1));
                System.out.println("IdentityCard: " + rs.getString(2));
            } else {
                System.out.println("Not found");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

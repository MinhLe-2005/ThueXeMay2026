import java.sql.*;
public class check_custs {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://aws-1-ap-northeast-1.pooler.supabase.com:6543/postgres?sslmode=require";
        String user = "postgres.zfvgigfjmbtgwgirdify";
        String pass = "Bimdiendie1@";
        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT c.\"CustomerID\", c.\"IdentityCardImage\" FROM \"Customer\" c " +
                "WHERE c.\"AccountID\" = (SELECT c2.\"AccountID\" FROM \"Customer\" c2 JOIN \"Booking\" b ON c2.\"CustomerID\" = b.\"CustomerID\" WHERE b.\"BookingID\" = 'BK00568012')");
            while (rs.next()) {
                System.out.println("CustomerID: " + rs.getInt(1) + ", IdentityCardImage: " + rs.getString(2));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

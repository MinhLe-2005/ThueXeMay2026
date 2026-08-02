import java.sql.*;
public class check_id_card {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://aws-1-ap-northeast-1.pooler.supabase.com:6543/postgres?sslmode=require";
        String user = "postgres.zfvgigfjmbtgwgirdify";
        String pass = "Bimdiendie1@";
        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT \"IdentityCard\" FROM \"Customer\" WHERE \"CustomerID\" = 9");
            if (rs.next()) {
                System.out.println("IdentityCard: " + rs.getString(1));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

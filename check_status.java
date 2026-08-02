import java.sql.*;
public class check_status {
    public static void main(String[] args) throws Exception {
        String url = "jdbc:postgresql://aws-1-ap-northeast-1.pooler.supabase.com:6543/postgres?sslmode=require";
        String user = "postgres.zfvgigfjmbtgwgirdify";
        String pass = "Bimdiendie1@";
        Connection conn = DriverManager.getConnection(url, user, pass);
        Statement stmt = conn.createStatement();
        
        // Check StatusBooking distinct values and TotalPrice from Booking Detail
        ResultSet rs = stmt.executeQuery(
            "SELECT b.\"StatusBooking\", COUNT(*), COALESCE(SUM(bd.\"TotalPrice\"),0) " +
            "FROM \"Booking\" b " +
            "LEFT JOIN \"Booking Detail\" bd ON b.\"BookingID\" = bd.\"BookingID\" " +
            "GROUP BY b.\"StatusBooking\""
        );
        System.out.println("=== Status | Count | TotalPrice ===");
        while (rs.next()) {
            System.out.println("[" + rs.getString(1) + "] | " + rs.getInt(2) + " | " + rs.getDouble(3));
        }
        
        // Also check Payment table
        System.out.println("\n=== Payment amounts ===");
        ResultSet rs2 = stmt.executeQuery("SELECT \"PaymentStatus\", COUNT(*), COALESCE(SUM(\"PaymentAmount\"),0) FROM \"Payment\" GROUP BY \"PaymentStatus\"");
        while (rs2.next()) {
            System.out.println("[" + rs2.getString(1) + "] | " + rs2.getInt(2) + " | " + rs2.getDouble(3));
        }
        conn.close();
    }
}

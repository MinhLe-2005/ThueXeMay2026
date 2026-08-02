import java.sql.*;

public class CheckDB {
    public static void main(String[] args) throws Exception {
        String url = "jdbc:postgresql://aws-1-ap-northeast-1.pooler.supabase.com:6543/postgres";
        String user = "postgres.zfvgigfjmbtgwgirdify";
        String pass = "minh01092005";
        
        try (Connection conn = DriverManager.getConnection(url, user, pass)) {
            System.out.println("Booking Table:");
            try (Statement st = conn.createStatement();
                 ResultSet rs = st.executeQuery("SELECT \"BookingDate\" FROM \"Booking\" ORDER BY \"BookingDate\" DESC LIMIT 10")) {
                while(rs.next()) {
                    System.out.println("  " + rs.getTimestamp(1));
                }
            }
            
            System.out.println("\nDashboardDAO getDateCondition today (for reference): " + java.time.LocalDate.now());
            
            // Run exactly what DashboardDAO does for period='all'
            System.out.println("\nEarliest Booking:");
            try (Statement st = conn.createStatement();
                 ResultSet rs = st.executeQuery("SELECT MIN(\"BookingDate\") FROM \"Booking\"")) {
                if (rs.next()) System.out.println("  " + rs.getTimestamp(1));
            }
        }
    }
}

import java.sql.*;
import java.util.*;

public class TestDB {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://aws-1-ap-northeast-1.pooler.supabase.com:6543/postgres?sslmode=require";
        String user = "postgres.zfvgigfjmbtgwgirdify";
        String pass = "Bimdiendie1@";
        
        try (Connection conn = DriverManager.getConnection(url, user, pass)) {
            String sql = "select m.\"MotorcycleID\", m.\"Model\", COUNT(m.\"MotorcycleID\") as \"Quantity\" "
                  + "from \"Motorcycle\" m "
                  + "JOIN \"Motorcycle Detail\" md ON m.\"MotorcycleID\" = md.\"MotorcycleID\" "
                  + "where md.\"MotorcycleDetailID\" IN ( "
                  + "    select \"MotorcycleDetailID\" from \"Booking Detail\" "
                  + "    where \"BookingID\" = ? "
                  + ") "
                  + "GROUP BY m.\"MotorcycleID\", m.\"Model\"";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, "BKTEST0010");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString(1) + " | " + rs.getString(2) + " | " + rs.getInt(3));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

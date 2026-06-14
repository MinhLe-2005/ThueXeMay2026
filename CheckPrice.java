import java.sql.*;
import com.smartride.util.DBUtil;
public class CheckPrice {
    public static void main(String[] args) throws Exception {
        try (Connection conn = DBUtil.makeConnection()) {
            String sql = "SELECT "DailyPriceForDay", "DailyPriceForWeek", "DailyPriceForMonth" FROM "PriceList"";
            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    double day = rs.getDouble(1);
                    double week = rs.getDouble(2);
                    double month = rs.getDouble(3);
                    double discountWeek = 100.0 - (week / day * 100.0);
                    double discountMonth = 100.0 - (month / day * 100.0);
                    System.out.printf("Day: %.0f, Week: %.0f (%.0f%%), Month: %.0f (%.0f%%)\n", day, week, discountWeek, month, discountMonth);
                }
            }
        }
    }
}

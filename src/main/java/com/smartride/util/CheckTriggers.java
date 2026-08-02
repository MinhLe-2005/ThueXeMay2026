import com.smartride.util.DBUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CheckTriggers {
    public static void main(String[] args) {
        try (Connection c = DBUtil.makeConnection();
             Statement stmt = c.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT trigger_name, event_manipulation, event_object_table, action_statement FROM information_schema.triggers WHERE event_object_table = 'Voucher'")) {
            System.out.println("Triggers on Voucher table:");
            while (rs.next()) {
                System.out.println("- " + rs.getString("trigger_name") + " ON " + rs.getString("event_manipulation") + " -> " + rs.getString("action_statement"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

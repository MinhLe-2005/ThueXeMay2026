import java.sql.*;
import com.smartride.util.DBUtil;
public class CheckData {
    public static void main(String[] args) throws Exception {
        try (Connection c = DBUtil.makeConnection(); Statement s = c.createStatement(); ResultSet rs = s.executeQuery("SELECT count(*) FROM "Event"")) {
            if(rs.next()) System.out.println("Events count: " + rs.getInt(1));
        }
    }
}

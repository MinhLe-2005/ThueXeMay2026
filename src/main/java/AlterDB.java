import java.sql.Connection;
import java.sql.Statement;
import com.smartride.util.DBUtil;

public class AlterDB {
    public static void main(String[] args) {
        try {
            Connection conn = DBUtil.makeFreshConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("ALTER TABLE \"Motorcycle\" ADD COLUMN \"IsHidden\" BOOLEAN DEFAULT false;");
            System.out.println("Success!");
            conn.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}

import java.sql.*;
import com.smartride.dao.DBContext;

public class GetLength {
    public static void main(String[] args) {
        try {
            DBContext db = new DBContext();
            Connection conn = db.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT character_maximum_length FROM information_schema.columns WHERE table_name = 'Customer' AND column_name = 'IdentityCardImage'");
            if (rs.next()) {
                System.out.println("Customer IdentityCardImage Length: " + rs.getInt(1));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

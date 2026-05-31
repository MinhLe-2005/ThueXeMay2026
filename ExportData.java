import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.FileWriter;
import java.io.PrintWriter;

public class ExportData {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://aws-1-ap-northeast-1.pooler.supabase.com:6543/postgres?sslmode=require";
        String user = "postgres.zfvgigfjmbtgwgirdify";
        String pass = "Bimdiendie1@";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PrintWriter writer = new PrintWriter(new FileWriter("BangGiaXe_Chatbase.txt"))) {
            
            String sql = "SELECT m.\"MotorcycleID\", m.\"Model\", m.\"Displacement\", p.\"DailyPriceForDay\", m.\"Image\" " +
                         "FROM \"Motorcycle\" m " +
                         "JOIN \"PriceList\" p ON m.\"PriceListID\" = p.\"PriceListID\"";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            writer.println("Đây là danh sách các loại xe máy đang cho thuê tại cửa hàng SmartRide kèm theo giá tiền thực tế:");
            writer.println("---");
            
            int count = 0;
            while (rs.next()) {
                String id = rs.getString("MotorcycleID");
                String name = rs.getString("Model");
                String cc = rs.getString("Displacement");
                String image = rs.getString("Image");
                double price = rs.getDouble("DailyPriceForDay") * 1000;
                
                String line = String.format("Mã xe: %s. Xe: %s (phân khối %s). Giá thuê: %,.0f VNĐ/ngày. Hình ảnh xe (bạn phải xuất ra markdown này): ![Hình xe](http://localhost:8080/MotorcyleHiringProject/%s) . Nút Đặt Xe (bạn phải xuất ra markdown này): [👉 BẤM VÀO ĐÂY ĐỂ ĐẶT XE NGAY](http://localhost:8080/MotorcyleHiringProject/motorcycleDetail?id=%s)", 
                                            id, name, cc, price, image, id);
                writer.println("- " + line);
                count++;
            }
            
            writer.println("---");
            writer.println("Dữ liệu được cập nhật tự động.");
            
            System.out.println("✅ Đã xuất thành công " + count + " dòng xe ra file BangGiaXe_Chatbase.txt!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

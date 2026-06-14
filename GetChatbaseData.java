import java.sql.*;
import com.smartride.util.DBUtil;
public class GetChatbaseData {
    public static void main(String[] args) throws Exception {
        try (Connection conn = DBUtil.makeConnection()) {
            System.out.println("TÀI LI?U KI?N TH?C V? GIÁ VÀ KHUY?N MÃI THUÊ XE MÁY (SMARTRIDE)");
            System.out.println("Luu ý cho AI: Hãy s? d?ng CHÍNH XÁC b?ng giá và các chuong trình khuy?n mãi du?i dây d? tr? l?i khách hàng.\n");

            System.out.println("================ CHUONG TRÌNH KHUY?N MÃI ÐANG DI?N RA ================");
            String sqlEvent = "SELECT "EventTitle", "StartDate", "EndDate", "Content", "Discount" FROM "Event" WHERE "EndDate" >= CURRENT_DATE";
            boolean hasEvent = false;
            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sqlEvent)) {
                while (rs.next()) {
                    hasEvent = true;
                    int discountPercent = (int) (rs.getDouble("Discount") * 100);
                    System.out.println("- S? ki?n: " + rs.getString("EventTitle"));
                    System.out.println("  + N?i dung: " + rs.getString("Content"));
                    System.out.println("  + M?c gi?m giá: " + discountPercent + "%");
                    System.out.println("  + Th?i gian áp d?ng: T? " + rs.getDate("StartDate") + " d?n " + rs.getDate("EndDate") + "\n");
                }
            }
            if (!hasEvent) {
                System.out.println("Hi?n t?i h? th?ng KHÔNG CÓ chuong trình khuy?n mãi nào dang di?n ra. Hãy báo v?i khách là t?m th?i chua có khuy?n mãi m?i.\n");
            }

            System.out.println("================ B?NG GIÁ THUÊ XE HÔM NAY ================");
            String sqlMoto = "SELECT m."Model", p."DailyPriceForDay", c."CategoryName" FROM "Motorcycle" m JOIN "PriceList" p ON m."PriceListID" = p."PriceListID" JOIN "Category" c ON m."CategoryID" = c."CategoryID" ORDER BY c."CategoryName", m."Model"";
            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sqlMoto)) {
                String currentCat = "";
                while (rs.next()) {
                    String cat = rs.getString("CategoryName");
                    if (!cat.equals(currentCat)) {
                        System.out.println("\n--- Nhóm: " + cat + " ---");
                        currentCat = cat;
                    }
                    System.out.println(String.format("Xe: %s | Giá 1 ngày: %,.0f VNÐ", rs.getString("Model"), rs.getDouble("DailyPriceForDay")));
                }
            }
        }
    }
}

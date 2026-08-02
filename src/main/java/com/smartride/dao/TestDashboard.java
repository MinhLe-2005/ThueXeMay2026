import com.smartride.dao.DashboardDAO;
import com.smartride.dto.DashboardStatsData;
import com.google.gson.Gson;

public class TestDashboard {
    public static void main(String[] args) {
        DashboardDAO dao = DashboardDAO.getInstance();
        DashboardStatsData data = dao.getDashboardData("all", "", "");
        Gson gson = new Gson();
        System.out.println(gson.toJson(data));
    }
}

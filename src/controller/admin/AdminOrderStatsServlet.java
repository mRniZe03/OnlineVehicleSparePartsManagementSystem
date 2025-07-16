package controller.admin;

import java.io.IOException;
import java.util.Map;

import service.admin.AdminDashboardService;
import service.admin.AdminDashboardServiceImpl;

import com.google.gson.Gson; // ✅ FIX: Gson import

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminOrderStatsServlet")
public class AdminOrderStatsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDashboardService service = new AdminDashboardServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, Integer> orderStats = service.fetchRecentMonthlyOrderStats();
        String json = new Gson().toJson(orderStats); // ✅ Converts Map to JSON

        response.setContentType("application/json");
        response.getWriter().write(json); // ✅ Sends JSON to frontend
    }
}

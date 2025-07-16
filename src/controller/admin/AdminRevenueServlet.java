package controller.admin;

import com.google.gson.Gson;
import service.admin.AdminDashboardService;
import service.admin.AdminDashboardServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@WebServlet("/AdminRevenueServlet")
public class AdminRevenueServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
	private AdminDashboardService dashboardService = new AdminDashboardServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, Double> revenueData = dashboardService.getMonthlyRevenue();

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(new Gson().toJson(revenueData));
    }
}
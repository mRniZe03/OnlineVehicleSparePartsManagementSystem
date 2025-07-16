package controller.admin;

import service.admin.AdminDashboardService;
import service.admin.AdminDashboardServiceImpl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminDeliveryCountServlet")
public class AdminDeliveryCountServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        AdminDashboardService service = new AdminDashboardServiceImpl();
        int count = service.getPendingDeliveries();
        response.setContentType("text/plain");
        response.getWriter().print(count);
    }
}

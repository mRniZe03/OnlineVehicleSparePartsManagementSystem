package controller.admin;

import java.io.IOException;
import service.admin.AdminDashboardService;
import service.admin.AdminDashboardServiceImpl;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/AdminSupplierCountServlet")
public class AdminSupplierCountServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        AdminDashboardService service = new AdminDashboardServiceImpl();
        int count = service.getTotalSuppliers();
        response.setContentType("text/plain");
        response.getWriter().print(count);
    }
}

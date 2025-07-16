package controller.admin;

import model.CompanyOrderModel;

import service.admin.AdminOrderService;
import service.admin.AdminOrderServiceImpl;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminCompanyOrdersServlet")
public class AdminCompanyOrdersServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminOrderService service = new AdminOrderServiceImpl();
        List<CompanyOrderModel> orders = service.getAllCompanyOrders();

        request.setAttribute("companyOrders", orders);
        RequestDispatcher rd = request.getRequestDispatcher("AdminCompanyOrders.jsp");
        rd.forward(request, response);
    }
}

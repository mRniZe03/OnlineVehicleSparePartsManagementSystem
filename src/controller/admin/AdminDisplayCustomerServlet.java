package controller.admin;

import model.AdminCustomerModel;
import service.admin.AdminCustomerService;
import service.admin.AdminCustomerServiceImpl;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminDisplayCustomerServlet")
public class AdminDisplayCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminCustomerService customerService = new AdminCustomerServiceImpl();
        List<AdminCustomerModel> allCustomers = customerService.getAllCustomers();

        request.setAttribute("allcustomers", allCustomers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayCustomers.jsp");
        dispatcher.forward(request, response);
    }
}

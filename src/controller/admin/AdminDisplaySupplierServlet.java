package controller.admin;

import model.AdminSupplierModel;
import service.admin.AdminSupplierService;
import service.admin.AdminSupplierServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminDisplaySupplierServlet")
public class AdminDisplaySupplierServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AdminSupplierService service = new AdminSupplierServiceImpl();
        List<AdminSupplierModel> supplierList = service.getAllSuppliers();

        request.setAttribute("supplierList", supplierList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminManageSupplierAccounts.jsp");
        dispatcher.forward(request, response);
    }
}


package controller.admin;

import model.AdminSupplierModel;
import service.admin.AdminSupplierService;
import service.admin.AdminSupplierServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet("/AddSupplierServlet")
public class AddSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("suppliername");
        String email = request.getParameter("supplieremail");
        String username = request.getParameter("supplierusername");
        String phone = request.getParameter("supplierphone");
        String password = request.getParameter("supplierpassword");

        AdminSupplierModel supplier = new AdminSupplierModel(0,name, email, username, phone, password);

        AdminSupplierService service = new AdminSupplierServiceImpl();
        boolean success = service.addSupplier(supplier);

        if (success) {
            response.getWriter().println("<script>alert('Supplier added successfully'); window.location='AdminDisplaySupplierServlet';</script>");
        } else {
            response.getWriter().println("<script>alert('Failed to add supplier'); window.location='AdminAddSupplier.jsp';</script>");
        }
    }
}

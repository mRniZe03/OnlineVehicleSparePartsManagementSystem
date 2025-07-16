package controller.admin;

import model.AdminSupplierModel;
import service.admin.AdminSupplierService;
import service.admin.AdminSupplierServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminUpdateSupplierServlet")
public class AdminUpdateSupplierServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form values
        int supplierid = Integer.parseInt(request.getParameter("supplierid"));
        String name = request.getParameter("suppliername");
        String email = request.getParameter("supplieremail");
        String phone = request.getParameter("supplierphone");

        // Use the constructor that excludes username & password
        AdminSupplierModel supplier = new AdminSupplierModel(supplierid, name, email,null, phone,null);

        // Call service
        AdminSupplierService service = new AdminSupplierServiceImpl();
        boolean updated = service.updateSupplier(supplier);

        if (updated) {
            response.getWriter().println("<script>alert('Update successful'); location='AdminDisplaySupplierServlet';</script>");
        } else {
            response.getWriter().println("<script>alert('Update failed'); history.back();</script>");
        }

    }
}


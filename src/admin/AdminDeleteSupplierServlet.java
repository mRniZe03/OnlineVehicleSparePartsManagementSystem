package controller.admin;

import service.admin.AdminSupplierService;
import service.admin.AdminSupplierServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminDeleteSupplierServlet")
public class AdminDeleteSupplierServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int supplierid = Integer.parseInt(request.getParameter("supplierid"));

        AdminSupplierService service = new AdminSupplierServiceImpl();
        boolean deleted = service.deleteSupplier(supplierid);

        if (deleted) {
            response.sendRedirect("AdminDisplaySupplierServlet");
        } else {
            response.getWriter().println("<script>alert('Delete failed'); window.history.back();</script>");
        }
    }
}

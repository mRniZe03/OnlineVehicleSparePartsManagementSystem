package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.AdminSparePartModel;
import model.SupplierSparePartModel;
import service.admin.AdminSparePartService;
import service.admin.AdminSparePartServiceImpl;

@WebServlet("/AdminSparePartGetAllServlet")
public class AdminSparePartGetAllServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private AdminSparePartService sparePartService = new AdminSparePartServiceImpl(); // ✅ Create an instance

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // ✅ Call instance method
            List<AdminSparePartModel> parts = sparePartService.getAllSpareParts();
            request.setAttribute("allspareparts", parts);

            RequestDispatcher dispatcher = request.getRequestDispatcher("AdminSparePartManagement.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error loading spare parts: " + e.getMessage() + "');</script>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

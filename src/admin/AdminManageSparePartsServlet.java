package controller.admin;

import model.AdminSparePartModel;
import service.admin.AdminSparePartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminManageSparePartsServlet")
public class AdminManageSparePartsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	AdminSparePartServiceImpl service = new AdminSparePartServiceImpl();
    	List<AdminSparePartModel> allSpareParts = service.getAllSpareParts();


        request.setAttribute("allspareparts", allSpareParts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminSparePartManagement.jsp");
        dispatcher.forward(request, response);
    }
}

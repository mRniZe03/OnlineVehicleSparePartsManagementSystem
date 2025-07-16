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

@WebServlet("/AdminSparePartManagementServlet")
public class AdminSparePartManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    // ✅ Create service instance
	    AdminSparePartService service = new AdminSparePartServiceImpl();

	    // ✅ Call method via object
	    List<AdminSparePartModel> allSpareParts = service.getAllSpareParts();
	    request.setAttribute("allspareparts", allSpareParts);

	    // ✅ Forward to JSP
	    RequestDispatcher dispatcher = request.getRequestDispatcher("AdminSparePartManagement.jsp");
	    dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}

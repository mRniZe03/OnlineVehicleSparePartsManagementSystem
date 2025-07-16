package controller.admin;

import service.admin.AdminSparePartService;
import service.admin.AdminSparePartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminDeleteSparePartServlet")
public class AdminDeleteSparePartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String spareId = request.getParameter("spare_id");

        AdminSparePartService service = new AdminSparePartServiceImpl();
        boolean success = service.deleteSparePart(spareId);

        if (success) {

	    	   String alertMessage ="Data Delete Successful";
	    	   response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='AdminSparePartGetAllServlet';</script>");
	       
        } else {
            request.setAttribute("error", "Failed to delete spare part.");
        }    
    }
}

package controller.supplier;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SupplierSparePartModel;
import service.supplier.SparePartService;

@WebServlet("/SupplierSparePartDeleteServlet")
public class SupplierSparePartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String spare_id = request.getParameter("spare_id");
		  
	       boolean isTrue;
	       
	       isTrue= SparePartService.deletedata(spare_id);
	       
	       if(isTrue==true) {
	    	   String alertMessage ="Data Delete Successful";
	    	   response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='SupplierSparePartGetAllServlet';</script>");
	       }
	       else {
	    	   List<SupplierSparePartModel>spareparts=SparePartService.getById(spare_id);
	    	   request.setAttribute("allspareparts",spareparts);
	    	   
	    	   RequestDispatcher dispatcher= request.getRequestDispatcher("wrong.jsp");
	    	   dispatcher.forward(request,response);
	    	   
	       }
		
	}

}

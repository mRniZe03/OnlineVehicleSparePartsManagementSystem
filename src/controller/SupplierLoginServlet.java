package controller.supplier;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SupplierModel;
import service.supplier.SupplierServiceImpl;


@WebServlet("/SupplierLoginServlet")
public class SupplierLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    String supplierusername = request.getParameter("supplierusername").trim();
	        String supplierpassword = request.getParameter("supplierpassword").trim();

	        SupplierModel supplier = new SupplierServiceImpl().login(supplierusername, supplierpassword);

	        if (supplier != null) {
	            HttpSession session = request.getSession();
	            session.setAttribute("supplier", supplier);
	            session.setMaxInactiveInterval(30 * 60); // optional timeout
	            response.sendRedirect("SupplierHomePage.jsp");
	        } else {
	            response.getWriter().println("<script>alert('Invalid Username or Password.');window.location.href='SupplierLogin.jsp';</script>");
	        }
	}

}

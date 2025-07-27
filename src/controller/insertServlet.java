package controller.deliverypersonnel;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/insertServlet")
public class insertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        
		String name= request.getParameter("name");
		String email= request.getParameter("email");
		String phone= request.getParameter("phone");
		String address= request.getParameter("address");
		 // ✅ Set today's date
	    java.time.LocalDate today = java.time.LocalDate.now();
		String joining_date = today.toString();

		String password= request.getParameter("password");
		String confirmPassword= request.getParameter("confirmPassword");
		
        if (!phone.matches("\\d{10}")) {
            out.println("<h3>Phone must be 10 digits.</h3>");
            return;
        }
        
        if (!password.equals(confirmPassword)) {
            out.println("<h3>Passwords do not match.</h3>");
            return;
        }
        if (password.length() < 6) {
            out.println("<h3>Password must be at least 6 characters.</h3>");
            return;
        }
		
boolean isTrue;
		
		isTrue= deliveryController.insertdata(name, email, phone, address, joining_date,password);
		
		if(isTrue== true) {
			String alertMessage="Data inserted successful";
			response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href='deliveryallServlet'</script>");
			
		}
		else {
			RequestDispatcher dis2= request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request,response);
		}
	}

	}
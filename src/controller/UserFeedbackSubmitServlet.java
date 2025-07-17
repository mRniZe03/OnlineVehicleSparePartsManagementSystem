package controller.user;

import model.RegisteredUserModel;
import model.UserFeedbackModel;
import service.user.UserFeedbackService;
import service.user.UserFeedbackServiceImpl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserFeedbackSubmitServlet")
public class UserFeedbackSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
	        RegisteredUserModel user = (session != null) ? (RegisteredUserModel) session.getAttribute("user") : null;

	        if (user == null) {
	            response.sendRedirect("RegisteredUserLogin.jsp");
	            return;
	        }

	        String message = request.getParameter("message");
	        int rating = Integer.parseInt(request.getParameter("rating"));

	        UserFeedbackModel feedback = new UserFeedbackModel(
	            user.getId(),
	            user.getName(),
	            message,
	            rating
	        );

	        UserFeedbackService service = new UserFeedbackServiceImpl();
	        boolean success = service.insertFeedback(feedback);

	        if (success) {
	            response.getWriter().println("<script>alert('Thank you for your feedback!'); window.location.href='UserHome.jsp';</script>");
	        } else {
	            response.getWriter().println("<script>alert('Failed to submit feedback. Please try again.'); history.back();</script>");
	        }
	}

}

package controller.user;

import model.UserFeedbackModel;
import service.user.UserFeedbackService;
import service.user.UserFeedbackServiceImpl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.util.List;


@WebServlet("/UserFeedbackViewServlet")
public class UserFeedbackViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserFeedbackService service = new UserFeedbackServiceImpl();
        List<UserFeedbackModel> allFeedback = service.getAllFeedback();

        request.setAttribute("allFeedback", allFeedback);
        request.getRequestDispatcher("UserPublicFeedback.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package service.user;

import java.util.List;

import model.UserFeedbackModel;

public interface UserFeedbackService {

	boolean insertFeedback(UserFeedbackModel feedback);
	
	// New method to get all feedbacks (public)
	List<UserFeedbackModel> getAllFeedback();
}

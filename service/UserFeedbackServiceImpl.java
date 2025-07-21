package service.user;

import model.UserFeedbackModel;
import util.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.ArrayList;


public class UserFeedbackServiceImpl implements UserFeedbackService {

	@Override
    public boolean insertFeedback(UserFeedbackModel feedback) {
        boolean isSuccess = false;

        String sql = "INSERT INTO feedback (user_id, user_name, message, rating) VALUES (?, ?, ?, ?)";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, feedback.getUserId());
            ps.setString(2, feedback.getUsername());
            ps.setString(3, feedback.getMessage());
            ps.setInt(4, feedback.getRating());

            isSuccess = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
	
	//  Implementation for getting all feedbacks
    @Override
    public List<UserFeedbackModel> getAllFeedback() {
        List<UserFeedbackModel> feedbackList = new ArrayList<>();
        String sql = "SELECT feedback_id, user_name, message, rating, submitted_at FROM feedback ORDER BY submitted_at DESC";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             java.sql.ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                UserFeedbackModel feedback = new UserFeedbackModel(
                    rs.getInt("feedback_id"),
                    0, // userId is not shown
                    rs.getString("user_name"),
                    rs.getString("message"),
                    rs.getInt("rating"),
                    rs.getTimestamp("submitted_at")
                );
                feedbackList.add(feedback);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return feedbackList;
    }
}

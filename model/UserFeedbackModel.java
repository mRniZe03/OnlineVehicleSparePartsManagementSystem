package model;

import java.sql.Timestamp;

public class UserFeedbackModel {

	private int feedbackId;
    private int userId;
    private String username;
    private String message;
    private int rating;
    private Timestamp submittedAt;
    
 // Constructor with all fields
    public UserFeedbackModel(int feedbackId, int userId, String username, String message, int rating, Timestamp submittedAt) {
        this.feedbackId = feedbackId;
        this.userId = userId;
        this.username = username;
        this.message = message;
        this.rating = rating;
        this.submittedAt = submittedAt;
    }
    
    // Constructor without feedbackId (for inserts)
    public UserFeedbackModel(int userId, String username, String message, int rating) {
        this.userId = userId;
        this.username = username;
        this.message = message;
        this.rating = rating;
    }

    //Getters and Setters
	public int getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Timestamp getSubmittedAt() {
		return submittedAt;
	}

	public void setSubmittedAt(Timestamp submittedAt) {
		this.submittedAt = submittedAt;
	}

    
}

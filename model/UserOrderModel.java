package model;

import java.math.BigDecimal;
import java.util.Date;


public class UserOrderModel {

	private String orderId;
    private int userId;
    private String userName;
    private Date orderDate;
    private BigDecimal total;
    private String status;
    
    
	public UserOrderModel(String orderId, int userId, String userName, Date orderDate, BigDecimal total,
			String status) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.userName = userName;
		this.orderDate = orderDate;
		this.total = total;
		this.status = status;
	}


	public String getOrderId() {
		return orderId;
	}


	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public Date getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	public BigDecimal getTotal() {
		return total;
	}


	public void setTotal(BigDecimal total) {
		this.total = total;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
    
	
    
    
}

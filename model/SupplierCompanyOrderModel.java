package model;


import java.sql.Date;

public class SupplierCompanyOrderModel {
	private String request_id;
    private String spare_id;
    private int adminid;
    private int supplierid;
    private int amount;
    private String status;
    private String reason;
    private Date orderdate;
    private String category;
    private int originalQuantity;
    
    

    // Constructor, Getters & Setters
    public SupplierCompanyOrderModel(String request_id, String spare_id, int adminid, int supplierid, int amount, String status, String reason) {
        this.request_id = request_id;
        this.spare_id = spare_id;
        this.adminid = adminid;
        this.supplierid = supplierid;
        this.amount = amount;
        this.status = status;
        this.reason = reason;
       
       
     }

    public SupplierCompanyOrderModel() {
    }


	public String getRequest_id() {
		return request_id;
	}



	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}



	public String getSpare_id() {
		return spare_id;
	}



	public void setSpare_id(String spare_id) {
		this.spare_id = spare_id;
	}



	public int getAdminid() {
		return adminid;
	}



	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}



	public int getSupplierid() {
		return supplierid;
	}



	public void setSupplierid(int supplierid) {
		this.supplierid = supplierid;
	}



	public int getAmount() {
		return amount;
	}



	public void setAmount(int amount) {
		this.amount = amount;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getReason() {
		return reason;
	}



	public void setReason(String reason) {
		this.reason = reason;
	}



	public Date getOrderdate() {
		return orderdate;
	}



	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public int getOriginalQuantity() {
		return originalQuantity;
	}



	public void setOriginalQuantity(int originalQuantity) {
		this.originalQuantity = originalQuantity;
	}

   
	 
}

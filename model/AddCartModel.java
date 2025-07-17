package model;

import java.math.BigDecimal;

public class AddCartModel {
	private int cart_id;
    private String part_id;
    private int user_id;
    private String user_name;
    private String part_name;
    private String category;
    private int quantity;
    private BigDecimal unitprice;
    private BigDecimal linetotal;
    
	public AddCartModel(String part_id, int user_id, String user_name, String part_name, String category, int quantity,
			BigDecimal unitprice, BigDecimal linetotal) {
		super();
		this.part_id = part_id;
		this.user_id = user_id;
		this.user_name = user_name;
		this.part_name = part_name;
		this.category = category;
		this.quantity = quantity;
		this.unitprice = unitprice;
		this.linetotal = linetotal;
	}

	public String getPart_id() {
		return part_id;
	}

	public void setPart_id(String part_id) {
		this.part_id = part_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPart_name() {
		return part_name;
	}

	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(BigDecimal unitprice) {
		this.unitprice = unitprice;
	}

	public BigDecimal getLinetotal() {
		return linetotal;
	}

	public void setLinetotal(BigDecimal linetotal) {
		this.linetotal = linetotal;
	}
    
	
    

}

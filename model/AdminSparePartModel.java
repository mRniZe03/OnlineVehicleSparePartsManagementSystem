package model;

import java.math.BigDecimal;

public class AdminSparePartModel {
	private String spare_id;
    private String name;
    private BigDecimal price;
    private String category;
    private int quantity;
    private String description;
    private byte[] spare_photo;
    private String photoBase64;
    private int supplierid;
    private String status;

    public AdminSparePartModel(String spare_id, String name, BigDecimal price, String category,int quantity, String description, byte[]spare_photo,String photoBase64,int supplierid,String status) {
        this.spare_id = spare_id;
        this.name = name;
        this.price = price;
        this.category = category;
        this.quantity = quantity;
        this.description = description;
        this.spare_photo = spare_photo;
        this.photoBase64 = photoBase64;
        this.supplierid = supplierid;
       
    }

    // Getters and setters
    public String getSpare_id() { 
    	return spare_id; 	
    }
    public void setSpare_id(String spare_id) {
    	this.spare_id = spare_id; 
    }
    public String getName() { 
    	return name; 
    }
    public void setName(String name) {
    	this.name = name; 
    }
    public BigDecimal getPrice() {
    	return price; 
    }
    public void setPrice(BigDecimal price) {
    	this.price = price; 
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
    public String getDescription() {
    	return description; 
    }
    public void setDescription(String description) {
    	this.description = description; 
    }
    public byte[] getPhoto() {
        return spare_photo;
    }
    public void setPhoto(byte[] spare_photo) {
        this.spare_photo = spare_photo;
    }
    public String getPhotoBase64() {
        return photoBase64;
    }
    
    public void setPhotoBase64(String photoBase64) {
        this.photoBase64 = photoBase64;
    }
    public int getSupplierid() {
	    return supplierid;
    }
    public void setSupplierid(int supplierid) {
	    this.supplierid=supplierid;
    }
    
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}

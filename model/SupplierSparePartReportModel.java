package model;

import java.util.Date;

public class SupplierSparePartReportModel {
    private String notification_id;
    private String request_id;
    private String spare_id;
    private int adminid;
    private int amount;
    private Date orderdate;
    private String category;
    private String name;
    private int previousQuantity;

    // Getter and Setter for notification_id
    public String getNotification_id() {
        return notification_id;
    }

    public void setNotification_id(String notification_id) {
        this.notification_id = notification_id;
    }

    // Getter and Setter for request_id
    public String getRequest_id() {
        return request_id;
    }

    public void setRequest_id(String request_id) {
        this.request_id = request_id;
    }

    // Getter and Setter for spare_id
    public String getSpare_id() {
        return spare_id;
    }

    public void setSpare_id(String spare_id) {
        this.spare_id = spare_id;
    }

    // Getter and Setter for adminid
    public int getAdminid() {
        return adminid;
    }

    public void setAdminid(int adminid) {
        this.adminid = adminid;
    }

    // Getter and Setter for amount
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    // Getter and Setter for orderdate
    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    // Getter and Setter for category
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    // Getter and Setter for name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter for previousQuantity
    public int getPreviousQuantity() {
        return previousQuantity;
    }

    public void setPreviousQuantity(int previousQuantity) {
        this.previousQuantity = previousQuantity;
    }
}


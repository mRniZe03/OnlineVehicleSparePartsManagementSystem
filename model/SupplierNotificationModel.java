package model;

public class SupplierNotificationModel {
    private String notification_id;
    private String request_id;
    private int supplierid;
    private String action_status;

    public SupplierNotificationModel() {}

    public SupplierNotificationModel(String notification_id, String request_id, int supplierid, String action_status) {
        this.notification_id = notification_id;
        this.request_id = request_id;
        this.supplierid = supplierid;
        this.action_status = action_status;
    }

    public String getNotification_id() {
        return notification_id;
    }

    public void setNotification_id(String notification_id) {
        this.notification_id = notification_id;
    }

    public String getRequest_id() {
        return request_id;
    }

    public void setRequest_id(String request_id) {
        this.request_id = request_id;
    }

    public int getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(int supplierid) {
        this.supplierid = supplierid;
    }

    public String getAction_status() {
        return action_status;
    }

    public void setAction_status(String action_status) {
        this.action_status = action_status;
    }
}

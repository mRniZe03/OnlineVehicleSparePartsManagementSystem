package model;

import java.math.BigDecimal;
import java.util.Date;

public class UserProductModel {

	    private String orderId;
	    private int userId;
	    private String partId;
	    private String partName;
	    private BigDecimal unitPrice;
	    private int quantity;
	    private BigDecimal lineTotal;
	    private String email, phone, firstName, lastName;
	    private String streetAddress, city, postcode, country, province;
	    private String paymentMethod;
	    private Date orderDate;
	    
	    
		public UserProductModel(String orderId, int userId, String partId, String partName, BigDecimal unitPrice,
				int quantity, BigDecimal lineTotal, String email, String phone, String firstName, String lastName,
				String streetAddress, String city, String postcode, String country, String province,
				String paymentMethod, Date orderDate) {
		
			this.orderId = orderId;
			this.userId = userId;
			this.partId = partId;
			this.partName = partName;
			this.unitPrice = unitPrice;
			this.quantity = quantity;
			this.lineTotal = lineTotal;
			this.email = email;
			this.phone = phone;
			this.firstName = firstName;
			this.lastName = lastName;
			this.streetAddress = streetAddress;
			this.city = city;
			this.postcode = postcode;
			this.country = country;
			this.province = province;
			this.paymentMethod = paymentMethod;
			this.orderDate = orderDate;
		}


		public String getOrderId() {
			return orderId;
		}


		public int getUserId() {
			return userId;
		}


		public String getPartId() {
			return partId;
		}


		public String getPartName() {
			return partName;
		}


		public BigDecimal getUnitPrice() {
			return unitPrice;
		}


		public int getQuantity() {
			return quantity;
		}


		public BigDecimal getLineTotal() {
			return lineTotal;
		}


		public String getEmail() {
			return email;
		}


		public String getPhone() {
			return phone;
		}


		public String getFirstName() {
			return firstName;
		}


		public String getLastName() {
			return lastName;
		}


		public String getStreetAddress() {
			return streetAddress;
		}


		public String getCity() {
			return city;
		}


		public String getPostcode() {
			return postcode;
		}


		public String getCountry() {
			return country;
		}


		public String getProvince() {
			return province;
		}


		public String getPaymentMethod() {
			return paymentMethod;
		}


		public Date getOrderDate() {
			return orderDate;
		}
	    
	    
}

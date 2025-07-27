package model;

public class deliveryModel {
	

		private int id;
		private String name;
		private String email;
		private String phone;
		private String address;
		private String joining_date;
		private String password;
		

		
		public deliveryModel(int id, String name, String email, String phone, String address, String joining_date,String password ) {
			super();
			this.id = id;
			this.name = name;
			this.email = email;
			this.phone = phone;
			this.address = address;
			this.joining_date = joining_date;
			this.password = password;
		   
		}
		
		
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getJoining_date() {
			return joining_date;
		}

		public void setJoining_date(String joining_date) {
			this.joining_date = joining_date;
		}


		public String getPassword() {
			return password;
		}


		public void setPassword(String password) {
			this.password = password;
		}


	
		
		
		
		
	}



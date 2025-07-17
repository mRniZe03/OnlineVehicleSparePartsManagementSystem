package model;

public class RegisteredUserModel extends UserModel {

	    private int id;
	    private String username;
	    private String password;
	    private String address;
	    private String contactNo;
	    
		public RegisteredUserModel(String name, String email, int id, String username, String password, String address,
				String contactNo) {
			super(name, email);
			this.id = id;
			this.username = username;
			this.password = password;
			this.address = address;
			this.contactNo = contactNo;
		}
	    
		@Override
	    public String getUserType() {
	        return "Registered";
	    }

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getContactNo() {
			return contactNo;
		}

		public void setContactNo(String contactNo) {
			this.contactNo = contactNo;
		}
		
		
	    
}

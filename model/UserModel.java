package model;

public abstract class UserModel {
	protected String name;
    protected String email;
    
	public UserModel(String name, String email) {
		super();
		this.name = name;
		this.email = email;
	}
	
	public abstract String getUserType();

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

	public void displayProfile() {
		// TODO Auto-generated method stub
		
	}
	
	
    

}

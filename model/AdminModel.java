package model;

public class AdminModel extends User {
    private String username;
    private String password;

    public AdminModel(int id, String name, String email, String username, String password) {
        super(id, name, email); // Calls User class constructor
        this.username = username;
        this.password = password;
    }

    @Override
    public void displayProfile() {
        System.out.println("Admin Profile:");
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Username: " + username);
    }

    // Getters and Setters
    public String getUsername() { return username; }
    public String getPassword() { return password; }

    public void setUsername(String username) { this.username = username; }
    public void setPassword(String password) { this.password = password; }

	
	
}

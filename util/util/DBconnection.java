package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
	private static String url="jdbc:mysql://localhost:3306/vehiclespareparts";
	private static String user="root";
	private static String password="sri123";
	
	private static Connection con;
	//error handling part
	public static Connection getConnection () {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con =DriverManager.getConnection(url, user, password);
		}
		catch(Exception e) {
			System.out.println("Database not connect");
		}
		return con;
	}

}

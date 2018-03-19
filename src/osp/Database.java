package osp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
	private Connection conn = null;
	private String status = "";
	
	
	public Database(){
		
	}
	
	public Connection connect()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","");
			status = "OK : Connected";
			return conn;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status = "ERROR : Class Not Found";
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			status = "ERROR : SQL Problem";
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean destroy()
	{
		try {
			conn.close();
			status += " OK";
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			status += " ERROR";
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
}

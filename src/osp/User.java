package osp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class User {
	private int u_id;
	private String u_fname = null;
	private String u_lname = null;
	private String email = null;
	private String password = null;
	private long contact;
	private char gender;
	private int r_id ;
	private String status = "";
	
	private Database db = null;
	
	private Connection conn = null;
	
	public User()
	{
		db = new Database();
		conn = db.connect();
		if(db.getStatus().contains("ERROR"))
		{
			status += "ERROR : Something went wrong. ";
		}
	}
	
	public String register()
	{
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String result = null;
		
		if( (conn = db.connect()) != null )
		{
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select * from registered_user");
				while(rs.next())
				{
					if(rs.getString(4).equals(email))
					{
						result = "ERROR : Email Id entered already exists!";
						return result;
					}
				}
				pstmt = conn.prepareStatement("INSERT INTO `registered_user` (`u_fname`, `u_lname`, `email`, `password`, `contact`, `gender`, `r_id`) VALUES (?,?,?,?,?,?,?)");
				pstmt.setString(1, u_fname);
				pstmt.setString(2, u_lname);
				pstmt.setString(3, email);
				pstmt.setString(4, password);
				pstmt.setLong(5, contact);
				pstmt.setString(6, ""+gender);
				pstmt.setInt(7, 1001);
				if(pstmt.executeUpdate() > 0)
					return "SUCCESS : You are Registered.";
				else
					return "ERROR : Query Failed";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "ERROR : Something went wrong!";
			}
		}
		else
		{
			return "ERROR : Connection not Successfull";
		}
	}
	
	public String login()
	{
		
		return "SUCCESS";
	}
	
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @return the u_fname
	 */
	public String getU_fname() {
		return u_fname;
	}

	/**
	 * @return the u_lname
	 */
	public String getU_lname() {
		return u_lname;
	}

	/**
	 * @param u_fname the u_fname to set
	 */
	public void setU_fname(String u_fname) {
		this.u_fname = u_fname;
	}

	/**
	 * @param u_lname the u_lname to set
	 */
	public void setU_lname(String u_lname) {
		this.u_lname = u_lname;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @param contact the contact to set
	 */
	public void setContact(long contact) {
		this.contact = contact;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(char gender) {
		this.gender = gender;
	}
}

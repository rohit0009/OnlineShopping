package osp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*;

public class SearchCustomer
{
	private String searchedValue = null;
	private String c_fname = null;
	private String c_lname = null;
	private String status = "";
	
	private Database db = null;
	private Connection conn = null;
	
	public SearchCustomer()
	{
		db = new Database();
		conn = db.connect();
		if(db.getStatus().contains("ERROR"))
		{
			status += "ERROR : Something went wrong.";
		}
	}
	
	public void displayCustomer()
	{
		Statement stmt = null;
		ResultSet rs = null;
		
		if(conn != null)
		{
			try
			{
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select * from registered_user");
				while(rs.next())
				{
					if(rs.getString(2).equals(c_fname))
					{
						System.out.println(rs.getString("u_id"));
						System.out.println(rs.getString("u_fname"));
						System.out.println(rs.getString("u_lname"));
						System.out.println(rs.getString("email"));
						System.out.println(rs.getString("password"));
						System.out.println(rs.getString("contact"));
						System.out.println(rs.getString("gender"));
						System.out.println(rs.getString("r_id"));
					}
				}
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
				db.destroy();
				System.out.println("ERROR : Connection not Successful");
			}
		}
		else
		{
			db.destroy();
			System.out.println("ERROR : Connection not Successful");
		}
	}
	
	public String getStatus()
	{
		return status;
	}

	/**
	 * @return the u_fname
	 */
	public String get_fname()
	{
		return c_fname;
	}

	/**
	 * @return the u_lname
	 */
	/*public String get_lname()
	{
		return c_lname;
	}*/
	
	public void set_fname(String c_fname)
	{
		this.c_fname = c_fname;
	}

	/**
	 * @param u_lname the u_lname to set
	 */
	/*public void set_lname(String c_lname)
	{
		this.c_lname = c_lname;
	}*/
}

package osp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
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
	HashMap<Integer,String> hmap = new HashMap<Integer,String>();
	
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
						hmap.put(1,rs.getString("u_id"));
						hmap.put(2,rs.getString("u_fname"));
						hmap.put(3,rs.getString("u_lname"));
						hmap.put(4,rs.getString("email"));
						hmap.put(5,rs.getString("password"));
						hmap.put(6,rs.getString("contact"));
						hmap.put(7,rs.getString("gender"));
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
	
	public void setCustID()
	{
		for(Map.Entry m:hmap.entrySet())
		{
			System.out.println(m.getValue());
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

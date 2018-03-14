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
	private String c_attr = null;

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
	
	public HashMap<Integer, HashMap<String , String>> displayCustomer()
	{
		HashMap<Integer ,HashMap<String , String>> hmap = new HashMap<Integer , HashMap<String , String>>();
		Statement stmt = null;
		ResultSet rs = null;
		hmap = new HashMap<Integer , HashMap<String , String>>();
		hmap.put(null, null);
		
		int counter = 0;
		if(conn != null)
		{
			try
			{
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select * from registered_user where "+c_attr+" LIKE '"+searchedValue+"' and r_id = 1002");
				
				
				while(rs.next())
				{
					HashMap<String, String> internal_map = new HashMap<String , String>();
					
					internal_map.put("u_id" , ""+rs.getInt("u_id"));
					internal_map.put("u_fname" , rs.getString("u_fname"));
					internal_map.put("u_lname" , rs.getString("u_lname"));
					internal_map.put("email" , rs.getString("email"));
					//internal_map.put("password" , rs.getString("password"));
					internal_map.put("contact" , rs.getString("contact"));
					internal_map.put("gender" , rs.getString("gender"));
					counter++;
					hmap.put(counter, internal_map);
				}
				status = "OK : SUCCESS";
				return hmap;
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
				db.destroy();
				status = "ERROR : Connection not Successful";
				return hmap;
			}
		}
		else
		{
			db.destroy();
			status= "ERROR : Connection not Successful";
			return hmap;
		}
	}
	
	
	public String getStatus()
	{
		return status;
	}

	public String getC_attr()
	{
		return c_attr;
	}

	public void setC_attr(String c_attr)
	{
		this.c_attr = c_attr;
	}
	
	public void setSearchedValue(String searchedValue)
	{
		this.searchedValue = searchedValue;
	}
}
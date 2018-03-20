package osp;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class Coupon
{
	String coupon_desc="";
	float discount;
	int from_amount,to_amount;
	String status = "";
	
	String coupDesc = "";
	
	

	Database db = null;
	Connection conn = null;
	
	public Coupon()
	{
		db = new Database();
		conn = db.connect();
		if(db.getStatus().contains("ERROR"))
		{
			status += "ERROR : Something went wrong. ";
		}
	}
	
	public String add()
	{
		Statement st = null;
		Statement st1 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		
		// TODO Auto-generated method stub
		try
		{
			st = conn.createStatement();
			st1 = conn.createStatement();
			
			rs = st.executeQuery("SELECT * from coupon where from_amount BETWEEN "+from_amount+" and "+to_amount);
			rs1 = st1.executeQuery("SELECT * from coupon where to_amount BETWEEN "+from_amount+" and "+to_amount);
			
			if(rs == null)
				System.out.println("null");
			
			if(rs1 == null)
				System.out.println("null");
			
			while(rs.next())
			{
				status = "ERROR : COUPON cannot be added! Please try again";
				return status;
			}
			
			while(rs1.next())
			{
				status = "ERROR : COUPON cannot be added! Please try again";
				return status;
			}
			
			int res = st.executeUpdate("INSERT INTO `coupon` (`coupon_desc`, `discount`, `from_amount`, `to_amount`, `is_active`) VALUES ('"+coupon_desc+"', "+discount+", "+from_amount+", "+to_amount+", 1)");
			if(res > 0)
			{
				status = "SUCCESS : Coupon added SUCESSFULLY";
				return status;
			}
			status = "ERROR : QUERY FAILED";
			return status;
		}
		catch (Exception e)
		{
			// TODO: handle exception
			status = "ERROR : Something went wrong";
			e.printStackTrace();
			return status;
		}
		
	}
	
	public HashMap<String, HashMap<String , String>> displayCoupon()
	{
		HashMap<String ,HashMap<String , String>> hmap = new HashMap<String , HashMap<String , String>>();
		Statement stmt = null;
		ResultSet rs = null;
		hmap = new HashMap<String , HashMap<String , String>>();
		hmap.put(null, null);
		
		int counter = 0;
		if(conn != null)
		{
			try
			{
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select * from coupon");
				
				
				while(rs.next())
				{
					HashMap<String, String> internal_map = new HashMap<String , String>();
					
					internal_map.put("coupon_id" , ""+rs.getInt("coupon_id"));
					internal_map.put("coupon_desc" , ""+rs.getString("coupon_desc"));
					internal_map.put("discount" , ""+rs.getInt("discount"));
					internal_map.put("from_amount" , ""+rs.getDouble("from_amount"));
					internal_map.put("to_amount" , ""+rs.getDouble("to_amount"));
					internal_map.put("is_active" , ""+rs.getInt("is_active"));

					counter++;
					hmap.put(""+counter, internal_map);
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
	
	public String getCoupDesc() {
		return coupDesc;
	}

	public void setCoupDesc(String coupDesc) {
		this.coupDesc = coupDesc;
	}
	
	public String getCoupon_desc() {
		return coupon_desc;
	}
	public void setCoupon_desc(String coupon_desc) {
		this.coupon_desc = coupon_desc;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public int getFrom_amount() {
		return from_amount;
	}
	public void setFrom_amount(int from_amount) {
		this.from_amount = from_amount;
	}
	public int getTo_amount() {
		return to_amount;
	}
	public void setTo_amount(int to_amount) {
		this.to_amount = to_amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}

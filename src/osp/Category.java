package osp;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Category {
	private int cat_id;
	private String cat_name = "",cat_desc = "";
	Database db;
	Connection conn=null;
	private ResultSet rs = null;
	private Statement st = null;
	
	
	public Category()
	{
		db = new Database();
		conn = db.connect();
	}
	
	public String[] get_categories(String ideal_for)
	{
		String arr[];
		if("".equalsIgnoreCase(ideal_for))
		{
			arr = new String[] {};
			return arr;
		}
		
		String pattern = "\\b"+ideal_for+"\\b";
        Pattern p=Pattern.compile(pattern,Pattern.CASE_INSENSITIVE);
        Matcher m;
        List<String> list = new ArrayList<String>();
		try {
			st = conn.createStatement();
			rs = st.executeQuery("select cat_name from category");
			
			while(rs.next())
			{
				m=p.matcher(rs.getString(1));
				if(m.find())
				{
					list.add(rs.getString(1));
				}
			}
			arr = new String[list.size()];
			list.toArray(arr);
			return arr;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			arr = new String[] {};
			return arr;
		}
	}
	
	
	/**
	 * @return the cat_id
	 */
	public int getCat_id() {
		return cat_id;
	}
	/**
	 * @return the cat_name
	 */
	public String getCat_name() {
		return cat_name;
	}
	/**
	 * @return the cat_desc
	 */
	public String getCat_desc() {
		return cat_desc;
	}
	/**
	 * @param cat_id the cat_id to set
	 */
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}
	/**
	 * @param cat_name the cat_name to set
	 */
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	/**
	 * @param cat_desc the cat_desc to set
	 */
	public void setCat_desc(String cat_desc) {
		this.cat_desc = cat_desc;
	}
	
	
}

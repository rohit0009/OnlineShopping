package osp;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Category {
	private int cat_id;
	private String cat_name = "",cat_desc = "";
	Database db;
	Connection conn=null;
	ResultSet rs = null;
	Statement st = null;
	
	
	public Category()
	{
		db = new Database();
		conn = db.connect();
	}
	
	public String[] get_categories(String ideal_for)
	{
		String arr[] = new String[]{"asd","ad"};
		
		return arr;
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

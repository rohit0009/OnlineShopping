package osp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;


public class Product extends Category{
	
	private int pid,s_id,cat_id,i_id;
	private String pname = "",ideal_for = "",fabric = "",color = "",description = "",image_path = "",image_path_2 = "",image_path_3= "";
	private String brand ="",size="";
	private double price;
	private int total_items_order,items_left;
	
	private PreparedStatement p_inv = null;
	private PreparedStatement p_product = null;
	private ResultSet rs = null;
	private Statement stmt = null;
	
	private String status = "";
	
	public Product()
	{
		if(conn == null)
		{
			status = "ERROR : Something went wrong";
		}
		else
		{
			status = "SUCCESS : Ok";
		}
	}
	
	
	public String add()
	{
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from product");
			while(rs.next())
			{
				if(rs.getString("pname").equalsIgnoreCase(pname) && rs.getString("ideal_for").equalsIgnoreCase(ideal_for) && rs.getString("size").equalsIgnoreCase(size) && rs.getString("fabric").equalsIgnoreCase(fabric) && rs.getString("color").equalsIgnoreCase(color) && rs.getString("brand").equalsIgnoreCase(brand) )
				{
					status = "ERROR : This Product already EXISITS";
					return status;
				}
			}
			p_product = conn.prepareStatement("INSERT INTO `product` ( `pname`, `ideal_for`, `size`, `fabric`, `color`, `description`, `image_path`, `image_path_2`, `image_path_3`, `brand`, `s_id`, `cat_id`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);
			p_product.setString(1, pname);
			p_product.setString(2, ideal_for);
			p_product.setString(3, size);
			p_product.setString(4, fabric);
			p_product.setString(5, color);
			p_product.setString(6, description);
			p_product.setString(7, image_path);
			p_product.setString(8, image_path_2);
			p_product.setString(9, image_path_3);
			p_product.setString(10, brand);
			p_product.setInt(11, s_id);
			p_product.setInt(12, cat_id);
			int res = p_product.executeUpdate();
			if(res > 0)
			{
				ResultSet rs_p_id = p_product.getGeneratedKeys();
				int new_key;
				rs_p_id.next();
				
				new_key = rs_p_id.getInt(1);
				
				p_inv = conn.prepareStatement("INSERT INTO `inventory` (`price`, `total_items_ordered`, `items_left`, `p_id`) VALUES (?, ?, ?, ?)");
				p_inv.setDouble(1, price);
				p_inv.setInt(2, total_items_order);
				p_inv.setInt(3, total_items_order);
				p_inv.setInt(4, new_key);
				int inv_res = p_inv.executeUpdate();
				if(inv_res > 0)
				{
					status = "SUCCESS : Product added.";
					return status;
				}
				else
				{
					status = "ERROR : QUERY FAILED";
					return status;
				}
			}
			status = "ERROR : QUERY FAILED";
			return status;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status = "ERROR : QUERY FAILED";
			return status;
		}
		finally {
			try {
				if(p_inv != null)
					p_inv.close();
				if(p_product != null)
					p_product.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	public int get_Cat_id(String cat_name)
	{
		cat_name = cat_name.trim();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select cat_id,cat_name from category");
			while(rs.next())
			{
				if(cat_name.equals(rs.getString(2)))
				{
					status = "SUCCESS : OK";
					return rs.getInt(1);
				}
			}
			status = "ERROR : Category NOT FOUND";
			return -1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			status = "ERROR : QUERY FAILED";
			e.printStackTrace();
			return -1;
		}
	}
	
	
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @return the pid
	 */
	public int getPid() {
		return pid;
	}
	/**
	 * @return the s_id
	 */
	public int getS_id() {
		return s_id;
	}
	
	/**
	 * @return the i_id
	 */
	public int getI_id() {
		return i_id;
	}
	/**
	 * @param pid the pid to set
	 */
	public void setPid(int pid) {
		this.pid = pid;
	}
	/**
	 * @param s_id the s_id to set
	 */
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	/**
	 * @param cat_id the cat_id to set
	 */
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}
	/**
	 * @param i_id the i_id to set
	 */
	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	/**
	 * @param pname the pname to set
	 */
	public void setPname(String pname) {
		this.pname = pname;
	}
	/**
	 * @param ideal_for the ideal_for to set
	 */
	public void setIdeal_for(String ideal_for) {
		this.ideal_for = ideal_for;
	}
	/**
	 * @param fabric the fabric to set
	 */
	public void setFabric(String fabric) {
		this.fabric = fabric;
	}
	/**
	 * @param color the color to set
	 */
	public void setColor(String color) {
		this.color = color;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	
	/**
	 * @param image_path the image_path to set
	 */
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	/**
	 * @param image_path_2 the image_path_2 to set
	 */
	public void setImage_path_2(String image_path_2) {
		this.image_path_2 = image_path_2;
	}
	/**
	 * @param image_path_3 the image_path_3 to set
	 */
	public void setImage_path_3(String image_path_3) {
		this.image_path_3 = image_path_3;
	}
	/**
	 * @param brand the brand to set
	 */
	public void setBrand(String brand) {
		this.brand = brand;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}
	/**
	 * @param size the size to set
	 */
	public void setSize(String size) {
		this.size = size;
	}
	/**
	 * @param total_items_order the total_items_order to set
	 */
	public void setTotal_items_order(int total_items_order) {
		this.total_items_order = total_items_order;
	}
	/**
	 * @param items_left the items_left to set
	 */
	public void setItems_left(int items_left) {
		this.items_left = items_left;
	}
	
	
}

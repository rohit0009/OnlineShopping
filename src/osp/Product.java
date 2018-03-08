package osp;

public class Product extends Category{
	
	private int pid,s_id,cat_id,i_id;
	private String pname = "",ideal_for = "",fabric = "",color = "",description = "",neck_type = "",image_path = "",image_path_2 = "",image_path_3= "";
	private String brand ="";
	private double price;
	private int size,total_items_order,items_left;
	
	
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
		
		
		
		return "SUCCESS : Product added.";
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
	 * @return the cat_id
	 */
	public int getCat_id() {
		return cat_id;
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
	 * @param neck_type the neck_type to set
	 */
	public void setNeck_type(String neck_type) {
		this.neck_type = neck_type;
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
	public void setSize(int size) {
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

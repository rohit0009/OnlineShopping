package osp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*; 

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
		
		if( conn != null )
		{
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select * from registered_user");
				while(rs.next())
				{
					if(rs.getString(4).equals(email))
					{
						db.destroy();
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
				{
					String msg = "<html><body style='border: 2px solid #228B22;padding: 50px;'><p style='font-size: 30px;color: #4CAF50;text-align: center'>WELCOME to Online Shopping</p><div style='text-indent: 50px;text-align: justify;letter-spacing: 2px;'>Hello "+u_fname+" "+u_lname+" you have successfully registerd.<br>Details are:<br>Email is : "+email+"<br>Password is : "+password+"<br>Thankyou for Registration.</div></body></html>";
					if (MyMailer.send("shoponlineimcc@gmail.com","imccshop",email,"Registration Details",msg).contains("ERROR")) // sender E-mail, password, to E-mail, subject, message
					{
						db.destroy();
						return "SUCCESS : You are Registered. ERROR : Failed to send Mail.";
					}
					db.destroy();
					return "SUCCESS : You are Registered.";
				}
				else
				{
					db.destroy();
					return "ERROR : Query Failed";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				db.destroy();
				return "ERROR : Something went wrong!";
			}
		}
		else
		{
			db.destroy();
			return "ERROR : Connection not Successful";
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
class MyMailer{  
    public static String send(String from,String password,String to,String sub,String msg)
    {
          Properties props = new Properties();    
          props.put("mail.smtp.host" , "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port" , "465");    
          props.put("mail.smtp.socketFactory.class" , "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");
          
          Session session = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(from,password);  
           }    
          });
          try {    
              MimeMessage message = new MimeMessage(session);
              message.setContent(msg, "text/html; charset=utf-8");
              message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
              message.setSubject(sub);
              Transport.send(message);
             }
          catch (MessagingException e)
          {
        	  	e.printStackTrace();
        	  	return "ERROR : Runtime Error occured while sending mail";
        	  }
          return "SUCCESS : Mail Sent.";
       }  
}
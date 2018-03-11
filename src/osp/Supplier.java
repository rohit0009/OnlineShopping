package osp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import javax.mail.*;    
import javax.mail.internet.*;

public class Supplier
{
	private int s_id;
	private String s_fname = null;
	private String s_lname = null;
	private String s_email = null;
	private long s_contact;
	private String status = "";
	
	private Database db = null;
	private Connection conn = null;
	
	public Supplier()
	{
		db = new Database();
		conn = db.connect();
		if(db.getStatus().contains("ERROR"))
		{
			status += "ERROR : Something went wrong.";
		}
	}
	
	public String addSupplier()
	{
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String result = null;
		
		if( conn != null )
		{
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select * from supplier");
				while(rs.next())
				{
					if(rs.getString(4).equals(s_email))
					{
						db.destroy();
						result = "ERROR : Email Id entered already exists!";
						return result;
					}
				}
				pstmt = conn.prepareStatement("INSERT INTO `supplier` (`s_fname`, `s_lname`, `s_email`, `s_contact`) VALUES (?,?,?,?)");
				pstmt.setString(1, s_fname);
				pstmt.setString(2, s_lname);
				pstmt.setString(3, s_email);
				pstmt.setLong(4, s_contact);
				if(pstmt.executeUpdate() > 0)
				{
					String msg = "<html><body style='border: 2px solid #228B22;padding: 50px;'><p style='font-size: 30px;color: #4CAF50;text-align: center'>WELCOME to Online Shopping</p><div style='text-indent: 50px;text-align: justify;letter-spacing: 2px;'>Hello "+s_fname+" "+s_lname+" you have successfully registerd.<br>Details are:<br>Email is : "+s_email+"<br>Thankyou for Registration.</div></body></html>";
					if (MyMailers.send("shoponlineimcc@gmail.com","imccshop",s_email,"Registration Details",msg).contains("ERROR")) // sender E-mail, password, to E-mail, subject, message
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
	
	/**
	 * @return the status
	 */
	public String getStatus()
	{
		return status;
	}

	/**
	 * @return the u_fname
	 */
	public String getS_fname()
	{
		return s_fname;
	}

	/**
	 * @return the u_lname
	 */
	public String getS_lname()
	{
		return s_lname;
	}

	/**
	 * @param u_fname the u_fname to set
	 */
	public void setS_fname(String s_fname)
	{
		this.s_fname = s_fname;
	}

	/**
	 * @param u_lname the u_lname to set
	 */
	public void setS_lname(String s_lname)
	{
		this.s_lname = s_lname;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String s_email)
	{
		this.s_email = s_email;
	}

	/**
	 * @param contact the contact to set
	 */
	public void setContact(long s_contact)
	{
		this.s_contact = s_contact;
	}
}

class MyMailers
{  
    public static String send(String from,String password,String to,String sub,String msg)
    {
          Properties props = new Properties();    
          props.put("mail.smtp.host" , "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port" , "465");    
          props.put("mail.smtp.socketFactory.class" , "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");
          
          Session session = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator(){    
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
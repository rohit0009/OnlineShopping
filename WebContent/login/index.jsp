<%@page import="osp.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("u_id") != null)
		response.sendRedirect("..");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Login Page</title>
	<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<style>
		@media (min-width: 1200px){
			.container {
			    width: 400px;
			}
		}
	</style>

	<script>
		function validate()
		{
			var email=document.getElementById("email");
			var pass=document.getElementById("password");
			
			if(email.value == '' && pass.value == '')
			{
				document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Please enter all fields.</div>';
			}
			else
			{
				if(ValidateEmail(email)) 
				{
					if(passid_validation(pass,8,12))
					{
						return true;
					}
				}
			}
			
			return false;
		}
		function passid_validation(passid,mx,my)  
		{  
			var passid_len = passid.value.length;  
			if (passid_len == 0 ||passid_len >= my || passid_len < mx)  
			{  
				document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Password should not be empty / length be between '+mx+' to '+my+'</div>';
				passid.focus();  
				return false;  
			}  
			return true;  
		}
		function ValidateEmail(uemail)  
		{  
			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
			if(uemail.value.match(mailformat))  
			{  
				return true;  
			}  
			else  
			{  
				document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>You have entered an invalid email address!</div>';
				uemail.focus();  
				return false;  
			}  
		}
	</script>
</head>
<body><br>
	<div class="container">
		<div id="alert">
			<%
				if(request.getMethod().equalsIgnoreCase("post"))
				{
					String email = request.getParameter("email");
					String password = request.getParameter("password");
					User user = new User();
					if(user.getStatus().contains("ERROR"))
					{
						out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+user.getStatus()+"</div>");
					}
					else
					{
						user.setEmail(email.trim());
						user.setPassword(password.trim());
						String current_user[] = user.login();
						if(user.getStatus().contains("ERROR"))
						{
							out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+user.getStatus()+"</div>");
						}
						else
						{
							int current_user_id = Integer.parseInt(current_user[0]);
							session.setAttribute("u_id", current_user_id);
							session.setAttribute("u_fname", current_user[1]);
							session.setAttribute("u_lname", current_user[2]);
							session.setAttribute("is_Admin", current_user[3]);
							response.sendRedirect("..");
						}
					}
				}
			%>
		</div>
		<div class="well">
			<form class="form-horizontal" name="loginform" method="POST" action="<%request.getRequestURL(); %>" onsubmit="return validate()">
				
				<fieldset>
			    		<legend><center>Login</center></legend>
			    		<div class="form-group">
			    			<label class="col-lg-9 lead control-label">Enter Credentials</label>
			    		</div>
			    		<div class="form-group">
				    		<label class="col-lg-1 control-label">Email</label>
				    	</div>
				    	<div class="form-group">
				    		<div class="col-lg-12">
				    			<input type="text" class="form-control" name="email" id="email" placeholder="Email">
				    		</div>
				    </div>
				    
				    <div class="form-group">
				    		<label class="col-lg-1 control-label">Password</label>
				    	</div>
				    	<div class="form-group">
				    		<div class="col-lg-12">
				    			<input type="password" class="form-control" name="password" id="password" placeholder="Password">
				    		</div>
				    </div>
				    <div class="form-group">
			    		<div class="col-lg-1">
			        		<button type="submit" class="btn btn-primary">Login</button>
				      	</div>
				    </div>
			    	</fieldset>
		    </form>
		</div>
	</div>
	<%out.println(request.getMethod()); %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

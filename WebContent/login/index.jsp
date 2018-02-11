<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			    width: 1000px;
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
		<%
			if("post".equalsIgnoreCase(request.getMethod()))
			{
				out.println(request.getParameter("email"));
				out.println(request.getParameter("password"));
			}
		%>
		<div class="well">
			<form class="form-horizontal" name="loginform" method="POST" action="<%request.getRequestURL(); %>" onsubmit="return validate()">
				<div id="alert"></div>
				<fieldset>
			    		<legend><center>Login</center></legend>
			    		<div class="form-group">
				    		<label for="inputEmail" class="col-lg-2 control-label">Email</label>
				    		<div class="col-lg-4">
				    			<input type="text" class="form-control" name="email" id="email" placeholder="Email">
				    		</div>
				    		<div class="col-lg-offset-1 col-lg-5 visible-lg">
				    			<p class="lead">Enter Login Credentials</p>
				    		</div>
				    </div>
				    
				    <div class="form-group">
				    		<label for="inputEmail" class="col-lg-2 control-label">Password</label>
				    		<div class="col-lg-4">
				    			<input type="password" class="form-control" name="password" id="password" placeholder="Password">
				    		</div>
				    </div>
				    <div class="form-group">
				    		<div class="col-lg-10 col-lg-offset-2">
				        		<button type="submit" class="btn btn-primary">Submit</button>
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

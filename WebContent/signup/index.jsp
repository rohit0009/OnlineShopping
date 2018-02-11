<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<%
	out.println(request.getServletPath());
	if("post".equalsIgnoreCase(request.getMethod()))
	{
		out.println(request.getRequestURL());
	}
		//out.println(request.getRequestURI());
	
	%>
	<script>
		function validateForm()
		{
			var fname=document.getElementById("fname");
			var lname=document.getElementById("lname");
			var email=document.getElementById("inputEmail");
			var password=document.getElementById("inputPassword");
			var phone=document.getElementById("contactNo");
			//var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			 
			//alert(fname+lname+email+password+phone)
			var x = 0;

			if(document.getElementById('optionsRadios1').checked)
				x++;
			if(document.getElementById('optionsRadios2').checked)
				x++;

			if(fname.value == '' && lname.value == '' && phone.value == '' && email.value == '' && password.value == '' && x == 0)
			{
				document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Please enter all fields.</div>';
			}

			else
			{
				if(allLetter(fname,"First Name"))
				{
					if(allLetter(lname,"Last Name"))
					{	
						if(x != 0)
						{  
							if(ValidateEmail(email)) 
							{   
								//if(userid_validation(inputUsername,5,12))
								//{  
									if(passid_validation(password,8,12))
									{  
										if(phone.value.length == 10)
										{
											if(phone.value.match(/^[0-9]+$/))
											{
												return true;
											}
											else
											{
												document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Contact Number should have numeric characters only.</div>';
											}
										}
										else
										{
											document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Contact Number should be 10 digit only.</div>';
										}
									}
								//}  
							}  
						}
						else
						{
							document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Select your Gender.</div>';
							lname.focus();
						}
					}
				}
			}
		$(document).ready(function(){
		    $('html,body').animate({ scrollTop: 0 }, 'slow');
		});
		return false;  
	}
	function userid_validation(uid,mx,my)  
	{  
		var uid_len = uid.value.length;  
		if (uid_len == 0 || uid_len >= my || uid_len < mx)  
		{  
			document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>User Id should not be empty / length be between '+mx+' to '+my+'</div>';
			uid.focus();  
			return false;  
		}
		return true;  
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
	
	function allLetter(uname,id)  
	{   
		var letters = /^[A-Za-z]+$/;  
		if(uname.value.match(letters))  
		{  
			return true;  
		}  
		else  
		{
			document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>'+id+' must have alphabetic characters only</div>';
			uname.focus();  
			return false;  
		}  
	}
	function allnumeric(uzip)  
	{   
		var numbers = /^[0-9]+$/;  
		if(uzip.value.match(numbers))  
		{  
			if(uzip.value.length==6)
				return true;  
			else
			{
				document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Pincode code must have 6 numeric characters only</div>';
				uzip.focus();  
				return false;  	
			}
		}  
		else  
		{  
			document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Pincode code must have numeric characters only</div>';
			uzip.focus();  
			return false;  
		}  
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
	
<title>Signup</title>
</head>
<body>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    
    <form class="form-horizontal" name="signupForm" action="<%request.getRequestURL(); %>" method ="POST" onsubmit="return validateForm()">
    	  <div id="alert"></div>
	  <fieldset>
	    <legend>Signup Here</legend>
	    <div class="form-group">
	      <label for="firstName" class="col-lg-2 control-label">First Name</label>
	      <div class="col-lg-3">
	        <input type="text" class="form-control" id="fname" placeholder="First Name">
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="lastName" class="col-lg-2 control-label">Last Name</label>
	      <div class="col-lg-3">
	        <input type="text" class="form-control" id="lname" placeholder="Last Name">
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="inputEmail" class="col-lg-2 control-label">Email</label>
	      <div class="col-lg-3">
	        <input type="text" class="form-control" id="inputEmail" placeholder="Email">
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="inputPassword" class="col-lg-2 control-label">Password</label>
	      <div class="col-lg-3">
	        <input type="password" class="form-control" id="inputPassword" placeholder="Password">
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="contactNo" class="col-lg-2 control-label">Contact</label>
	      <div class="col-lg-3">
	        <input type="text" class="form-control" id="contactNo" placeholder="Contact Number">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="col-lg-2 control-label"></label>
	      <div class="col-lg-3">
	        <div class="radio">
	          <label>
	            <input type="radio" name="sex" id="optionsRadios1" value="female" checked="">
	            Female
	          </label>
	        </div>
	        <div class="radio">
	          <label>
	            <input type="radio" name="sex" id="optionsRadios2" value="male">
	            Male
	          </label>
	        </div>
	      </div>
	    </div>
	    <div class="form-group">
	      <div class="col-lg-3 col-lg-offset-2">
	        <button type="reset" class="btn btn-default">Cancel</button>
	        <button type="submit" class="btn btn-primary">Submit</button>
	      </div>
	    </div>
	  </fieldset>
	</form>
	
	<%
		out.println(request.getMethod());
	%>
    

</body>
</html>
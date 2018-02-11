<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<script>
		function validateForm()
		{
			var fname=document.getElementById("fname").value;
			var lname=document.getElementById("lname").value;
			var email=document.getElementById("inputEmail").value;
			var password=document.getElementById("inputPassword").value;
			var phone=document.getElementById("contactNo").value;
			//var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			  
			if (fname=="" || lname=="" || email=="" || password=="" || phone=="")
			{  
				alert("Please fill out the blank fields!");  
				return false;  
			}
			else 
			{	
				if(fname != '[a-zA-Z]' || lname != '[a-zA-Z]')
				{  
					alert("Name should be in alphabetical format");  
					return false;
				}
				/*if(email)
				{  
					alert("E");  
					return false;
				}*/
				if(password.length<8 || password.length>12)
				{  
					alert("Password must be 8-12 characters long.");  
					return false;
				}
				if(phone != '[0-9]' || phone.length!=10)
				{  
					alert("Invalid contact number");  
					return false;
				}
			}
		}  
	</script>
	
<title>Signup</title>
</head>
<body>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    
    <form class="form-horizontal" name="signupForm" onsubmit="return validateForm()">
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
    

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="osp.Supplier"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.css">
    <link href="../dashboard.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<script>
	function validateForm()
	{
		var fname=document.getElementById("fname");
		var lname=document.getElementById("lname");
		var email=document.getElementById("inputEmail");
		var phone=document.getElementById("contactNo");
		//var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		 
		//alert(fname+lname+email+password+phone)

		if(fname.value == '' && lname.value == '' && phone.value == '' && email.value == '')
		{
			document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Please enter all fields.</div>';
		}

		else
		{
			if(allLetter(fname,"First Name"))
			{
				if(allLetter(lname,"Last Name"))
				{  
					if(ValidateEmail(email)) 
					{   
						//if(userid_validation(inputUsername,5,12))
						//{
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
						//}  
					}  
				}
			}
		}
		$(document).ready(function(){
		    $('html,body').animate({ scrollTop: 0 }, 'slow');
		});
		return false;  
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
	
	<style>
		@media (min-width: 1200px){
			.container {
			    width: 500px;
			}
		}
	</style>
<title>Add Suppliers</title>
</head>
<body>
<%
	if(session.getAttribute("u_id") == null && session.getAttribute("u_fname") == null && session.getAttribute("u_lname") == null && session.getAttribute("is_Admin") == null)
	{
		out.println("<div class=\"jumbotron\" style=\"padding-left: 40px;margin-left : 50px;margin-right : 50px;font-size :25px;\">You are not Logged In. Please ");
		out.println("<a href=\"http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/login\">Login</a></div></body></html>");
	}
	else
	{
		String bool = (String)session.getAttribute("is_Admin");
		if(!bool.equalsIgnoreCase("true"))
		{
			out.println("<div class=\"jumbotron\" style=\"padding-left: 40px;margin-left : 50px;margin-right : 50px;font-size :25px;\">You are not allowed to Access this Page ");
			out.println("<a href=\"http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping\">Shop items</a></div></body></html>");
		}
		else
		{
%>
<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping"); %>">Online Shopping</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="../..">Go to Site</a></li>
            <li class="active"><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin"); %>">Dashboard</a></li>
            <li><a href="#">Profile</a></li>
            	<li><a href="#">Logout</a></li>
          </ul>
        </div>
      </div>
    </nav>
    
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/addproduct"); %>">Add Product</a></li>
            <li class="active"><a>Add Supplier</a></li>
          </ul>
          <ul class="nav nav-sidebar">
          	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/supplier"); %>">Search Supplier</a></li>
	      	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/customer"); %>">Search Customer</a></li>
	      </ul>
	      <ul class="nav nav-sidebar">
	          <li><a href="#" id="btn-1" data-toggle="collapse" data-target="#submenu1" aria-expanded="false">Coupon <span class="caret"></span></a>
			      <ul class="nav collapse" id="submenu1" role="menu" aria-labelledby="btn-1">
			        <li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/coupon/add"); %>">Add Discount Coupon</a></li>
            			<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/coupon/remove"); %>">Remove Discount Coupon</a></li>
			      </ul>
			  </li>
          </ul>
        </div>
        	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        		<div class="jumbotron">
				<%
					if(request.getMethod().equalsIgnoreCase("post"))
					{
						Supplier sup = new Supplier();
						if( sup.getStatus().contains("ERROR"))
						{
							out.print("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+sup.getStatus()+"</div>");
						}
						else
						{
							sup.setS_fname(request.getParameter("fname"));
							sup.setS_lname(request.getParameter("lname"));
							sup.setEmail(request.getParameter("inputEmail"));
							sup.setContact(Long.parseLong(request.getParameter("contactNo")) );
							String res = sup.addSupplier();
							if(res.contains("ERROR"))
							{
								out.print("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+res+"</div>");
							}
							else
							{
								out.print("<div class=\"alert alert-dismissible alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+res+"</div>");
							}
						}
					}
				%>
        			<p class="lead">
        			
        				 <div class="container">
        				 <div id="alert"></div>
        				 <form class="form-horizontal" name="supplierForm" action="<%request.getRequestURL(); %>" method ="POST" onsubmit="return validateForm()">
    	  				
	  					<fieldset>
					    <legend><center>Supplier Details</center></legend>
					    
					    <div class="form-group">
					      <label for="firstName" class="col-lg-3 control-label">First Name</label>
					      <div class="col-lg-9 control-label">
					        <input type="text" class="form-control" name ="fname" id="fname" placeholder="First Name">
					      </div>
					    </div>
					   
					    <div class="form-group">
					      <label for="lastName" class="col-lg-3 control-label">Last Name</label>
					      <div class="col-lg-9 control-label">
					        <input type="text" class="form-control" name ="lname" id="lname" placeholder="Last Name">
					      </div>
					    </div>
					   
					    <div class="form-group">
					      <label for="inputEmail" class="col-lg-3 control-label">Email</label>
					      <div class="col-lg-9 control-label">
					        <input type="text" class="form-control" name ="inputEmail" id="inputEmail" placeholder="Email">
					      </div>
					    </div>
					    
					    <div class="form-group">
					      <label for="contactNo" class="col-lg-3 control-label">Contact</label>
					      <div class="col-lg-9 control-label">
					        <input type="text" class="form-control" name ="contactNo" id="contactNo" placeholder="Contact Number">
					      </div>
					    </div>
					    
					    <div class="form-group">
					      <div class="col-lg-12 col-lg-offset-5">
					      <div>
					        <button type="reset" class="btn btn-default">Cancel</button>
					        <button type="submit" class="btn btn-primary">Submit</button>
					      </div>
					    </div>
					    </div>
					    
					  
					  </fieldset>
					  
					</form>
        			
        			</p>
        		</div>
        	</div>
      </div>
    </div>
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
<%
		}
	}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
<link rel="stylesheet" type="text/css" href="../../../bootstrap/css/bootstrap.css">
<link href="../../dashboard.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
	function validateCustForm()
	{
		var searchedValue=document.getElementById("searchedValue");
		if(searchedValue.value == '')
		{
			document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Please enter something to search.</div>';
		}
		else
		{
			if(allLetter(searchedValue))
			{
				return true;
			}
		}
		return false;
	}
	function allLetter(uname)  
	{   
		var letters = /^[A-Za-z]+$/;  
		if(uname.value.match(letters))  
		{  
			return true;  
		}  
		else  
		{
			document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>'+' must have alphabetic characters only</div>';
			uname.focus();  
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

<title>Search Customer</title>
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
            <li><a href="../../..">Go to Site</a></li>
            <li class="active"><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin"); %>">Dashboard</a></li>
            <li><a href="#">Profile</a></li>
            	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/logout.jsp"); %>">Logout</a></li>
          </ul>
        </div>
      </div>
    </nav>
    
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/addproduct"); %>">Add Product <span class="sr-only">(current)</span></a></li>
            <li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/addsupplier"); %>">Add Supplier</a></li>
          </ul>
          <ul class="nav nav-sidebar">
          	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/supplier"); %>">Search Supplier</a></li>
	      	<li class="active"><a>Search Customer</a></li>
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
        			<p class="lead">
        			<center>
        				<div id="alert"></div>
        				<form class="form-horizontal" name="searchCustForm" action="SearchCustomer.jsp" method="post" onsubmit="return validateCustForm()">
      						<div class="form-group">
      						<label for="inputEmail" class="col-lg-offset-2 col-lg-2 control-label">Search Something <span style="color: red">*</span></label>
      						<div class ="col-lg-4">
      							<input class="form-control" type="text" name="searchedValue" id="searchedValue" placeholder="Search">
      						</div>
       							
       						</div>
       						<div class="form-group">
      							<label class="col-lg-offset-2 col-lg-2 control-label">Search by</label>
      							<div class="col-lg-4">
	      							<div class="radio">
								        <label>
								        	<input type="radio" name="SearchByName" id="firstName" value="u_fname" checked="">First Name
								        </label>
								        <label>
								        	<input type="radio" name="SearchByName" id="lastName" value="u_lname">Last Name
								        </label>
						    		</div>
						    		
					    		</div>
       						</div>
       							<button class="btn btn-info" type="submit">Search</button>
    					</form>
    				</center>
        		</div>
        	</div>
      </div>
    </div>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../../../bootstrap/js/bootstrap.min.js"></script>
<%
		}
	}
%>
</body>
</html>
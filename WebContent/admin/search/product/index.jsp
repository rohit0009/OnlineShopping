<%@page import="osp.Product"%>
<%@page import="osp.Category"%>
<%@page import="java.util.HashMap"%>
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
		function validate()
		{
			var cat = document.getElementById("cat");
			
			if( cat.value == "" )
			{
				document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Please enter all fields.</div>';
			}
			else
			{
				return true;
			}
			return false;
		}
	</script>

	<style>
		@media (min-width: 1200px){
			.container {
			    width: 500px;
			}
		}
	</style>

<title>Search Product</title>
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
          <a class="navbar-brand" href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping"); %>">FashionWorld</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="../../..">Go to Site</a></li>
            <li class="active"><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin"); %>">Dashboard</a></li>
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
	      	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/customer"); %>">Search Customer</a></li>
	      	<li class="active"><a>Search Product</a></li>
	      </ul>
	      <ul class="nav nav-sidebar">
	          <li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/coupon"); %>">Coupon</span></a></li>
          </ul>
        </div>
        	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        		<div class="jumbotron">
        			<p class="lead">
        			<center>
        				<div id="alert"></div>
        				<form class="form-horizontal" name="searchCustForm" action="SearchProduct.jsp" method="post" onsubmit="return validate()">
      						
       						<div class="form-group">
      							<label class="col-lg-offset-2 col-lg-2 control-label">Category</label>
						      	<div class="col-lg-5">
						        		<select class="form-control" name="cat" id="cat">
					        				<option value=''>Choose an OPTION</option>
					        				<% 
					        					Category c = new Category();
					        					Product p = new Product();
						        				String str ="";
					        					String cat_arr[] = c.get_categories("men");
					        					for(String cat : cat_arr)
						        				{
						        					%>
						        						<option value='<% out.println(""+p.get_Cat_id(cat)); %>'><% out.println(cat);%> </option>
						        					<%
						        				}
					        					String cat_arr1[] = c.get_categories("women");
					        					for(String cat : cat_arr1)
						        				{
						        					%>
						        						<option value='<% out.println(""+p.get_Cat_id(cat)); %>'><% out.println(cat);%> </option>
						        					<%
						        				}
					        				
					        				%>
						        		</select>
						      	</div>
       						</div>
       							<button class="btn btn-info" type="submit" id="submitaddP" name ="submitaddP">Search</button>
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
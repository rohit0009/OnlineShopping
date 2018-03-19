<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="osp.Database"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="osp.SearchCustomer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
<link rel="stylesheet" type="text/css" href="../../../bootstrap/css/bootstrap.css">
<link href="../../dashboard.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>




	<style>
		@media (min-width: 1200px){
			.container {
			    width: 500px;
			}
		}
	</style>
<title>Product Details</title>
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
            <li class="active"><a>Dashboard</a></li>
            	<li><a href="#">Logout</a></li>
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
	      	<li class="active"><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/product"); %>">Search Product</a></li>
	      </ul>
	      <ul class="nav nav-sidebar">
	          <li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/coupon"); %>">Coupon</span></a></li>
          </ul>
        </div>
        	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        		<div class="jumbotron">
        		
        		<%
	        		if(request.getMethod().equalsIgnoreCase("post"))
					{
		        		Database db = new Database();
	        			Connection conn = null;
	        			if(db.getStatus().contains("ERROR"))
	        				out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+db.getStatus()+"</div>");
	        			else
	        			{
	        				conn = db.connect();
	        				Statement st = conn.createStatement();
	        				ResultSet rs = st.executeQuery("SELECT * from product where cat_id ="+Integer.parseInt(request.getParameter("cat").trim()));
	        				if(rs.isBeforeFirst())
	        				{
	        					out.print("FOUND");
	        				}
	        				else
	        				{
	        					out.println("<p class=\"lead\">No Product found! Please Try Again</p>");
	        				}
	        			}
					}
        		%>
        		
        			
        			
        				
        			<a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/product"); %>">Back</a>
        					
        				
        			
        			
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
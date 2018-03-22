<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Welcome</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    
	<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">
	<link href="dashboard.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
            <li><a href="..">Go to Site</a></li>
            <li class="active"><a>Dashboard</a></li>
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
	      	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/product"); %>">Search Product</a></li>
	      </ul>
	      <ul class="nav nav-sidebar">
	          <li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/coupon"); %>">Coupon</span></a></li>
          </ul>
        </div>
        	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        		<div class="jumbotron">
        			<p class="lead">Welcome!</p><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        			<%
					/* System.out.println("1"+request.getPathInfo());
					System.out.println(request.getServletPath());
					System.out.println(request.getRequestURI());
					System.out.println(request.getServerName());
					System.out.println(request.getRequestURL());
					System.out.println(); */
					
					
					
				%>
        		</div>
        	</div>
      </div>
    </div>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
<%
		}
	}
%>
</body>
</html>
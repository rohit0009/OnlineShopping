<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="osp.Supplier"%>
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
<title>Supplier Details</title>
</head>
<body>
<%
	if(session.getAttribute("s_id") == null && session.getAttribute("s_fname") == null && session.getAttribute("s_lname") == null && session.getAttribute("is_Admin") == null)
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
          	<li class="active"><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/supplier"); %>">Search Supplier</a></li>
	      	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/customer"); %>">Search Customer</a></li>
	      	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/product"); %>">Search Product</a></li>
	      </ul>
	      <ul class="nav nav-sidebar">
	          <li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/coupon"); %>">Coupon</span></a></li>
          </ul>
        </div>
        	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        		<div class="jumbotron">
        		
        		<%
        		Supplier sc = new Supplier();
        		if(request.getMethod().equalsIgnoreCase("post"))
				{
					
					if( sc.getStatus().contains("ERROR"))
					{
						out.print("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+sc.getStatus()+"</div>");
					}
					else
					{
						sc.setS_attr(request.getParameter("SearchByName"));
						sc.setSearchedValue(request.getParameter("searchedValue"));
						
						HashMap<String , HashMap<String , String>> result = sc.displaySupplier();
					
						if(result.get("1") == null)
						{
							out.println("<p class=\"lead\">No Suppliers found! Please Try Again</p>");
						}
						else
						{
							out.println("<center><h4><b>Supplier Details</b></h4></center>");
							out.println("<table class=\"table table-hover\">");
							out.println("<thead><tr><th>Supplier ID</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Contact</th></tr></thead>");
							out.println("<tbody>");
							
							int counter = 1;
							for(HashMap<String,String> supplier : result.values()){
								if(counter == 1)
								{
									counter++;
									continue;
								}
								out.println("<tr>");
								out.println("<td>"+supplier.get("s_id")+"</td>");
								out.println("<td>"+supplier.get("s_fname")+"</td>");
								out.println("<td>"+supplier.get("s_lname")+"</td>");
								out.println("<td>"+supplier.get("s_email")+"</td>");
								out.println("<td>"+supplier.get("s_contact")+"</td></tr>");
							}
							out.println("</tbody></table>");
						}
					}
				}
        		%>
        		
        			
        			
        				
        					<a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/supplier"); %>">Back</a>
        					
        				
        			
        			
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
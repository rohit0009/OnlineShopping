<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="osp.Database" import="java.sql.Connection" import="java.sql.ResultSet"
import="java.sql.SQLException"
import="java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
<link rel="stylesheet" type="text/css" href="../../../bootstrap/css/bootstrap.css">
<link href="../../dashboard.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Delete Coupon</title>
</head>
<body>
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
	      	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/product"); %>">Search Product</a></li>
	      </ul>
	      <ul class="nav nav-sidebar">
	          <li class="active"><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/coupon"); %>">Coupon</a></li>
          </ul>
        </div>
        	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        		<div class="jumbotron">
        			
        			<div class="container">
        				<div id="alert">
        					<%
        						String status = "";
        						if(request.getMethod().equalsIgnoreCase("post"))
        						{
        							String query = request.getParameter("coup");
        							String arr[] = query.split("&&");
        							
        							Database db = new Database();
        							Connection conn = db.connect();
        							if(db.getStatus().contains("ERROR"))
        							{
        								status += "ERROR : Something went wrong. ";
        							}
        							
        							Statement st = conn.createStatement();
        							ResultSet rs = null;
        							int res = st.executeUpdate("update coupon set is_active = 0 where coupon_id = " +Integer.parseInt(arr[0]));
        							if(res>0)
        							{
        								out.println("<div class=\"alert alert-dismissible alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Coupon deleted Successfully</div>");
        							}
        						}
        						else
        						{
        							out.println("ERROR : Could not delete coupon.");
        						}
        					%>
        					<a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/coupon"); %>">Back</a>
        				</div>
					</div>
        		</div>
        	</div>
      </div>
    </div>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../../../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
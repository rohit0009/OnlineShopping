<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="osp.Database"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Coupons</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    
	<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.css">
	<link href="../dashboard.css" rel="stylesheet">
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
	      	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/product"); %>">Search Product</a></li>
	      </ul>
	      <ul class="nav nav-sidebar">
	          <li class="active"><a>Coupon</span></a></li>
          </ul>
        </div>
        	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        		<%!
        			ResultSet rs =null;
        			Statement st = null;
        			Connection conn = null;
        		%>
        		
				<%
					Database db = new Database();
					conn = db.connect();
					st = conn.createStatement();
					rs = st.executeQuery("select * from coupon where is_active = 1");
					if(!rs.isBeforeFirst())
					{
						out.println("<div class=\"well\"><p class=\"lead\">No Coupons Found.</p></div>");
					}
					else
					{
						out.println("<center><p class=\"lead\">List of Coupons</p></center>");
						int coupon_count = 0;
						while(rs.next())
						{
							coupon_count++;
							if(coupon_count == 1)
							{
						%>
							<div class="row">
		       					<div class="col-lg-4">
			        				<div class="well well-lg">
			        					<center>Coupon Id : <%=rs.getString("coupon_id") %></center>
			        					<form class="form-horizontal">
											<div class="form-group">
									    		<label class="control-label col-lg-5">Coupon Description</label>
									    		<div class="col-lg-7">
									    			<textarea class="form-control" rows="2" cols="7" disabled="true"><%=rs.getString("coupon_desc") %></textarea>
									    		</div>
								    		</div>
								    		<div class="form-group">
									    		<label class="control-label col-lg-5">From Amount</label>
									    		<div class="col-lg-7">
									    			<input type="text" class="form-control" value="<%=rs.getString("from_amount") %>" disabled="true"></input>
									    		</div>
								    		</div>
								    		<div class="form-group">
									    		<label class="control-label col-lg-5">To Amount</label>
									    		<div class="col-lg-7">
									    			<input type="text" class="form-control" value="<%=rs.getString("to_amount") %>" disabled="true"></input>
									    		</div>
								    		</div>
								    		<div class="form-group">
									    		<label class="control-label col-lg-5">Discount (%)</label>
									    		<div class="col-lg-7">
									    			<input type="text" class="form-control" value="<%=rs.getString("discount") %>" disabled="true"></input>
									    		</div>
								    		</div>
							    		</form>
							    	</div>
							    </div>
		        		<%
							}
							else if(coupon_count == 2)
							{
								%>
									<div class="col-lg-4">
				        				<div class="well well-lg">
				        					<center>Coupon Id : <%=rs.getString("coupon_id") %></center>
				        					<form class="form-horizontal">
												<div class="form-group">
										    		<label class="control-label col-lg-5">Coupon Description</label>
										    		<div class="col-lg-7">
										    			<textarea class="form-control" rows="2" cols="7" disabled="true"><%=rs.getString("coupon_desc") %></textarea>
										    		</div>
									    		</div>
									    		<div class="form-group">
										    		<label class="control-label col-lg-5">From Amount</label>
										    		<div class="col-lg-7">
										    			<input type="text" class="form-control" value="<%=rs.getString("from_amount") %>" disabled="true"></input>
										    		</div>
									    		</div>
									    		<div class="form-group">
										    		<label class="control-label col-lg-5">To Amount</label>
										    		<div class="col-lg-7">
										    			<input type="text" class="form-control" value="<%=rs.getString("to_amount") %>" disabled="true"></input>
										    		</div>
									    		</div>
									    		<div class="form-group">
										    		<label class="control-label col-lg-5">Discount (%)</label>
										    		<div class="col-lg-7">
										    			<input type="text" class="form-control" value="<%=rs.getString("discount") %>" disabled="true"></input>
										    		</div>
									    		</div>
								    		</form>
								    	</div>
								    </div>
								
								<%
							}
							else if(coupon_count == 3)
							{
								%>
									<div class="col-lg-4">
				        				<div class="well well-lg">
				        					<center>Coupon Id : <%=rs.getString("coupon_id") %></center>
				        					<form class="form-horizontal">
												<div class="form-group">
										    		<label class="control-label col-lg-5">Coupon Description</label>
										    		<div class="col-lg-7">
										    			<textarea class="form-control" rows="2" cols="7" disabled="true"><%=rs.getString("coupon_desc") %></textarea>
										    		</div>
									    		</div>
									    		<div class="form-group">
										    		<label class="control-label col-lg-5">From Amount</label>
										    		<div class="col-lg-7">
										    			<input type="text" class="form-control" value="<%=rs.getString("from_amount") %>" disabled="true"></input>
										    		</div>
									    		</div>
									    		<div class="form-group">
										    		<label class="control-label col-lg-5">To Amount</label>
										    		<div class="col-lg-7">
										    			<input type="text" class="form-control" value="<%=rs.getString("to_amount") %>" disabled="true"></input>
										    		</div>
									    		</div>
									    		<div class="form-group">
										    		<label class="control-label col-lg-5">Discount (%)</label>
										    		<div class="col-lg-7">
										    			<input type="text" class="form-control" value="<%=rs.getString("discount") %>" disabled="true"></input>
										    		</div>
									    		</div>
								    		</form>
								    	</div>
								    </div>
								    </div>
								
								<%
								coupon_count = 0;
							}
						}
						if(coupon_count == 1 || coupon_count == 2)
						{
							out.println("</div>");
						}
					}
					
				%>
				<a href="<%="http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/coupon/add" %>"><button class="btn btn-link">Add Coupons</button></a>
				<a href="<%="http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/coupon/remove" %>"><button class="btn btn-link">Remove Coupons</button></a>
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
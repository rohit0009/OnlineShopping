<%@page import="java.util.HashMap"%>
<%@page import="osp.Coupon"%>
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
<title>Remove Coupons</title>
<script>

	function validateForm()
	{
		var coup = document.getElementById("coup");
		if(coup.value == "")
		{
			document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Please select a coupon to remove.</div>';
		}
		else
		{
			return true;
		}
		return false;
	}
	
	function update()
	{
		var selected_value = $('#coup').find(":selected").attr("value");
		if(selected_value == "")
		{
			$('#fRange').attr("value","");
			$('#tRange').attr("value","");
			$('#discount').attr("value","");
		}
		else
		{
			var attribute = selected_value.split("&&");
			$('#fRange').attr("value",attribute[3]);
			$('#tRange').attr("value",attribute[4]);
			$('#discount').attr("value",attribute[2]);
		}
	}

</script>
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
        					
        				</div>
        				<form class="form-horizontal" name="addCouponForm" action="DeleteCoupon.jsp" method ="POST" onsubmit="return validateForm()">
    	  				
	  					<fieldset>
					    <legend>Remove Coupon</legend>
					    <div class="col-lg-8">
						    <div class="form-group">
						      <label for="couponDesc" class="col-lg-4 control-label">Select a Coupon<span style="color: red;">*</span></label>
						      <div class="col-lg-8 control-label">
						        <select class="form-control" name="coup" id="coup" onchange="update()">
							        <option value=''>Choose an OPTION</option>
							        <%
							        		Coupon c = new Coupon();
						    		  		HashMap<String, HashMap<String , String>> coupons = c.displayCoupon();
						    		  		if(!(coupons.get("1") == null))
						    		  		{
						    		  			int counter = 1;
						    		  			String value = "";
						    		  			for(HashMap<String,String> coupon : coupons.values())
						    		  			{
													if(counter == 1)
													{
														counter++;
														continue;
													}
													value = value + coupon.get("coupon_id").trim() + "&&";
													value = value + coupon.get("coupon_desc").trim() + "&&";
													value = value + coupon.get("discount").trim() + "&&";
													value = value + coupon.get("from_amount").trim() + "&&";
													value = value + coupon.get("to_amount").trim() + "&&";
													value = value + coupon.get("is_active").trim();
													if(coupon.get("is_active").equals("1"))
													{
														%>
															<option value="<%=value %>"><%=coupon.get("from_amount")+" - "+coupon.get("to_amount") %></option>
														<%
													}
													value = "";
												}
						    		  		}
						    		  		
							        %>
				        			</select>
						      </div>
						    </div>
						   
						    <div class="form-group">
						      <label for="range" class="col-lg-4 control-label">From Range</label>
						      <div class="col-lg-8 control-label">
						        <input type="text" class="form-control" name ="fRange" id="fRange" placeholder="From Range" disabled="true">
						      </div>
						    </div>
						   
						    <div class="form-group">
						      <label for="range" class="col-lg-4 control-label">To Range</label>
						      <div class="col-lg-8 control-label">
						        <input type="text" class="form-control" name ="tRange" id="tRange" placeholder="To Range" disabled="true">
						      </div>
						    </div>
						    
						    <div class="form-group">
						      <label for="discount" class="col-lg-4 control-label">Discount %</label>
						      <div class="col-lg-8 control-label">
						        <input type="text" class="form-control" name ="discount" id="discount" placeholder="Discount" disabled="true">
						      </div>
						    </div>
						    
						    <div class="form-group">
						    	<div class="col-lg-12 col-lg-offset-4">
						    		<button type="submit" class="btn btn-primary">Remove</button>
						    	</div>
						    </div>
						    
						    <div class="form-group">
					    		<div class="col-lg-1">
					        		<a href=".." class="btn btn-link">Back</a>
						      	</div>
						    </div>
						    
						    
					    </div>
					  
					  </fieldset>
					  
					</form>
					</div>
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
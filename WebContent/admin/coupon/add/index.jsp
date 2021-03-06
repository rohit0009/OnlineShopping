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
<title>Add Coupons</title>
	
<script>

	function validateForm()
	{
		var desc = document.getElementById("desc");
		var fRange = document.getElementById("fRange");
		var tRange = document.getElementById("tRange");
		var discount = document.getElementById("discount");
		
		if( desc.value == "" || fRange.value == "" || tRange.value == "" || discount.value == "" )
		{
			document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Please enter all fields.</div>';
		}
		else
		{
			if(allnumeric(fRange,"From Range"))
			{
				if(allnumeric(tRange,"To Range"))
				{
					if(parseInt(fRange.value) < parseInt(tRange.value))
					{
						if(inFormat(discount,"Discount"))
						{
							if(parseFloat(discount.value) >= 1 && parseFloat(discount.value) <= 100 )
							{
								return true;
							}
							else
							{
								document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Discount(%) should be in between 1 to 100.</div>';
							}
						}
					}
					else
					{
						fRange.focus();
						document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>From Range should be LOWER than To Range.</div>';
					}
				}
			}
		}
		return false; 
	}
	
	function inFormat(disc)
	{
		var pattern = /^[0-9]+([.][0-9]{1})?$/;
		if(disc.value.match(pattern))
		{
			return true;
		}
		else  
		{  
			document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>Discount(%) is not in expected format.</div>';
			disc.focus();  
			return false;  
		}
	}
	
	function allnumeric(uzip,param)  
	{   
		var numbers = /^[0-9]+$/;  
		if(uzip.value.match(numbers))  
		{  
			return true;
		}  
		else  
		{  
			document.getElementById("alert").innerHTML = '<div class="alert alert-dismissible alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>'+param+' must have numeric characters only</div>';
			uzip.focus();  
			return false;  
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
        					<%
        						if(request.getMethod().equalsIgnoreCase("post"))
        						{
	        						Coupon c = new Coupon();
	        						if(!c.getStatus().contains("ERROR"))
	        						{
	        							c.setCoupon_desc(request.getParameter("desc"));
	        							c.setFrom_amount(Integer.parseInt(request.getParameter("fRange")));
	        							c.setTo_amount(Integer.parseInt(request.getParameter("tRange")));
	        							c.setDiscount(Float.parseFloat(request.getParameter("discount")));
	        							c.add();
	        							if(!c.getStatus().contains("ERROR"))
	        								out.println("<div class=\"alert alert-dismissible alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+c.getStatus()+"</div>");
	        							else
	        								out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+c.getStatus()+"</div>");
	        						}
	        						else
	        							out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+c.getStatus()+"</div>");
        						}
        					
        					%>
        				</div>
        				<form class="form-horizontal" name="addCouponForm" action="<%request.getRequestURL(); %>" method ="POST" onsubmit="return validateForm()">
    	  				
	  					<fieldset>
					    <legend>Add New Coupon</legend>
					    <div class="col-lg-8">
						    <div class="form-group">
						      <label for="couponDesc" class="col-lg-3 control-label">Coupon Description</label>
						      <div class="col-lg-9 control-label">
						        <textarea rows="4" cols="10" class="form-control" id="desc" name="desc"></textarea>
						      </div>
						    </div>
						   
						    <div class="form-group">
						      <label for="range" class="col-lg-3 control-label">From Range</label>
						      <div class="col-lg-9 control-label">
						        <input type="text" class="form-control" name ="fRange" id="fRange" placeholder="From Range">
						      </div>
						    </div>
						   
						    <div class="form-group">
						      <label for="range" class="col-lg-3 control-label">To Range</label>
						      <div class="col-lg-9 control-label">
						        <input type="text" class="form-control" name ="tRange" id="tRange" placeholder="To Range">
						      </div>
						    </div>
						    
						    <div class="form-group">
						      <label for="discount" class="col-lg-3 control-label">Discount %</label>
						      <div class="col-lg-9 control-label">
						        <input type="text" class="form-control" name ="discount" id="discount" placeholder="Discount">
						      </div>
						    </div>
						    
						    <div class="form-group">
						    	<div class="col-lg-12 col-lg-offset-3">
						    		<button type="submit" class="btn btn-primary">Add</button>
						    		<button type="reset" class="btn btn-default">Cancel</button>
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
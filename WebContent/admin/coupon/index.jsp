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
        		<div class="jumbotron">
        			<div class="row">
        				<div class="col-lg-4">
		        			<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Coupon Id : <% %></h3>
							</div>
							<div class="panel-body">
								<form class="form-horizontal">
									<div class="form-group">
								    		<label class="control-label col-lg-5">Coupon Description</label>
								    		<div class="col-lg-7">
								    			<textarea class="form-control" rows="2" cols="7" disabled="true">1000 - 2000</textarea>
								    		</div>
							    		</div>
							    		<div class="form-group">
								    		<label class="control-label col-lg-5">From Amount</label>
								    		<div class="col-lg-7">
								    			<input type="text" class="form-control" value="1000 - 2000" disabled="true"></input>
								    		</div>
							    		</div>
							    		<div class="form-group">
								    		<label class="control-label col-lg-5">To Amount</label>
								    		<div class="col-lg-7">
								    			<input type="text" class="form-control" value="1000 - 2000" disabled="true"></input>
								    		</div>
							    		</div>
							    		<div class="form-group">
								    		<label class="control-label col-lg-5">Discount (%)</label>
								    		<div class="col-lg-7">
								    			<input type="text" class="form-control" value="1000 - 2000" disabled="true"></input>
								    		</div>
							    		</div>
						    		</form>
						  	</div>
						</div>
					</div>
					<div class="col-lg-4">
		        			<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Coupon Id : <% %></h3>
							</div>
							<div class="panel-body">
								<form class="form-horizontal">
									<div class="form-group">
								    		<label class="control-label col-lg-5">Coupon Description</label>
								    		<div class="col-lg-7">
								    			<textarea class="form-control" rows="2" cols="7" disabled="true">1000 - 2000</textarea>
								    		</div>
							    		</div>
							    		<div class="form-group">
								    		<label class="control-label col-lg-5">From Amount</label>
								    		<div class="col-lg-7">
								    			<input type="text" class="form-control" value="1000 - 2000" disabled="true"></input>
								    		</div>
							    		</div>
							    		<div class="form-group">
								    		<label class="control-label col-lg-5">To Amount</label>
								    		<div class="col-lg-7">
								    			<input type="text" class="form-control" value="1000 - 2000" disabled="true"></input>
								    		</div>
							    		</div>
							    		<div class="form-group">
								    		<label class="control-label col-lg-5">Discount (%)</label>
								    		<div class="col-lg-7">
								    			<input type="text" class="form-control" value="1000 - 2000" disabled="true"></input>
								    		</div>
							    		</div>
						    		</form>
						  	</div>
						</div>
					</div>
					<div class="col-lg-4">
		        			<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Coupon Id : <% %></h3>
							</div>
							<div class="panel-body">
								<form class="form-horizontal">
									<div class="form-group">
								    		<label class="control-label col-lg-5">Coupon Description</label>
								    		<div class="col-lg-7">
								    			<textarea class="form-control" rows="2" cols="7" disabled="true">1000 - 2000</textarea>
								    		</div>
							    		</div>
							    		<div class="form-group">
								    		<label class="control-label col-lg-5">From Amount</label>
								    		<div class="col-lg-7">
								    			<input type="text" class="form-control" value="1000 - 2000" disabled="true"></input>
								    		</div>
							    		</div>
							    		<div class="form-group">
								    		<label class="control-label col-lg-5">To Amount</label>
								    		<div class="col-lg-7">
								    			<input type="text" class="form-control" value="1000 - 2000" disabled="true"></input>
								    		</div>
							    		</div>
							    		<div class="form-group">
								    		<label class="control-label col-lg-5">Discount (%)</label>
								    		<div class="col-lg-7">
								    			<input type="text" class="form-control" value="1000 - 2000" disabled="true"></input>
								    		</div>
							    		</div>
						    		</form>
						  	</div>
						</div>
					</div>
					
				</div>
        		</div>
        	</div>
      </div>
    </div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<title>Add Product</title>
	<link href="../dashboard.css" rel="stylesheet">
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
          <a class="navbar-brand" href="#">Online Shopping</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="../..">Go to Site</a></li>
            <li class="active"><a href="..">Dashboard</a></li>
            <li><a href="#">Profile</a></li>
            	<li><a href="#">Logout</a></li>
          </ul>
        </div>
      </div>
    </nav>
    
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Add Product</a></li>
            <li><a href="<%out.println(request.getRequestURL()+"addsupplier"); %>">Add Supplier</a></li>
          </ul>
          <ul class="nav nav-sidebar">
          	<li><a href="">Search Supplier</a></li>
	      	<li><a href="">Search Customer</a></li>
	      </ul>
	      <ul class="nav nav-sidebar">
	          <li><a href="#" id="btn-1" data-toggle="collapse" data-target="#submenu1" aria-expanded="false">Coupon <span class="caret"></span></a>
			      <ul class="nav collapse" id="submenu1" role="menu" aria-labelledby="btn-1">
			        <li><a href="<%out.println(request.getRequestURL()+"coupon/add"); %>">Add Discount Coupon</a></li>
            			<li><a href="<%out.println(request.getRequestURL()+"coupon/remove"); %>">Remove Discount Coupon</a></li>
			      </ul>
			  </li>
          </ul>
        </div>
        	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        		<h2 class="page-header">Add Product</h2>
        		<form class="form-horizontal" action="" method="POST">
				<div class="well well-lg">
					  <div class="row">
					  	<div class="col-lg-6">
						  	<div class="form-group">
						    		<label class="col-lg-5 control-label">Product Name <span style="color: red;">*</span></label>
						      	<div class="col-lg-7">
						        		<input type="text" class="form-control" id="pname" name="pname" placeholder="Product Name">
						      	</div>
						    </div>
						    <div class="form-group">
						    		<label class="col-lg-5 control-label">Product Description</label>
						      	<div class="col-lg-7">
						        		<textarea rows="4" cols="10" class="form-control" id="desc" name="desc"></textarea>
						      	</div>
						    </div>
						    <div class="form-group">
						    		<label class="col-lg-5 control-label">Image 1</label>
						      	<div class="col-lg-7">
						        		<input type="file" id="file1" name="file1">
						      	</div>
						    </div>
					    </div>
					  </div>
				</div>
			</form>
        	</div>
      </div>
    </div>
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
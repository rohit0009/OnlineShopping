<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<title>Home</title>
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
	            <li class="active"><a>Go to Site</a></li>
	            
	            <% 
	            	if(session.getAttribute("u_id") != null)
	            	{
	            		%>
	            		<li><a><%out.println(session.getAttribute("u_fname")+" "+session.getAttribute("u_lname")); %></a></li>
	            		<%
	            		if(session.getAttribute("is_Admin").equals("true"))
	            		{
	            			%>
	            			<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin"); %>">Dashboard</a></li>
	            			<%
	            		}
	            		%>
	            		<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/logout.jsp"); %>">Logout</a></li>
	            		<%
	            	}
	            	else
	            	{
	            %>
	            	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/login"); %>">Login</a></li>
	            	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/signup"); %>">Signup</a></li>
            	<%
            	}
            	%>
          </ul>
        </div>
      </div>
    </nav>
	 
	<div class="container-fluid">
		<div id="alert">
			<div class="well"  style="margin-top: 80px;">
			
				<div class="row">
					<div class="col-lg-3">
						<img src="homepagemen.jpg" class="img-thumbnail">
					</div>
					<div class="col-lg-6"><br><br><br><br><br><br>
						<table class="table table-striped table-hover ">
						  <thead>
						    <tr>
						      <th style="border: 1px black solid" class="text-center">Men</th>
						      <th style="border: 1px black solid" class="text-center">Women</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr class="info">
						 		<td class="text-center"><a href="#" >Jackets</a></td>
						 		<td class="text-center"><a href="#" >Jackets</a></td>
						    </tr>
						    <tr class="info">
						      <td class="text-center"><a href="#" >T-Shirts</a></td>
						      <td class="text-center"><a href="#" >T-Shirts</a></td>
						     </tr>
						    <tr class="info">
						      <td class="text-center"><a href="#" >Shirts</a></td>
						      <td class="text-center"><a href="#" >Shirts</a></td>
						    </tr>
						    <tr class="info">
						      <td class="text-center"><a href="#" >Jeans</a></td>
						      <td class="text-center"><a href="#">Jeans</a></td>
						    </tr>
						    <tr class="info">
						      <td class="text-center"><a href="#" >Trousers</a></td>
						      <td class="text-center"><a href="#">Skirts</a></td>
						    </tr>
						    
						  </tbody>
						  </table>
					</div>
					<div class="col-lg-3">
						<img src="homepagewomen.jpg" class="img-thumbnail pull-right">
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<div>
		
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
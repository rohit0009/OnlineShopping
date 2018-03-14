<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	out.println("Current User Id is "+session.getAttribute("u_id"));
	out.println("Current User Id is "+session.getAttribute("u_fname"));
	out.println("Current User Id is "+session.getAttribute("u_lname"));
	out.println("Current User Id is "+session.getAttribute("is_Admin"));
	out.println("<a href='logout.jsp'>Logout</a>");
	//session.removeAttribute("u_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
</head>
<body>
	<form action="test" method="POST">
		<input type = "text" name="n1" >
		<input type = "text" name="n2" >
		<input type="Submit">
	</form>
</body>
</html>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Enumeration<String> e = session.getAttributeNames();
	while(e.hasMoreElements())
	{
		String ele = e.nextElement();
		System.out.println(ele+" "+session.getValue(ele));
	}
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
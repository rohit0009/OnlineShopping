<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		if(session.getAttribute("u_id") == null)
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
			session.removeAttribute("u_id");
			session.removeAttribute("u_fname");
			session.removeAttribute("u_lname");
			session.invalidate();
			response.sendRedirect("index.jsp");
		}
	
	%>
</body>
</html>
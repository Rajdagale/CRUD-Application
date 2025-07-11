<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%
	HttpSession session1 = request.getSession(false);

	if (session1 != null && session1.getAttribute("username") != null){
		String username = (String) session1.getAttribute("username");
%>
	<div class="main">
		<h1>Welcome, <%= username %>!</h1>
		<p>Your successfully login.</p>
		<div class="links">
			<a href="logout.jsp">LOGOUT</a>
		</div>
	</div>
<%
	}else {
		response.sendRedirect("login.jsp");
	}
%>
</body>
</html>
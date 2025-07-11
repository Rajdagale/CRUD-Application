<%
    if (request.getAttribute("userList") == null) {
        response.sendRedirect("ShowUsersServlet");
        return;
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.rajdagale.dao.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Users</title>
    <link rel="stylesheet" href="style.css"> <!-- Optional styling -->
</head>
<body>
    <div class="container">
        <h1>Registered Users</h1>



        <table border="1" cellpadding="8" cellspacing="0" style="width:100%; text-align:center;">
            <tr style="background-color: #f2f2f2;">
                <th>Username</th>
                <th>Email</th>
                <th>Password</th>
                <th>Action</th>
            </tr>

            <%
                List<?> userList = (List<?>) request.getAttribute("userList");
                if (userList != null && !userList.isEmpty()) {
                    for (Object obj : userList) {
                        User user = (User) obj;
            %>
            <tr>
                <td><%= user.getUsername() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getPassword() %></td>
                <td>
                    <form action="delete_user.jsp" method="get" style="display:inline;">
                        <input type="hidden" name="username" value="<%= user.getUsername() %>">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4" style="color: red;">No users found.</td>
            </tr>
            <% } %>
        </table>

        <br>
        <a href="index.html">Back to Home</a>
    </div>
</body>
</html>

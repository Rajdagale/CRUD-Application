<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete a User</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h2>Select User to Delete</h2>

    <form action="deleteUser" method="post">
        <label for="username">Choose User:</label>
        <select name="username" id="username" required>
            <option value="">-- Select Username --</option>
            <%
            List<?> rawList = (List<?>) request.getAttribute("usernames");
            if (rawList != null && !rawList.isEmpty()) {
                for (Object o : rawList) {
                    if (o instanceof String) {
                        String user = (String) o;
        %>
                        <option value="<%= user %>"><%= user %></option>
        <%
                    }
                }
            }
            else if (request.getAttribute("usernames") == null) {
                    response.sendRedirect("deleteUserPage");
                    return;
                }
             else {
            %>
                <option disabled>No users found</option>
            <%
                }
            %>
        </select>

        <br><br>
        <button type="submit">Delete</button>
        <a href="ShowUsersServlet"><button type="button">Cancel</button></a>
    </form>
</div>
</body>
</html>

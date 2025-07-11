package com.rajdagale.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.rajdagale.util.DBUtil;

@WebServlet("/deleteUserPage")
public class DeleteUserSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        List<String> usernames = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT username FROM users");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                usernames.add(rs.getString("username"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("usernames", usernames);
        request.getRequestDispatcher("delete_user.jsp").forward(request, response);
    }
}
	
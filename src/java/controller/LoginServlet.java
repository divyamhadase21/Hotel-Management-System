package controller;

import util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM admin WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Login success
                HttpSession session = request.getSession();
                session.setAttribute("loggedIn", true);
                session.setAttribute("username", username);
                response.sendRedirect(
                    request.getContextPath() + "/dashboard.jsp");
            } else {
                // Login failed
                response.sendRedirect(
                    request.getContextPath() + "/login.jsp?error=invalid");
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(
                request.getContextPath() + "/login.jsp?error=invalid");
        }
    }
}
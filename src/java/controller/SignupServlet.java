
package controller;

import util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "insert into admin(username,password) values(?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            int i = ps.executeUpdate();

            if(i > 0) {

                response.sendRedirect("login.jsp");

            } else {

                response.getWriter().println("Signup Failed");
            }

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}


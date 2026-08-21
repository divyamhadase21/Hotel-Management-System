package controller;

import util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("Username = " + username);
        System.out.println("Password = " + password);

        try {

            Connection con = DBConnection.getConnection();

            System.out.println("Connection = " + con);

            String sql = "UPDATE admin SET password=? WHERE username=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, password);
            ps.setString(2, username);

            int result = ps.executeUpdate();

            System.out.println("Rows Updated = " + result);

            if(result > 0){

                System.out.println("Password Updated Successfully");

                response.sendRedirect(
                        request.getContextPath()
                        + "/login.jsp?msg=resetsuccess");

            }else{

                System.out.println("Username Not Found");

                response.sendRedirect(
                        request.getContextPath()
                        + "/forgotPassword.jsp?msg=failed");
            }

            ps.close();
            con.close();

        } catch(Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/forgotPassword.jsp?msg=error");
        }
    }
}
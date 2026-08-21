package servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CheckOutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String guestName    = request.getParameter("guestName");
        String roomNumber   = request.getParameter("roomNumber");
        String checkOutDate = request.getParameter("checkOutDate");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/hoteldb", "root", "root");

            // Insert into check_out table
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO check_out (guest_name, room_number, checkout_date) VALUES (?,?,?)");
            ps.setString(1, guestName);
            ps.setString(2, roomNumber);
            ps.setString(3, checkOutDate);
            ps.executeUpdate();

            // Update room status back to Available
            PreparedStatement ps2 = con.prepareStatement(
                "UPDATE room SET status='Available' WHERE roomNumber=?");
            ps2.setString(1, roomNumber);
            ps2.executeUpdate();

            con.close();
            response.sendRedirect("dashboard.jsp?msg=checkout_success");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("bookings/checkOut.jsp?error=true");
        }
    }
}
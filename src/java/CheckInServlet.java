package servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CheckInServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String guestName    = request.getParameter("guestName");
        String roomNumber   = request.getParameter("roomNumber");
        String checkInDate  = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        int    guests       = Integer.parseInt(request.getParameter("guests"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/hoteldb", "root", "root");

            // Insert into check_in table
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO check_in (guest_name, room_number, checkin_date, checkout_date, num_guests) VALUES (?,?,?,?,?)");
            ps.setString(1, guestName);
            ps.setString(2, roomNumber);
            ps.setString(3, checkInDate);
            ps.setString(4, checkOutDate);
            ps.setInt   (5, guests);
            ps.executeUpdate();

            // Update room status to Booked
            PreparedStatement ps2 = con.prepareStatement(
                "UPDATE room SET status='Booked' WHERE roomNumber=?");
            ps2.setString(1, roomNumber);
            ps2.executeUpdate();

            con.close();
            response.sendRedirect("dashboard.jsp?msg=checkin_success");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("bookings/checkIn.jsp?error=true");
        }
    }
}
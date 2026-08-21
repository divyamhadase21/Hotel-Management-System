package servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class BanquetServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String organizerName = request.getParameter("organizerName");
        String eventType     = request.getParameter("eventType");
        String eventDate     = request.getParameter("eventDate");
        int    guests        = Integer.parseInt(request.getParameter("guests"));
        String requirements  = request.getParameter("requirements");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/hoteldb", "root", "root");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO banquet (organizer_name, event_type, event_date, num_guests, requirements) VALUES (?,?,?,?,?)");
            ps.setString(1, organizerName);
            ps.setString(2, eventType);
            ps.setString(3, eventDate);
            ps.setInt   (4, guests);
            ps.setString(5, requirements);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("dashboard.jsp?msg=banquet_success");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("bookings/banquet.jsp?error=true");
        }
    }
}
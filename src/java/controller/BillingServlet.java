package servlet;

import util.DBConnection;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String guestName     = request.getParameter("guestName");
        String roomNumber    = request.getParameter("roomNumber");
        String checkinDate   = request.getParameter("checkinDate");
        String checkoutDate  = request.getParameter("checkoutDate");
        int    numDays       = Integer.parseInt(request.getParameter("numDays"));
        double roomCharge    = Double.parseDouble(request.getParameter("roomCharge"));
        double foodCharge    = Double.parseDouble(request.getParameter("foodCharge"));
        double banquetCharge = Double.parseDouble(request.getParameter("banquetCharge"));
        String paymentMethod = request.getParameter("paymentMethod");

        double subtotal   = roomCharge + foodCharge + banquetCharge;
        double gstPercent = 18.0;
        double gstAmount  = (subtotal * gstPercent) / 100;
        double total      = subtotal + gstAmount;

        try {
            Connection con = DBConnection.getConnection();

            // Insert into billing
            String sql = "INSERT INTO billing (guest_name, room_number, " +
                         "checkin_date, checkout_date, num_days, room_charge, " +
                         "food_charge, banquet_charge, subtotal, gst_percent, " +
                         "gst_amount, total_amount, payment_status) " +
                         "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,'Paid')";

            PreparedStatement ps = con.prepareStatement(sql,
                                   Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, guestName);
            ps.setString(2, roomNumber);
           ps.setDate(3, java.sql.Date.valueOf(checkinDate));
ps.setDate(4, java.sql.Date.valueOf(checkoutDate));
            ps.setInt(5, numDays);
            ps.setDouble(6, roomCharge);
            ps.setDouble(7, foodCharge);
            ps.setDouble(8, banquetCharge);
            ps.setDouble(9, subtotal);
            ps.setDouble(10, gstPercent);
            ps.setDouble(11, gstAmount);
            ps.setDouble(12, total);
            ps.executeUpdate();

            // Get generated bill_id
            ResultSet keys = ps.getGeneratedKeys();
            int billId = 0;
            if (keys.next()) billId = keys.getInt(1);

            // Insert into payments
            String paySql = "INSERT INTO payments " +
                            "(bill_id, guest_name, amount_paid, payment_method) " +
                            "VALUES (?,?,?,?)";
            PreparedStatement ps2 = con.prepareStatement(paySql);
            ps2.setInt(1, billId);
            ps2.setString(2, guestName);
            ps2.setDouble(3, total);
            ps2.setString(4, paymentMethod);
            ps2.executeUpdate();

            // Update room status to Available
            String roomSql = "UPDATE room SET status='Available' WHERE roomNumber=?";
            PreparedStatement ps3 = con.prepareStatement(roomSql);
            ps3.setString(1, roomNumber);
            ps3.executeUpdate();

            // Send to invoice page
            request.setAttribute("billId", billId);
            request.setAttribute("guestName", guestName);
            request.setAttribute("roomNumber", roomNumber);
            request.setAttribute("checkinDate", checkinDate);
            request.setAttribute("checkoutDate", checkoutDate);
            request.setAttribute("numDays", numDays);
            request.setAttribute("roomCharge", roomCharge);
            request.setAttribute("foodCharge", foodCharge);
            request.setAttribute("banquetCharge", banquetCharge);
            request.setAttribute("subtotal", subtotal);
            request.setAttribute("gstPercent", gstPercent);
            request.setAttribute("gstAmount", gstAmount);
            request.setAttribute("totalAmount", total);
            request.setAttribute("paymentMethod", paymentMethod);

            con.close();
            request.getRequestDispatcher("/bookings/invoice.jsp")
                   .forward(request, response);

        } catch (Exception e) {
    e.printStackTrace();
    response.setContentType("text/plain");
    response.getWriter().println("ERROR: " + e.getClass().getName());
    response.getWriter().println("MESSAGE: " + e.getMessage());
}
    }
}
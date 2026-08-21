package servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class MealServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String guestName = request.getParameter("guestName");
        String roomNumber = request.getParameter("roomNumber");
        String mealType = request.getParameter("mealType");
        String[] itemsArr = request.getParameterValues("items");
        String deliveryTime = request.getParameter("deliveryTime");

        // Join selected items
        String items = "None";

        if (itemsArr != null) {
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < itemsArr.length; i++) {
                if (i > 0) {
                    sb.append(", ");
                }
                sb.append(itemsArr[i]);
            }

            items = sb.toString();
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hoteldb",
                "root",
                "root"
            );

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO meal_order " +
                "(guest_name, room_number, meal_type, items, delivery_time) " +
                "VALUES (?,?,?,?,?)"
            );

            ps.setString(1, guestName);
            ps.setString(2, roomNumber);
            ps.setString(3, mealType);
            ps.setString(4, items);
            ps.setString(5, deliveryTime);

            ps.executeUpdate();

            con.close();

            response.sendRedirect("dashboard.jsp?msg=meal_success");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("bookings/meal.jsp?error=true");
        }
    }
}
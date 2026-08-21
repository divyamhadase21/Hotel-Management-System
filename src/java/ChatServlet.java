package servlet;

import dao.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChatServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        String message = request.getParameter("message");

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        if (message == null) {
            out.print("Please enter a message.");
            return;
        }

        message = message.toLowerCase();

        if (message.contains("hello") || message.contains("hi")) {
            out.print("Welcome to Luxury Stay Hotel!");
        }

        else if (message.contains("room")) {
            RoomDAO dao = new RoomDAO();
            int totalRooms = dao.getAllRooms().size();

            out.print("Total Rooms Available : " + totalRooms);
        }

        else if (message.contains("price")) {
            out.print("Room prices start from Rs2000.");
        }

        else if (message.contains("booking")) {
            out.print("Please visit Booking section.");
        }
        
        else if (message.contains("checkout") || message.contains("check out")) {
    out.print("Checkout time is 11:00 AM.");
}

else if (message.contains("checkin") || message.contains("check in")) {
    out.print("Check-in time is 2:00 PM.");
}

else if (message.contains("wifi")) {
    out.print("Free WiFi is available for all guests.");
}

else if (message.contains("food") || message.contains("restaurant")) {
    out.print("Our restaurant is open from 7 AM to 11 PM.");
}

else if (message.contains("pool") || message.contains("swimming")) {
    out.print("Swimming pool is open from 6 AM to 9 PM.");
}

else if (message.contains("contact") || message.contains("phone")) {
    out.print("Call us at +91-9876543210.");
}

else if (message.contains("location") || message.contains("address")) {
    out.print("We are located at MG Road, Mumbai, Maharashtra.");
}

        else {
            out.print("Sorry, I didn't understand.");
        }
    }
}
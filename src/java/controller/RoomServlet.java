package controller;

import dao.RoomDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Room;

@WebServlet("/RoomServlet")
public class RoomServlet extends HttpServlet {

    // ---------------------------------------------------------------- POST (Add Room)
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {
            String roomNumber = request.getParameter("roomNumber");
            String roomType   = request.getParameter("roomType");
            String priceStr   = request.getParameter("price");
            String status     = request.getParameter("status");

            System.out.println("[RoomServlet] roomNumber=" + roomNumber
                             + " roomType=" + roomType
                             + " price=" + priceStr
                             + " status=" + status);

            // Null / empty guard
            if (isEmpty(roomNumber) || isEmpty(roomType)
                    || isEmpty(priceStr) || isEmpty(status)) {
                response.sendRedirect(
                    request.getContextPath() + "/rooms/addRoom.jsp?msg=missing");
                return;
            }

            double price;
            try {
                price = Double.parseDouble(priceStr.trim());
            } catch (NumberFormatException e) {
                response.sendRedirect(
                    request.getContextPath() + "/rooms/addRoom.jsp?msg=invalidprice");
                return;
            }

            Room room = new Room();
            room.setRoomNumber(roomNumber.trim());
            room.setRoomType(roomType.trim());
            room.setPrice(price);
            room.setStatus(status.trim());

            RoomDAO dao    = new RoomDAO();
            boolean result = dao.addRoom(room);
            System.out.println("[RoomServlet] DAO result = " + result);

            if (result) {
                response.sendRedirect(
                    request.getContextPath() + "/rooms/addRoom.jsp?msg=success");
            } else {
                response.sendRedirect(
                    request.getContextPath() + "/rooms/addRoom.jsp?msg=failed");
            }

        } catch (Exception e) {
            System.err.println("[RoomServlet] Unexpected error: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(
                request.getContextPath() + "/rooms/addRoom.jsp?msg=error");
        }
    }

    // ---------------------------------------------------------------- GET (View / Delete)
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        RoomDAO dao   = new RoomDAO();

        // ---- Delete action ----
        if ("delete".equals(action)) {
            String roomNumber = request.getParameter("roomNumber");

            if (isEmpty(roomNumber)) {
                request.setAttribute("errorMsg", "Room number missing for delete.");
            } else {
                boolean deleted = dao.deleteRoom(roomNumber);
                if (deleted) {
                    request.setAttribute("successMsg",
                        "Room " + roomNumber + " deleted successfully.");
                } else {
                    request.setAttribute("errorMsg",
                        "Could not delete room " + roomNumber + ". Try again.");
                }
            }
        }

        // ---- Always load all rooms and forward to viewRooms.jsp ----
        List<Room> rooms = dao.getAllRooms();
        request.setAttribute("rooms", rooms);

        request.getRequestDispatcher("/rooms/viewRooms.jsp")
               .forward(request, response);
    }

    // ---------------------------------------------------------------- Helper
    private boolean isEmpty(String s) {
        return s == null || s.trim().isEmpty();
    }
}
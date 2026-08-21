package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Room;
import util.DBConnection;

public class RoomDAO {

    // ------------------------------------------------------------------ ADD
    public boolean addRoom(Room room) {
        String sql = "INSERT INTO room(roomNumber, roomType, price, status) VALUES(?,?,?,?)";
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBConnection.getConnection();

            if (con == null) {
                System.err.println("[RoomDAO] addRoom() -> connection is NULL, aborting.");
                return false;
            }

            System.out.println("[RoomDAO] addRoom() -> " + room);

            ps = con.prepareStatement(sql);
            ps.setString(1, room.getRoomNumber());
            ps.setString(2, room.getRoomType());
            ps.setDouble(3, room.getPrice());
            ps.setString(4, room.getStatus());

            int rows = ps.executeUpdate();
            System.out.println("[RoomDAO] addRoom() -> rows affected = " + rows);
            return rows > 0;

        } catch (SQLException e) {
    if (e.getErrorCode() == 1062) {          // MySQL: duplicate entry
        System.err.println("[RoomDAO] addRoom() -> Duplicate roomNumber: " + room.getRoomNumber());
    } else {
        System.err.println("[RoomDAO] addRoom() -> SQL Error!");
        System.err.println("  SQLState : " + e.getSQLState());
        System.err.println("  ErrorCode: " + e.getErrorCode());
        System.err.println("  Message  : " + e.getMessage());
        e.printStackTrace();
    }
    return false;

        } catch (Exception e) {
            System.err.println("[RoomDAO] addRoom() -> Unexpected error: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            // Always close resources
            try { if (ps  != null) ps.close();  } catch (SQLException ignored) {}
            try { if (con != null) con.close();  } catch (SQLException ignored) {}
        }
    }

    // ------------------------------------------------------------------ GET ALL
    public List<Room> getAllRooms() {
       List<Room> rooms = new ArrayList<Room>();
        String sql = "SELECT * FROM room ORDER BY roomNumber";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();
            if (con == null) return rooms;

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Room r = new Room();
                r.setRoomNumber(rs.getString("roomNumber"));
                r.setRoomType(rs.getString("roomType"));
                r.setPrice(rs.getDouble("price"));
                r.setStatus(rs.getString("status"));
                rooms.add(r);
            }
        } catch (SQLException e) {
            System.err.println("[RoomDAO] getAllRooms() -> " + e.getMessage());
            e.printStackTrace();
        } finally {
            try { if (rs  != null) rs.close();  } catch (SQLException ignored) {}
            try { if (ps  != null) ps.close();  } catch (SQLException ignored) {}
            try { if (con != null) con.close();  } catch (SQLException ignored) {}
        }
        return rooms;
    }

    // ------------------------------------------------------------------ DELETE
    public boolean deleteRoom(String roomNumber) {
        String sql = "DELETE FROM room WHERE roomNumber = ?";
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBConnection.getConnection();
            if (con == null) return false;

            ps = con.prepareStatement(sql);
            ps.setString(1, roomNumber);
            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            System.err.println("[RoomDAO] deleteRoom() -> " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            try { if (ps  != null) ps.close();  } catch (SQLException ignored) {}
            try { if (con != null) con.close();  } catch (SQLException ignored) {}
        }
    }

   
}

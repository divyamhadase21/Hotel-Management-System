<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Room" %>
<%
    List<Room> rooms = (List<Room>) request.getAttribute("rooms");
    if (rooms == null) {
        response.sendRedirect(request.getContextPath() + "/RoomServlet");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Rooms - Hotel Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
        :root { --gold:#C9A84C; --gold-light:#E8C97A; --glass-bg:rgba(12,27,51,0.72); --glass-border:rgba(201,168,76,0.28); --text-primary:#F4EDD8; --text-muted:rgba(244,237,216,0.55); }
        body { min-height:100vh; font-family:'Inter',sans-serif; background:linear-gradient(160deg,rgba(10,20,40,0.88) 0%,rgba(18,32,64,0.82) 100%),url("../images/hotel.jpg"); background-size:cover; background-attachment:fixed; display:flex; flex-direction:column; }
        .navbar { width:100%; padding:18px 60px; display:flex; justify-content:space-between; align-items:center; background:rgba(10,20,40,0.55); backdrop-filter:blur(14px); border-bottom:1px solid var(--glass-border); }
        .logo { font-family:'Playfair Display',serif; color:var(--gold-light); font-size:24px; font-weight:700; }
        .nav-links a { text-decoration:none; color:var(--gold-light); padding:9px 22px; border-radius:50px; border:1.5px solid var(--gold); font-weight:600; font-size:14px; transition:background .25s,color .25s; margin-left:12px; }
        .nav-links a:hover { background:var(--gold); color:#0C1B33; }
        .container { flex:1; padding:40px 60px; }
        h1 { font-family:'Playfair Display',serif; color:var(--text-primary); font-size:28px; margin-bottom:8px; }
        .divider { width:52px; height:2px; background:linear-gradient(90deg,transparent,var(--gold),transparent); margin:12px 0 28px; }

        .stats-bar { display:flex; gap:20px; margin-bottom:28px; }
        .stat-box { flex:1; background:var(--glass-bg); backdrop-filter:blur(16px); border:1px solid var(--glass-border); border-radius:14px; padding:18px 22px; text-align:center; border-top:4px solid var(--gold); }
        .stat-box.available { border-top-color:#81c784; }
        .stat-box.booked { border-top-color:#e57373; }
        .stat-box.maintenance { border-top-color:#ffd54f; }
        .stat-box .count { font-size:32px; font-weight:bold; color:var(--gold-light); }
        .stat-box .label { font-size:13px; color:var(--text-muted); margin-top:4px; }

        .page-header { display:flex; justify-content:space-between; align-items:center; margin-bottom:20px; }
        .btn-add { text-decoration:none; color:var(--gold-light); padding:9px 22px; border-radius:50px; border:1.5px solid var(--gold); font-weight:600; font-size:14px; transition:background .25s,color .25s; }
        .btn-add:hover { background:var(--gold); color:#0C1B33; }

        .msg-success { background:rgba(76,175,80,0.15); color:#81c784; padding:12px 18px; border-radius:8px; margin-bottom:20px; border-left:4px solid #81c784; font-weight:600; }
        .msg-error { background:rgba(229,115,115,0.15); color:#e57373; padding:12px 18px; border-radius:8px; margin-bottom:20px; border-left:4px solid #e57373; font-weight:600; }

        table { width:100%; border-collapse:collapse; background:var(--glass-bg); backdrop-filter:blur(16px); border-radius:14px; overflow:hidden; border:1px solid var(--glass-border); }
        thead { background:rgba(201,168,76,0.2); }
        th { padding:14px 18px; text-align:left; color:var(--gold-light); font-size:13px; font-weight:600; letter-spacing:.4px; text-transform:uppercase; border-bottom:1px solid var(--glass-border); }
        td { padding:13px 18px; color:var(--text-primary); font-size:14px; border-bottom:1px solid rgba(201,168,76,0.1); }
        tr:last-child td { border-bottom:none; }
        tr:hover td { background:rgba(201,168,76,0.07); }

        .badge { padding:4px 12px; border-radius:20px; font-size:12px; font-weight:600; display:inline-block; }
        .badge-available { background:rgba(76,175,80,0.2); color:#81c784; border:1px solid rgba(76,175,80,0.3); }
        .badge-booked { background:rgba(229,115,115,0.2); color:#e57373; border:1px solid rgba(229,115,115,0.3); }
        .badge-maintenance { background:rgba(255,213,79,0.2); color:#ffd54f; border:1px solid rgba(255,213,79,0.3); }

        .btn-danger { background:rgba(229,115,115,0.2); color:#e57373; border:1px solid rgba(229,115,115,0.4); padding:5px 14px; border-radius:20px; font-size:12px; font-weight:600; cursor:pointer; text-decoration:none; transition:background .25s; }
        .btn-danger:hover { background:rgba(229,115,115,0.4); }

        .no-rooms { text-align:center; color:var(--text-muted); padding:60px 20px; font-size:15px; }
        .no-rooms .icon { font-size:48px; margin-bottom:15px; }
        .price { color:var(--gold-light); font-weight:600; }
        .room-number { color:var(--gold-light); font-weight:600; }

        @media(max-width:700px) { .container { padding:24px 16px; } th,td { padding:10px 12px; font-size:13px; } .stats-bar { flex-direction:column; } }
    </style>
</head>
<body>

<%
    int totalRooms = rooms.size();
    int availableCount = 0, bookedCount = 0, maintenanceCount = 0;
    for (Room r : rooms) {
        String s = r.getStatus().toLowerCase();
        if (s.contains("available")) availableCount++;
        else if (s.contains("booked")) bookedCount++;
        else maintenanceCount++;
    }
    String successMsg = (String) request.getAttribute("successMsg");
    String errorMsg   = (String) request.getAttribute("errorMsg");
%>

<nav class="navbar">
    <div class="logo">♛ Luxury Stay</div>
    <div class="nav-links">
        <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/rooms/addRoom.jsp">Add Room</a>
        <a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>
    </div>
</nav>

<div class="container">

    <% if (successMsg != null) { %>
        <div class="msg-success">✅ <%= successMsg %></div>
    <% } %>
    <% if (errorMsg != null) { %>
        <div class="msg-error">❌ <%= errorMsg %></div>
    <% } %>

    <div class="stats-bar">
        <div class="stat-box">
            <div class="count"><%= totalRooms %></div>
            <div class="label">Total Rooms</div>
        </div>
        <div class="stat-box available">
            <div class="count"><%= availableCount %></div>
            <div class="label">Available</div>
        </div>
        <div class="stat-box booked">
            <div class="count"><%= bookedCount %></div>
            <div class="label">Booked</div>
        </div>
        <div class="stat-box maintenance">
            <div class="count"><%= maintenanceCount %></div>
            <div class="label">Maintenance</div>
        </div>
    </div>

    <div class="page-header">
        <h1>🛏️ Room List</h1>
        <a href="<%= request.getContextPath() %>/rooms/addRoom.jsp" class="btn-add">+ Add New Room</a>
    </div>
    <div class="divider"></div>

    <% if (rooms.isEmpty()) { %>
        <div class="no-rooms">
            <div class="icon">🛏️</div>
            <p>No rooms found in the system.</p>
            <a href="<%= request.getContextPath() %>/rooms/addRoom.jsp" class="btn-add">Add First Room</a>
        </div>
    <% } else { %>
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Room Number</th>
                <th>Room Type</th>
                <th>Price / Night</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% int i = 1; for (Room r : rooms) {
                String statusLower = r.getStatus().toLowerCase();
                String badgeClass = statusLower.contains("available") ? "badge-available"
                                  : statusLower.contains("booked")    ? "badge-booked"
                                  : "badge-maintenance";
            %>
            <tr>
                <td><%= i++ %></td>
                <td class="room-number"><%= r.getRoomNumber() %></td>
                <td><%= r.getRoomType() %></td>
                <td class="price">₹<%= String.format("%.2f", r.getPrice()) %></td>
                <td>
                    <span class="badge <%= badgeClass %>">
                        <%= r.getStatus() %>
                    </span>
                </td>
                <td>
                    <a href="<%= request.getContextPath() %>/RoomServlet?action=delete&roomNumber=<%= r.getRoomNumber() %>"
                       class="btn-danger"
                       onclick="return confirm('Delete Room <%= r.getRoomNumber() %>?')">
                       🗑 Delete
                    </a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } %>
</div>

</body>
</html>
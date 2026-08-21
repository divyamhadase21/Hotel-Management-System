<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Check Out Records</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
        :root { --gold:#C9A84C; --gold-light:#E8C97A; --glass-bg:rgba(12,27,51,0.72); --glass-border:rgba(201,168,76,0.28); --text-primary:#F4EDD8; --text-muted:rgba(244,237,216,0.55); }
        body { min-height:100vh; font-family:'Inter',sans-serif; background:linear-gradient(160deg,rgba(10,20,40,0.88) 0%,rgba(18,32,64,0.82) 100%),url("../images/hotel.jpg"); background-size:cover; background-attachment:fixed; display:flex; flex-direction:column; }
        .navbar { width:100%; padding:18px 60px; display:flex; justify-content:space-between; align-items:center; background:rgba(10,20,40,0.55); backdrop-filter:blur(14px); border-bottom:1px solid var(--glass-border); }
        .logo { font-family:'Playfair Display',serif; color:var(--gold-light); font-size:24px; font-weight:700; }
        .back-btn { text-decoration:none; color:var(--gold-light); padding:9px 22px; border-radius:50px; border:1.5px solid var(--gold); font-weight:600; font-size:14px; transition:background .25s,color .25s; }
        .back-btn:hover { background:var(--gold); color:#0C1B33; }
        .container { flex:1; padding:40px 60px; }
        h1 { font-family:'Playfair Display',serif; color:var(--text-primary); font-size:28px; margin-bottom:8px; }
        .divider { width:52px; height:2px; background:linear-gradient(90deg,transparent,var(--gold),transparent); margin:12px 0 28px; }
        table { width:100%; border-collapse:collapse; background:var(--glass-bg); backdrop-filter:blur(16px); border-radius:14px; overflow:hidden; border:1px solid var(--glass-border); }
        thead { background:rgba(201,168,76,0.2); }
        th { padding:14px 18px; text-align:left; color:var(--gold-light); font-size:13px; font-weight:600; letter-spacing:.4px; text-transform:uppercase; border-bottom:1px solid var(--glass-border); }
        td { padding:13px 18px; color:var(--text-primary); font-size:14px; border-bottom:1px solid rgba(201,168,76,0.1); }
        tr:last-child td { border-bottom:none; }
        tr:hover td { background:rgba(201,168,76,0.07); }
        .badge { padding:4px 12px; border-radius:20px; font-size:12px; font-weight:600; background:rgba(244,67,54,0.18); color:#ef9a9a; border:1px solid rgba(244,67,54,0.3); }
        .no-data { text-align:center; color:var(--text-muted); padding:40px; font-size:15px; }
        @media(max-width:700px) { .container { padding:24px 16px; } th,td { padding:10px 12px; font-size:13px; } }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">♛ Luxury Stay</div>
        <a href="../dashboard.jsp" class="back-btn">← Back</a>
    </nav>
    <div class="container">
        <h1>🚪 Check Out Records</h1>
        <div class="divider"></div>
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Guest Name</th>
                    <th>Room No.</th>
                    <th>Check-Out Date</th>
                    <th>Status</th>
                    <th>Recorded At</th>
                </tr>
            </thead>
            <tbody>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/hoteldb", "root", "root");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM check_out ORDER BY created_at DESC");
                    int i = 1;
                    boolean hasData = false;
                    while(rs.next()) {
                        hasData = true;
            %>
                <tr>
                    <td><%= i++ %></td>
                    <td><%= rs.getString("guest_name") %></td>
                    <td><%= rs.getString("room_number") %></td>
                    <td><%= rs.getString("checkout_date") %></td>
                    <td><span class="badge"><%= rs.getString("status") %></span></td>
                    <td><%= rs.getTimestamp("created_at") %></td>
                </tr>
            <%
                    }
                    if(!hasData) {
            %>
                <tr><td colspan="6" class="no-data">No check-out records found.</td></tr>
            <%
                    }
                    con.close();
                } catch(Exception e) {
            %>
                <tr><td colspan="6" class="no-data">Error: <%= e.getMessage() %></td></tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</body>
</html>
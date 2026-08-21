<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Banquet Reservation — Luxury Stay</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
        :root { --gold:#C9A84C; --gold-light:#E8C97A; --glass-bg:rgba(12,27,51,0.72); --glass-border:rgba(201,168,76,0.28); --text-primary:#F4EDD8; --text-muted:rgba(244,237,216,0.55); }
        body { min-height:100vh; font-family:'Inter',sans-serif; background:linear-gradient(160deg,rgba(10,20,40,0.88) 0%,rgba(18,32,64,0.82) 100%),url("../images/hotel.jpg"); background-size:cover; background-position:center; background-attachment:fixed; display:flex; flex-direction:column; }
        .navbar { width:100%; padding:18px 60px; display:flex; justify-content:space-between; align-items:center; background:rgba(10,20,40,0.55); backdrop-filter:blur(14px); border-bottom:1px solid var(--glass-border); position:sticky; top:0; z-index:100; }
        .logo { font-family:'Playfair Display',serif; color:var(--gold-light); font-size:24px; font-weight:700; }
        .back-btn { text-decoration:none; color:var(--gold-light); padding:9px 22px; border-radius:50px; border:1.5px solid var(--gold); font-weight:600; font-size:14px; transition:background .25s,color .25s; }
        .back-btn:hover { background:var(--gold); color:#0C1B33; }
        .container { flex:1; display:flex; justify-content:center; align-items:center; padding:40px 20px; }
        .card { width:520px; max-width:100%; background:var(--glass-bg); backdrop-filter:blur(24px); border:1px solid var(--glass-border); border-radius:26px; padding:44px 40px; box-shadow:0 28px 70px rgba(0,0,0,0.55); animation:fadeUp .5s cubic-bezier(.22,.68,0,1.15) both; }
        @keyframes fadeUp { from{opacity:0;transform:translateY(30px)} to{opacity:1;transform:translateY(0)} }
        .card-icon { font-size:36px; display:block; text-align:center; margin-bottom:12px; }
        h1 { font-family:'Playfair Display',serif; color:var(--text-primary); font-size:28px; font-weight:700; text-align:center; margin-bottom:8px; }
        .divider { width:50px; height:2px; background:linear-gradient(90deg,transparent,var(--gold),transparent); margin:16px auto 28px; }
        .form-group { margin-bottom:18px; }
        label { display:block; color:var(--text-muted); font-size:13px; font-weight:500; margin-bottom:6px; }
        input, select, textarea { width:100%; padding:11px 16px; border-radius:10px; border:1px solid var(--glass-border); background:rgba(255,255,255,0.07); color:var(--text-primary); font-size:14px; font-family:'Inter',sans-serif; outline:none; transition:border-color .2s; }
        input:focus, select:focus, textarea:focus { border-color:var(--gold); }
        select option { background:#0C1B33; }
        textarea { resize:vertical; min-height:80px; }
        .submit-btn { width:100%; padding:13px; border-radius:12px; border:none; background:linear-gradient(135deg,var(--gold),var(--gold-light)); color:#0C1B33; font-size:15px; font-weight:700; cursor:pointer; margin-top:8px; transition:transform .2s,box-shadow .2s; }
        .submit-btn:hover { transform:translateY(-2px); box-shadow:0 8px 24px rgba(201,168,76,0.4); }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">♛ Luxury Stay</div>
        <a href="../dashboard.jsp" class="back-btn">← Back</a>
    </nav>
    <div class="container">
        <div class="card">
            <span class="card-icon">🎊</span>
            <h1>Banquet Reservation</h1>
            <div class="divider"></div>
            <form action="../BanquetServlet" method="post">
                <div class="form-group">
                    <label>Organizer Name</label>
                    <input type="text" name="organizerName" placeholder="Full name" required/>
                </div>
                <div class="form-group">
                    <label>Event Type</label>
                    <select name="eventType" required>
                        <option value="">Select event</option>
                        <option>Wedding</option>
                        <option>Birthday Party</option>
                        <option>Corporate Meeting</option>
                        <option>Anniversary</option>
                        <option>Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Event Date</label>
                    <input type="date" name="eventDate" required/>
                </div>
                <div class="form-group">
                    <label>Number of Guests</label>
                    <input type="number" name="guests" min="10" max="500" placeholder="e.g. 100" required/>
                </div>
                <div class="form-group">
                    <label>Special Requirements</label>
                    <textarea name="requirements" placeholder="Decoration, menu preferences..."></textarea>
                </div>
                <button type="submit" class="submit-btn">Reserve Banquet Hall</button>
            </form>
        </div>
    </div>
</body>
</html>
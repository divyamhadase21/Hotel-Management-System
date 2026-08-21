<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Bill</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
        :root { --gold:#C9A84C; --gold-light:#E8C97A; --glass-bg:rgba(12,27,51,0.72); --glass-border:rgba(201,168,76,0.28); --text-primary:#F4EDD8; --text-muted:rgba(244,237,216,0.55); }
        body { min-height:100vh; font-family:'Inter',sans-serif; background:linear-gradient(160deg,rgba(10,20,40,0.88) 0%,rgba(18,32,64,0.82) 100%),url("../images/hotel.jpg"); background-size:cover; background-attachment:fixed; display:flex; flex-direction:column; }
        .navbar { width:100%; padding:18px 60px; display:flex; justify-content:space-between; align-items:center; background:rgba(10,20,40,0.55); backdrop-filter:blur(14px); border-bottom:1px solid var(--glass-border); }
        .logo { font-family:'Playfair Display',serif; color:var(--gold-light); font-size:24px; font-weight:700; }
        .back-btn { text-decoration:none; color:var(--gold-light); padding:9px 22px; border-radius:50px; border:1.5px solid var(--gold); font-weight:600; font-size:14px; transition:background .25s,color .25s; }
        .back-btn:hover { background:var(--gold); color:#0C1B33; }
        .container { flex:1; padding:40px 60px; max-width:700px; margin:0 auto; width:100%; }
        h1 { font-family:'Playfair Display',serif; color:var(--text-primary); font-size:28px; margin-bottom:8px; }
        .divider { width:52px; height:2px; background:linear-gradient(90deg,transparent,var(--gold),transparent); margin:12px 0 28px; }
        .form-card { background:var(--glass-bg); backdrop-filter:blur(16px); border:1px solid var(--glass-border); border-radius:14px; padding:32px; }
        .form-group { margin-bottom:20px; }
        label { display:block; color:var(--gold-light); font-size:13px; font-weight:600; margin-bottom:8px; text-transform:uppercase; letter-spacing:.4px; }
        input, select { width:100%; padding:12px 16px; background:rgba(12,27,51,0.6); border:1px solid rgba(201,168,76,0.35); border-radius:8px; color:var(--text-primary); font-size:14px; font-family:'Inter',sans-serif; outline:none; transition:border-color .2s; }
        input:focus, select:focus { border-color:var(--gold); }
        input::placeholder { color:var(--text-muted); }
        select option { background:#0C1B33; color:#F4EDD8; }
        .row { display:grid; grid-template-columns:1fr 1fr; gap:16px; }
        .submit-btn { width:100%; padding:14px; background:linear-gradient(135deg,var(--gold),var(--gold-light)); color:#0C1B33; border:none; border-radius:8px; font-size:16px; font-weight:700; cursor:pointer; font-family:'Playfair Display',serif; transition:opacity .2s,transform .2s; margin-top:10px; }
        .submit-btn:hover { opacity:.9; transform:translateY(-1px); }
        .section-title { color:var(--gold); font-size:12px; font-weight:700; text-transform:uppercase; letter-spacing:1px; margin:24px 0 16px; border-bottom:1px solid var(--glass-border); padding-bottom:8px; }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">♛ Luxury Stay</div>
        <a href="../dashboard.jsp" class="back-btn">← Back</a>
    </nav>
    <div class="container">
        <h1>💰 Generate Bill</h1>
        <div class="divider"></div>
        <div class="form-card">
            <form action="<%= request.getContextPath() %>/BillingServlet" method="post">

                <div class="section-title">Guest Information</div>
                <div class="row">
                    <div class="form-group">
                        <label>Guest Name</label>
                        <input type="text" name="guestName" placeholder="Enter guest name" required/>
                    </div>
                    <div class="form-group">
                        <label>Room Number</label>
                        <input type="text" name="roomNumber" placeholder="e.g. 101" required/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label>Check-In Date</label>
                        <input type="date" name="checkinDate" required/>
                    </div>
                    <div class="form-group">
                        <label>Check-Out Date</label>
                        <input type="date" name="checkoutDate" required/>
                    </div>
                </div>
                <div class="form-group">
                    <label>Number of Days</label>
                    <input type="number" name="numDays" min="1" placeholder="e.g. 3" required/>
                </div>

                <div class="section-title">Charges</div>
                <div class="row">
                    <div class="form-group">
                        <label>Room Charge (₹)</label>
                        <input type="number" name="roomCharge" min="0" step="0.01" placeholder="0.00" required/>
                    </div>
                    <div class="form-group">
                        <label>Food Charge (₹)</label>
                        <input type="number" name="foodCharge" min="0" step="0.01" placeholder="0.00" value="0"/>
                    </div>
                </div>
                <div class="form-group">
                    <label>Banquet Charge (₹)</label>
                    <input type="number" name="banquetCharge" min="0" step="0.01" placeholder="0.00" value="0"/>
                </div>

                <div class="section-title">Payment</div>
                <div class="form-group">
                    <label>Payment Method</label>
                    <select name="paymentMethod">
                        <option value="Cash">Cash</option>
                        <option value="Card">Card</option>
                        <option value="UPI">UPI</option>
                        <option value="Net Banking">Net Banking</option>
                    </select>
                </div>

                <button type="submit" class="submit-btn">Generate Invoice →</button>
            </form>
        </div>
    </div>
</body>
</html>
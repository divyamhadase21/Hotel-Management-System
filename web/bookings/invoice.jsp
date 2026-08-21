<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Invoice - Luxury Stay</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
        :root { --gold:#C9A84C; --gold-light:#E8C97A; --glass-bg:rgba(12,27,51,0.72); --glass-border:rgba(201,168,76,0.28); --text-primary:#F4EDD8; --text-muted:rgba(244,237,216,0.55); }
        body { min-height:100vh; font-family:'Inter',sans-serif; background:linear-gradient(160deg,rgba(10,20,40,0.88) 0%,rgba(18,32,64,0.82) 100%),url("../images/hotel.jpg"); background-size:cover; background-attachment:fixed; }
        .navbar { width:100%; padding:18px 60px; display:flex; justify-content:space-between; align-items:center; background:rgba(10,20,40,0.55); backdrop-filter:blur(14px); border-bottom:1px solid var(--glass-border); }
        .logo { font-family:'Playfair Display',serif; color:var(--gold-light); font-size:24px; font-weight:700; }
        .back-btn { text-decoration:none; color:var(--gold-light); padding:9px 22px; border-radius:50px; border:1.5px solid var(--gold); font-weight:600; font-size:14px; transition:background .25s; }
        .back-btn:hover { background:var(--gold); color:#0C1B33; }
        .container { max-width:700px; margin:40px auto; padding:0 20px; }

        /* Invoice Card */
        .invoice { background:var(--glass-bg); backdrop-filter:blur(16px); border:1px solid var(--glass-border); border-radius:16px; padding:40px; }
        .invoice-header { text-align:center; margin-bottom:30px; border-bottom:1px solid var(--glass-border); padding-bottom:24px; }
        .invoice-header h2 { font-family:'Playfair Display',serif; color:var(--gold-light); font-size:32px; }
        .invoice-header p { color:var(--text-muted); font-size:13px; margin-top:6px; }
        .bill-id { display:inline-block; background:rgba(201,168,76,0.2); border:1px solid var(--gold); color:var(--gold-light); padding:4px 16px; border-radius:20px; font-size:13px; font-weight:600; margin-top:10px; }

        .info-grid { display:grid; grid-template-columns:1fr 1fr; gap:16px; margin-bottom:28px; }
        .info-box { background:rgba(12,27,51,0.5); border:1px solid var(--glass-border); border-radius:10px; padding:14px 18px; }
        .info-box .label { color:var(--text-muted); font-size:11px; text-transform:uppercase; letter-spacing:.5px; margin-bottom:4px; }
        .info-box .value { color:var(--text-primary); font-size:14px; font-weight:600; }

        .charges-table { width:100%; border-collapse:collapse; margin-bottom:20px; }
        .charges-table th { padding:12px 16px; text-align:left; color:var(--gold-light); font-size:12px; text-transform:uppercase; letter-spacing:.4px; border-bottom:1px solid var(--glass-border); }
        .charges-table td { padding:12px 16px; color:var(--text-primary); font-size:14px; border-bottom:1px solid rgba(201,168,76,0.08); }
        .charges-table tr:last-child td { border-bottom:none; }

        .total-section { background:rgba(201,168,76,0.12); border:1px solid var(--gold); border-radius:10px; padding:20px 24px; margin-bottom:28px; }
        .total-row { display:flex; justify-content:space-between; margin-bottom:10px; }
        .total-row .t-label { color:var(--text-muted); font-size:14px; }
        .total-row .t-value { color:var(--text-primary); font-size:14px; font-weight:600; }
        .total-row.grand { border-top:1px solid var(--glass-border); padding-top:12px; margin-top:4px; }
        .total-row.grand .t-label { color:var(--gold-light); font-size:16px; font-weight:700; font-family:'Playfair Display',serif; }
        .total-row.grand .t-value { color:var(--gold-light); font-size:20px; font-weight:700; }

        .btn-group { display:flex; gap:12px; }
        .btn-print { flex:1; padding:14px; background:linear-gradient(135deg,var(--gold),var(--gold-light)); color:#0C1B33; border:none; border-radius:8px; font-size:15px; font-weight:700; cursor:pointer; font-family:'Playfair Display',serif; transition:opacity .2s; }
        .btn-print:hover { opacity:.9; }
        .btn-dashboard { flex:1; padding:14px; background:transparent; color:var(--gold-light); border:1.5px solid var(--gold); border-radius:8px; font-size:15px; font-weight:600; cursor:pointer; text-decoration:none; display:flex; align-items:center; justify-content:center; transition:background .2s; }
        .btn-dashboard:hover { background:rgba(201,168,76,0.15); }

        .paid-badge { display:inline-block; background:rgba(76,175,80,0.2); color:#81c784; border:1px solid rgba(76,175,80,0.4); padding:4px 16px; border-radius:20px; font-size:13px; font-weight:600; margin-left:10px; }

        @media print {
            .navbar, .btn-group { display:none; }
            body { background:white; }
            .invoice { border:1px solid #ccc; background:white; color:#000; }
            .invoice-header h2, .info-box .value, .charges-table td { color:#000; }
            .info-box .label, .charges-table th, .total-row .t-label { color:#666; }
            .total-row.grand .t-label, .total-row.grand .t-value { color:#C9A84C; }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">♛ Luxury Stay</div>
        <a href="../dashboard.jsp" class="back-btn">← Dashboard</a>
    </nav>

    <div class="container">
        <div class="invoice">

            <!-- Header -->
            <div class="invoice-header">
                <h2>♛ Luxury Stay</h2>
                <p>Hotel Management System · Official Invoice</p>
                <div class="bill-id">Bill #<%= request.getAttribute("billId") %></div>
                <span class="paid-badge">✓ PAID</span>
            </div>

            <!-- Guest Info -->
            <div class="info-grid">
                <div class="info-box">
                    <div class="label">Guest Name</div>
                    <div class="value"><%= request.getAttribute("guestName") %></div>
                </div>
                <div class="info-box">
                    <div class="label">Room Number</div>
                    <div class="value"><%= request.getAttribute("roomNumber") %></div>
                </div>
                <div class="info-box">
                    <div class="label">Check-In Date</div>
                    <div class="value"><%= request.getAttribute("checkinDate") %></div>
                </div>
                <div class="info-box">
                    <div class="label">Check-Out Date</div>
                    <div class="value"><%= request.getAttribute("checkoutDate") %></div>
                </div>
                <div class="info-box">
                    <div class="label">Number of Days</div>
                    <div class="value"><%= request.getAttribute("numDays") %> Days</div>
                </div>
                <div class="info-box">
                    <div class="label">Payment Method</div>
                    <div class="value"><%= request.getAttribute("paymentMethod") %></div>
                </div>
            </div>

            <!-- Charges Table -->
            <table class="charges-table">
                <thead>
                    <tr>
                        <th>Description</th>
                        <th style="text-align:right">Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>🛏️ Room Charges (<%= request.getAttribute("numDays") %> days)</td>
                        <td style="text-align:right">₹<%= String.format("%.2f", request.getAttribute("roomCharge")) %></td>
                    </tr>
                    <tr>
                        <td>🍽️ Food & Meal Charges</td>
                        <td style="text-align:right">₹<%= String.format("%.2f", request.getAttribute("foodCharge")) %></td>
                    </tr>
                    <tr>
                        <td>🎊 Banquet Charges</td>
                        <td style="text-align:right">₹<%= String.format("%.2f", request.getAttribute("banquetCharge")) %></td>
                    </tr>
                </tbody>
            </table>

            <!-- Total -->
            <div class="total-section">
                <div class="total-row">
                    <span class="t-label">Subtotal</span>
                    <span class="t-value">₹<%= String.format("%.2f", request.getAttribute("subtotal")) %></span>
                </div>
                <div class="total-row">
                    <span class="t-label">GST (<%= request.getAttribute("gstPercent") %>%)</span>
                    <span class="t-value">₹<%= String.format("%.2f", request.getAttribute("gstAmount")) %></span>
                </div>
                <div class="total-row grand">
                    <span class="t-label">Total Amount</span>
                    <span class="t-value">₹<%= String.format("%.2f", request.getAttribute("totalAmount")) %></span>
                </div>
            </div>

            <!-- Buttons -->
            <div class="btn-group">
                <button class="btn-print" onclick="window.print()">🖨️ Print Invoice</button>
                <a href="../dashboard.jsp" class="btn-dashboard">🏠 Dashboard</a>
            </div>

        </div>
    </div>
</body>
</html>
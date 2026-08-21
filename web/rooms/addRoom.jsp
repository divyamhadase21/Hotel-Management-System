<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Room — Hotel Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

    <style>

        *, *::before, *::after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --gold:        #C9A84C;
            --gold-light:  #E8C97A;
            --gold-dim:    rgba(201,168,76,0.18);
            --navy:        #0C1B33;
            --navy-mid:    #122040;
            --glass-bg:    rgba(12, 27, 51, 0.72);
            --glass-border:rgba(201,168,76,0.28);
            --text-primary:#F4EDD8;
            --text-muted:  rgba(244,237,216,0.55);
            --error:       #FF6B6B;
            --success:     #6FCF97;
            --radius:      14px;
        }

        body {
            min-height: 100vh;
            font-family: 'Inter', sans-serif;
            background:
                linear-gradient(160deg, rgba(12,27,51,0.88) 0%, rgba(18,32,64,0.80) 100%),
                url("../images/hotel.jpg");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px 16px;
        }

        /* ── Card ── */
        .card {
            width: 480px;
            max-width: 100%;
            background: var(--glass-bg);
            backdrop-filter: blur(22px);
            -webkit-backdrop-filter: blur(22px);
            border: 1px solid var(--glass-border);
            border-radius: 24px;
            padding: 44px 40px 36px;
            box-shadow:
                0 2px 0 rgba(201,168,76,0.35) inset,
                0 24px 64px rgba(0,0,0,0.55);
            animation: slideUp .45s cubic-bezier(.22,.68,0,1.2) both;
        }

        @keyframes slideUp {
            from { opacity:0; transform:translateY(28px); }
            to   { opacity:1; transform:translateY(0);    }
        }

        /* ── Header ── */
        .card-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .card-header .crown {
            font-size: 26px;
            display: block;
            margin-bottom: 10px;
            filter: drop-shadow(0 0 6px rgba(201,168,76,.6));
        }

        .card-header h2 {
            font-family: 'Playfair Display', serif;
            color: var(--text-primary);
            font-size: 28px;
            font-weight: 700;
            letter-spacing: .5px;
        }

        .card-header p {
            color: var(--text-muted);
            font-size: 13px;
            margin-top: 6px;
            letter-spacing: .4px;
        }

        .divider {
            width: 48px;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--gold), transparent);
            margin: 14px auto 0;
            border-radius: 2px;
        }

        /* ── Alerts ── */
        .alert {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 12px 16px;
            border-radius: var(--radius);
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 20px;
            animation: fadeIn .3s ease;
        }

        @keyframes fadeIn { from{opacity:0} to{opacity:1} }

        .alert.success {
            background: rgba(111,207,151,.12);
            border: 1px solid rgba(111,207,151,.35);
            color: var(--success);
        }

        .alert.error {
            background: rgba(255,107,107,.12);
            border: 1px solid rgba(255,107,107,.35);
            color: var(--error);
        }

        .alert .icon { font-size: 18px; flex-shrink: 0; }

        /* ── Form Groups ── */
        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            color: var(--gold-light);
            font-size: 11.5px;
            font-weight: 600;
            letter-spacing: 1.1px;
            text-transform: uppercase;
            margin-bottom: 8px;
        }

        input[type=text],
        select {
            width: 100%;
            padding: 13px 16px;
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(201,168,76,0.22);
            border-radius: var(--radius);
            color: var(--text-primary);
            font-size: 15px;
            font-family: 'Inter', sans-serif;
            outline: none;
            transition: border-color .25s, box-shadow .25s, background .25s;
            appearance: none;
            -webkit-appearance: none;
        }

        input[type=text]::placeholder {
            color: var(--text-muted);
            font-size: 14px;
        }

        input[type=text]:focus,
        select:focus {
            border-color: var(--gold);
            background: rgba(201,168,76,0.08);
            box-shadow: 0 0 0 3px rgba(201,168,76,0.14);
        }

        /* Select wrapper for custom arrow */
        .select-wrap {
            position: relative;
        }

        .select-wrap::after {
            content: '▾';
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gold);
            font-size: 16px;
            pointer-events: none;
        }

        select option {
            background: var(--navy-mid);
            color: var(--text-primary);
        }

        /* ── Grid for two fields ── */
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        /* ── Submit ── */
        .btn-submit {
            width: 100%;
            padding: 15px;
            margin-top: 8px;
            background: linear-gradient(135deg, var(--gold) 0%, var(--gold-light) 100%);
            color: #0C1B33;
            border: none;
            border-radius: 50px;
            font-size: 15px;
            font-weight: 700;
            font-family: 'Inter', sans-serif;
            letter-spacing: .6px;
            cursor: pointer;
            transition: transform .22s, box-shadow .22s, filter .22s;
            box-shadow: 0 4px 18px rgba(201,168,76,0.38);
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 28px rgba(201,168,76,0.50);
            filter: brightness(1.06);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        /* ── Back Link ── */
        .back-link {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            margin-top: 22px;
            color: var(--text-muted);
            text-decoration: none;
            font-size: 13.5px;
            font-weight: 500;
            letter-spacing: .3px;
            transition: color .2s;
        }

        .back-link:hover { color: var(--gold-light); }

        .back-link svg {
            transition: transform .2s;
        }

        .back-link:hover svg {
            transform: translateX(-3px);
        }

        /* ── Responsive ── */
        @media (max-width: 500px) {
            .card { padding: 32px 22px 28px; }
            .form-row { grid-template-columns: 1fr; }
        }

    </style>
</head>
<body>

<div class="card">

    <!-- Header -->
    <div class="card-header">
        <span class="crown">♛</span>
        <h2>Add New Room</h2>
        <p>Fill in the details to register a room</p>
        <div class="divider"></div>
    </div>

    <!-- Flash Messages -->
    <%
        String msg = request.getParameter("msg");
        if ("success".equals(msg)) {
    %>
    <div class="alert success">
        <span class="icon">✔</span>
        Room added successfully to the system.
    </div>
    <%
        } else if ("failed".equals(msg)) {
    %>
    <div class="alert error">
        <span class="icon">✖</span>
        Failed to add room. Please try again.
    </div>
    <%
        }
    %>

    <!-- Form -->
    <form action="<%=request.getContextPath()%>/RoomServlet" method="post">

        <div class="form-row">
            <div class="form-group">
                <label>Room Number</label>
                <input type="text"
                       name="roomNumber"
                       placeholder="e.g. 101"
                       required>
            </div>

            <div class="form-group">
                <label>Price / Night</label>
                <input type="text"
                       name="price"
                       placeholder="₹ 0000"
                       required>
            </div>
        </div>

        <div class="form-group">
            <label>Room Type</label>
            <div class="select-wrap">
                <select name="roomType" required>
                    <option value="" disabled selected>Select room type</option>
                    <option value="Standard">Standard</option>
                    <option value="Deluxe">Deluxe</option>
                    <option value="Suite">Suite</option>
                    <option value="Presidential Suite">Presidential Suite</option>
                    <option value="Family Room">Family Room</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label>Status</label>
            <div class="select-wrap">
                <select name="status" required>
                    <option value="" disabled selected>Select status</option>
                    <option value="Available">Available</option>
                    <option value="Booked">Booked</option>
                    <option value="Under Maintenance">Under Maintenance</option>
                </select>
            </div>
        </div>

        <button type="submit" class="btn-submit">Add Room</button>

    </form>

    <a href="../dashboard.jsp" class="back-link">
        <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M9 2L4 7L9 12" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        Back to Dashboard
    </a>

</div>

</body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hotel Management System - Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            min-height: 100vh;
            background:
                linear-gradient(160deg, rgba(10,20,40,0.88) 0%, rgba(18,32,64,0.82) 100%),
                url("images/hotel.jpg");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        /* ─── NAVBAR ─── */
        .navbar {
            width: 100%;
            padding: 18px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(10,20,40,0.50);
            backdrop-filter: blur(14px);
            border-bottom: 1px solid rgba(201,168,76,0.22);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .logo {
            font-family: 'Playfair Display', serif;
            color: #E8C97A;
            font-size: 26px;
            font-weight: 700;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 9px;
            letter-spacing: .4px;
        }
        .logo-crown {
            font-size: 20px;
            filter: drop-shadow(0 0 5px rgba(201,168,76,.6));
        }
        .nav-links { display: flex; align-items: center; gap: 4px; }
        .nav-links a {
            color: rgba(244,237,216,0.75);
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            padding: 8px 18px;
            border-radius: 8px;
            transition: all 0.25s;
            letter-spacing: .3px;
            position: relative;
        }
        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: 4px; left: 18px;
            width: 0; height: 1.5px;
            background: #C9A84C;
            transition: width 0.3s;
        }
        .nav-links a:hover { color: #E8C97A; }
        .nav-links a:hover::after { width: calc(100% - 36px); }

        /* ─── OVERLAY ─── */
        .overlay {
            min-height: calc(100vh - 63px);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        /* ─── Hero Text ─── */
        .hero-eyebrow {
            font-size: 11px;
            letter-spacing: 3.5px;
            text-transform: uppercase;
            color: #C9A84C;
            margin-bottom: 12px;
            font-weight: 600;
        }
        .title {
            font-family: 'Playfair Display', serif;
            color: #F4EDD8;
            font-size: 42px;
            font-weight: 700;
            letter-spacing: 1px;
            margin-bottom: 10px;
            text-align: center;
            text-shadow: 0 4px 20px rgba(0,0,0,.5);
        }
        .subtitle {
            color: rgba(244,237,216,0.55);
            font-size: 15px;
            margin-bottom: 36px;
            text-align: center;
            letter-spacing: .3px;
        }
        .hero-divider {
            width: 48px;
            height: 1.5px;
            background: linear-gradient(90deg, transparent, #C9A84C, transparent);
            margin: 0 auto 36px;
            border-radius: 2px;
        }

        /* ─── LOGIN BOX ─── */
        .login-box {
            width: 460px;
            max-width: 100%;
            background: rgba(12,27,51,0.70);
            backdrop-filter: blur(24px);
            -webkit-backdrop-filter: blur(24px);
            border: 1px solid rgba(201,168,76,0.28);
            border-radius: 24px;
            padding: 44px 40px 36px;
            box-shadow:
                0 2px 0 rgba(201,168,76,0.30) inset,
                0 28px 70px rgba(0,0,0,0.55);
            animation: fadeUp .5s cubic-bezier(.22,.68,0,1.15) both;
        }

        @keyframes fadeUp {
            from { opacity:0; transform:translateY(28px); }
            to   { opacity:1; transform:translateY(0);    }
        }

        .login-box h2 {
            font-family: 'Playfair Display', serif;
            color: #F4EDD8;
            text-align: center;
            margin-bottom: 6px;
            font-size: 26px;
            font-weight: 700;
        }
        .login-box h2 span { color: #E8C97A; }

        .login-subtitle {
            text-align: center;
            color: rgba(244,237,216,0.45);
            font-size: 13px;
            margin-bottom: 28px;
            letter-spacing: .3px;
        }

        /* Alerts */
        .alert {
            padding: 11px 16px;
            border-radius: 12px;
            margin-bottom: 20px;
            font-size: 13.5px;
            text-align: center;
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        .alert-error {
            background: rgba(231,76,60,0.12);
            border: 1px solid rgba(231,76,60,0.35);
            color: #FF6B6B;
        }
        .alert-success {
            background: rgba(111,207,151,0.12);
            border: 1px solid rgba(111,207,151,0.35);
            color: #6FCF97;
        }

        /* Form */
        .form-group { margin-bottom: 18px; }
        .form-group label {
            display: block;
            color: #E8C97A;
            margin-bottom: 8px;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 1.2px;
            font-weight: 600;
        }
        .form-group input {
            width: 100%;
            padding: 13px 16px;
            border: 1px solid rgba(201,168,76,0.22);
            outline: none;
            border-radius: 12px;
            font-size: 15px;
            background: rgba(255,255,255,0.07);
            color: #F4EDD8;
            font-family: 'Inter', sans-serif;
            transition: all 0.25s;
        }
        .form-group input::placeholder {
            color: rgba(244,237,216,0.30);
            font-size: 14px;
        }
        .form-group input:focus {
            box-shadow: 0 0 0 3px rgba(201,168,76,0.16);
            border-color: #C9A84C;
            background: rgba(201,168,76,0.07);
        }

        /* Buttons */
        .button-area { display: flex; flex-direction: column; gap: 12px; margin-top: 26px; }

        .btn-login {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #C9A84C 0%, #E8C97A 100%);
            color: #0C1B33;
            border: none;
            border-radius: 50px;
            font-size: 15px;
            font-weight: 700;
            font-family: 'Inter', sans-serif;
            letter-spacing: .5px;
            cursor: pointer;
            transition: transform .22s, box-shadow .22s, filter .22s;
            box-shadow: 0 4px 18px rgba(201,168,76,0.38);
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 28px rgba(201,168,76,0.50);
            filter: brightness(1.06);
        }
        .btn-login:active { transform: translateY(0); }

        .btn-row { display: flex; gap: 10px; }
        .btn-secondary {
            flex: 1;
            padding: 12px;
            background: rgba(201,168,76,0.08);
            color: rgba(244,237,216,0.80);
            border: 1px solid rgba(201,168,76,0.25);
            border-radius: 50px;
            font-size: 13.5px;
            font-weight: 600;
            font-family: 'Inter', sans-serif;
            cursor: pointer;
            transition: all 0.25s;
            text-align: center;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            letter-spacing: .2px;
        }
        .btn-secondary:hover {
            background: rgba(201,168,76,0.18);
            border-color: #C9A84C;
            color: #E8C97A;
            transform: translateY(-1px);
        }

        .footer-text {
            margin-top: 24px;
            text-align: center;
            color: rgba(244,237,216,0.30);
            font-size: 12px;
            letter-spacing: .3px;
        }

        /* ─── FORGOT MODAL ─── */
        .modal-overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.75);
            backdrop-filter: blur(6px);
            z-index: 9999;
            justify-content: center;
            align-items: center;
        }
        .modal-overlay.active { display: flex; }
        .modal {
            background: #0C1B33;
            border: 1px solid rgba(201,168,76,0.30);
            border-radius: 22px;
            padding: 42px 38px;
            width: 460px;
            max-width: 92%;
            position: relative;
            box-shadow: 0 2px 0 rgba(201,168,76,0.28) inset, 0 24px 60px rgba(0,0,0,.6);
            animation: popIn 0.3s ease;
        }
        @keyframes popIn {
            from { opacity: 0; transform: scale(0.92); }
            to   { opacity: 1; transform: scale(1); }
        }
        .modal h3 {
            font-family: 'Playfair Display', serif;
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 6px;
            color: #F4EDD8;
        }
        .modal h3 span { color: #E8C97A; }
        .modal > p { color: rgba(244,237,216,0.45); font-size: 13px; margin-bottom: 24px; }
        .modal .close-btn {
            position: absolute;
            top: 16px; right: 20px;
            background: none;
            border: none;
            color: rgba(244,237,216,0.35);
            font-size: 22px;
            cursor: pointer;
            transition: color 0.2s;
            line-height: 1;
        }
        .modal .close-btn:hover { color: #E8C97A; }
        .modal .form-group input {
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(201,168,76,0.20);
            color: #F4EDD8;
        }
        .modal .form-group input::placeholder { color: rgba(244,237,216,0.25); }
        .modal .form-group input:focus { background: rgba(201,168,76,0.07); }
        .modal-btns { display: flex; gap: 10px; margin-top: 22px; }
        .modal-btns .btn-login { flex: 1; padding: 13px; font-size: 14px; }
        .modal-btns .btn-secondary { flex: 1; padding: 13px; font-size: 14px; }

        /* ─── FULL PAGE PANELS (UNCHANGED) ─── */
        .info-panel {
            display: none;
            position: fixed;
            inset: 0;
            z-index: 9998;
            overflow-y: auto;
        }
        .info-panel.active { display: block; }

        .panel-navbar {
            position: sticky;
            top: 0;
            z-index: 10;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 60px;
        }
        .panel-navbar .p-logo {
            font-size: 22px;
            font-weight: 800;
            text-decoration: none;
        }
        .panel-back-btn {
            display: flex;
            align-items: center;
            gap: 8px;
            background: none;
            border: 2px solid rgba(255,255,255,0.3);
            color: white;
            padding: 9px 20px;
            border-radius: 25px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
        }
        .panel-back-btn:hover { transform: translateX(-4px); }

        /* ─── FEATURES PANEL ─── */
        #featuresPanel { background: linear-gradient(135deg, #0f0c29, #302b63, #24243e); }
        #featuresPanel .panel-navbar { background: rgba(0,0,0,0.2); backdrop-filter: blur(10px); border-bottom: 1px solid rgba(255,255,255,0.1); }
        #featuresPanel .p-logo { color: #a78bfa; }
        #featuresPanel .panel-back-btn { border-color: rgba(167,139,250,0.4); }
        #featuresPanel .panel-back-btn:hover { background: rgba(167,139,250,0.15); border-color: #a78bfa; color: #a78bfa; }
        .feat-hero { text-align: center; padding: 60px 40px 50px; }
        .feat-hero .tag { display: inline-block; background: rgba(167,139,250,0.15); border: 1px solid rgba(167,139,250,0.4); color: #a78bfa; padding: 6px 20px; border-radius: 30px; font-size: 12px; letter-spacing: 3px; text-transform: uppercase; margin-bottom: 20px; }
        .feat-hero h1 { font-size: 52px; font-weight: 800; color: white; margin-bottom: 14px; }
        .feat-hero h1 span { color: #a78bfa; }
        .feat-hero p { color: rgba(255,255,255,0.6); font-size: 17px; max-width: 600px; margin: 0 auto; }
        .feat-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; max-width: 1100px; margin: 0 auto; padding: 0 40px 80px; }
        .feat-card { background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); border-radius: 20px; padding: 32px 26px; transition: all 0.3s; }
        .feat-card:hover { background: rgba(167,139,250,0.1); border-color: rgba(167,139,250,0.4); transform: translateY(-8px); box-shadow: 0 20px 40px rgba(167,139,250,0.15); }
        .feat-card .f-icon { width: 60px; height: 60px; border-radius: 16px; background: rgba(167,139,250,0.15); display: flex; align-items: center; justify-content: center; font-size: 28px; margin-bottom: 18px; }
        .feat-card h3 { font-size: 19px; font-weight: 700; color: white; margin-bottom: 10px; }
        .feat-card p { color: rgba(255,255,255,0.5); font-size: 14px; line-height: 1.7; }
        .feat-card .f-badge { display: inline-block; margin-top: 14px; padding: 4px 12px; background: rgba(167,139,250,0.15); color: #a78bfa; border-radius: 20px; font-size: 12px; font-weight: 600; }

        /* ─── ROOMS PANEL ─── */
        #roomsPanel { background: linear-gradient(135deg, #0a0a0a, #1a1a1a, #2d1b00); }
        #roomsPanel .panel-navbar { background: rgba(0,0,0,0.4); backdrop-filter: blur(10px); border-bottom: 1px solid rgba(248,193,70,0.15); }
        #roomsPanel .p-logo { color: #f8c146; }
        #roomsPanel .panel-back-btn { border-color: rgba(248,193,70,0.3); }
        #roomsPanel .panel-back-btn:hover { background: rgba(248,193,70,0.1); border-color: #f8c146; color: #f8c146; }
        .rooms-hero { text-align: center; padding: 60px 40px 50px; position: relative; }
        .rooms-hero .tag { display: inline-block; background: rgba(248,193,70,0.15); border: 1px solid rgba(248,193,70,0.4); color: #f8c146; padding: 6px 20px; border-radius: 30px; font-size: 12px; letter-spacing: 3px; text-transform: uppercase; margin-bottom: 20px; }
        .rooms-hero h1 { font-size: 52px; font-weight: 800; color: white; margin-bottom: 14px; }
        .rooms-hero h1 span { color: #f8c146; }
        .rooms-hero p { color: rgba(255,255,255,0.6); font-size: 17px; }
        .rooms-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 28px; max-width: 1100px; margin: 0 auto; padding: 0 40px 80px; }
        .room-card { border-radius: 20px; overflow: hidden; background: rgba(255,255,255,0.04); border: 1px solid rgba(255,255,255,0.08); transition: all 0.3s; }
        .room-card:hover { transform: translateY(-10px); box-shadow: 0 25px 50px rgba(0,0,0,0.5); border-color: rgba(248,193,70,0.3); }
        .room-card img { width: 100%; height: 220px; object-fit: cover; display: block; }
        .room-info { padding: 22px; }
        .room-info h3 { font-size: 19px; font-weight: 700; color: white; margin-bottom: 8px; }
        .room-info p { color: rgba(255,255,255,0.5); font-size: 13px; margin-bottom: 16px; line-height: 1.6; }
        .room-amenities { display: flex; gap: 8px; flex-wrap: wrap; margin-bottom: 16px; }
        .amenity { background: rgba(255,255,255,0.07); border: 1px solid rgba(255,255,255,0.1); color: rgba(255,255,255,0.7); padding: 3px 10px; border-radius: 20px; font-size: 11px; }
        .room-footer { display: flex; justify-content: space-between; align-items: center; }
        .room-price { color: #f8c146; font-size: 22px; font-weight: 800; }
        .room-price span { font-size: 13px; color: rgba(255,255,255,0.4); font-weight: 400; }
        .room-badge { background: rgba(40,167,69,0.2); color: #28a745; padding: 5px 14px; border-radius: 20px; font-size: 12px; font-weight: 600; border: 1px solid rgba(40,167,69,0.3); }

        /* ─── CONTACT PANEL ─── */
        #contactPanel { background: linear-gradient(135deg, #0d1117, #161b22, #0d1117); }
        #contactPanel .panel-navbar { background: rgba(0,0,0,0.3); backdrop-filter: blur(10px); border-bottom: 1px solid rgba(56,189,248,0.15); }
        #contactPanel .p-logo { color: #38bdf8; }
        #contactPanel .panel-back-btn { border-color: rgba(56,189,248,0.3); }
        #contactPanel .panel-back-btn:hover { background: rgba(56,189,248,0.1); border-color: #38bdf8; color: #38bdf8; }
        .contact-hero { text-align: center; padding: 60px 40px 50px; }
        .contact-hero .tag { display: inline-block; background: rgba(56,189,248,0.1); border: 1px solid rgba(56,189,248,0.3); color: #38bdf8; padding: 6px 20px; border-radius: 30px; font-size: 12px; letter-spacing: 3px; text-transform: uppercase; margin-bottom: 20px; }
        .contact-hero h1 { font-size: 52px; font-weight: 800; color: white; margin-bottom: 14px; }
        .contact-hero h1 span { color: #38bdf8; }
        .contact-hero p { color: rgba(255,255,255,0.6); font-size: 17px; }
        .contact-grid { display: grid; grid-template-columns: 1fr 1.6fr; gap: 30px; max-width: 1100px; margin: 0 auto; padding: 0 40px 80px; }
        .contact-info { background: rgba(255,255,255,0.03); border: 1px solid rgba(255,255,255,0.08); border-radius: 20px; padding: 30px; }
        .contact-info h3 { font-size: 20px; font-weight: 700; color: white; margin-bottom: 22px; }
        .contact-info h3 span { color: #38bdf8; }
        .c-item { display: flex; gap: 14px; margin-bottom: 16px; padding: 14px; background: rgba(255,255,255,0.03); border-radius: 12px; border: 1px solid rgba(255,255,255,0.05); transition: all 0.3s; }
        .c-item:hover { border-color: rgba(56,189,248,0.3); transform: translateX(5px); }
        .c-icon { font-size: 20px; width: 42px; height: 42px; background: rgba(56,189,248,0.1); border-radius: 10px; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
        .c-text h4 { font-size: 11px; color: #38bdf8; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 4px; }
        .c-text p { font-size: 13px; color: rgba(255,255,255,0.7); line-height: 1.5; }
        .social-row { display: flex; gap: 10px; margin-top: 22px; }
        .s-btn { width: 40px; height: 40px; border-radius: 10px; background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); display: flex; align-items: center; justify-content: center; font-size: 16px; text-decoration: none; transition: all 0.3s; }
        .s-btn:hover { background: rgba(56,189,248,0.15); border-color: #38bdf8; transform: translateY(-3px); }
        .contact-form { background: rgba(255,255,255,0.03); border: 1px solid rgba(255,255,255,0.08); border-radius: 20px; padding: 30px; }
        .contact-form h3 { font-size: 20px; font-weight: 700; color: white; margin-bottom: 6px; }
        .contact-form h3 span { color: #38bdf8; }
        .contact-form > p { color: rgba(255,255,255,0.5); font-size: 13px; margin-bottom: 22px; }
        .cf-row { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; }
        .cf-group { margin-bottom: 14px; }
        .cf-group label { display: block; font-size: 11px; color: rgba(255,255,255,0.5); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 6px; }
        .cf-group input, .cf-group select, .cf-group textarea { width: 100%; padding: 11px 14px; background: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.1); border-radius: 10px; color: white; font-size: 14px; outline: none; transition: all 0.3s; font-family: inherit; }
        .cf-group input::placeholder, .cf-group textarea::placeholder { color: rgba(255,255,255,0.25); }
        .cf-group input:focus, .cf-group select:focus, .cf-group textarea:focus { border-color: #38bdf8; background: rgba(56,189,248,0.05); }
        .cf-group select option { background: #0d1117; }
        .cf-group textarea { height: 110px; resize: vertical; }
        .cf-submit { width: 100%; padding: 13px; background: linear-gradient(135deg, #38bdf8, #0284c7); color: white; font-size: 15px; font-weight: 800; border: none; border-radius: 10px; cursor: pointer; transition: all 0.3s; margin-top: 6px; }
        .cf-submit:hover { transform: translateY(-2px); box-shadow: 0 8px 20px rgba(56,189,248,0.4); }
        .cf-success { display: none; background: rgba(40,167,69,0.15); border: 1px solid rgba(40,167,69,0.4); color: #5dd879; padding: 10px 14px; border-radius: 8px; margin-bottom: 14px; font-size: 13px; text-align: center; }

        @media(max-width: 768px) {
            .navbar { padding: 15px 22px; }
            .title { font-size: 28px; }
            .login-box { padding: 30px 22px; }
            .feat-grid, .rooms-grid, .contact-grid { grid-template-columns: 1fr; }
            .panel-navbar { padding: 14px 20px; }
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <a href="index.jsp" class="logo">
        <span class="logo-crown">♛</span>
        Luxury Stay
    </a>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="#" onclick="openPanel('featuresPanel'); return false;">Features</a>
        <a href="#" onclick="openPanel('roomsPanel'); return false;">Rooms</a>
        <a href="#" onclick="openPanel('contactPanel'); return false;">Contact</a>
    </div>
</div>

<!-- MAIN LOGIN -->
<div class="overlay">
    <p class="hero-eyebrow">Welcome to Luxury Stay</p>
    <h1 class="title">Hotel Management System</h1>
    <p class="subtitle">Experience Luxury, Comfort &amp; Seamless Hotel Management</p>
    <div class="hero-divider"></div>

    <div class="login-box">
        <h2>Welcome <span>Back</span> ♛</h2>
        <p class="login-subtitle">Sign in to access your dashboard</p>

        <%
            String msg = request.getParameter("msg");
            if ("invalid".equals(msg)) {
        %>
            <div class="alert alert-error">✖ &nbsp;Invalid username or password</div>
        <% } else if ("logout".equals(msg)) { %>
            <div class="alert alert-success">✔ &nbsp;Logged out successfully</div>
        <% } else if ("resetsuccess".equals(msg)) { %>
            <div class="alert alert-success">✔ &nbsp;Password reset successfully</div>
        <% } %>

        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Enter your username" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="button-area">
                <button type="submit" class="btn-login">Sign In</button>
                <div class="btn-row">
                   <a href="<%=request.getContextPath()%>/signup.jsp" class="btn-secondary">📝 Sign Up</a>
                    <a href="#" onclick="openForgot(); return false;" class="btn-secondary">🔑 Forgot Password</a>
                </div>
            </div>
        </form>
        <div class="footer-text">© 2025 Luxury Stay · Hotel Management System</div>
    </div>
</div>

<!-- FORGOT PASSWORD MODAL -->
<div class="modal-overlay" id="forgotModal">
    <div class="modal">
        <button class="close-btn" onclick="closeForgot()">×</button>
        <h3>Reset <span>Password</span></h3>
        <p>Enter your username and set a new password below.</p>
        <form action="ForgotPasswordServlet" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Enter your username" required>
            </div>
            <div class="form-group">
                <label>New Password</label>
                <input type="password" name="password" placeholder="Enter new password" required>
            </div>
            <div class="modal-btns">
                <button type="submit" class="btn-login">Reset Password</button>
                <button type="button" class="btn-secondary" onclick="closeForgot()">Cancel</button>
            </div>
        </form>
    </div>
</div>

<!-- ═══ FEATURES PANEL (Purple Theme — UNCHANGED) ═══ -->
<div class="info-panel" id="featuresPanel">
    <div class="panel-navbar">
        <span class="p-logo">✨ Features</span>
        <button class="panel-back-btn" onclick="closePanel('featuresPanel')">← Back to Login</button>
    </div>
    <div class="feat-hero">
        <div class="tag">Why Choose Us</div>
        <h1>Our <span>Features</span></h1>
        <p>Powerful tools designed to manage your hotel effortlessly and efficiently</p>
    </div>
    <div class="feat-grid">
        <div class="feat-card"><div class="f-icon">🏨</div><h3>Room Management</h3><p>Add, update, and track all rooms with real-time availability status and dynamic pricing control.</p><span class="f-badge">Core Feature</span></div>
        <div class="feat-card"><div class="f-icon">📅</div><h3>Smart Booking</h3><p>Streamlined reservation system with instant confirmation, reminders, and full booking history.</p><span class="f-badge">Popular</span></div>
        <div class="feat-card"><div class="f-icon">👥</div><h3>Guest Management</h3><p>Complete guest profiles, preferences, special requests, and stay history at your fingertips.</p><span class="f-badge">Essential</span></div>
        <div class="feat-card"><div class="f-icon">💳</div><h3>Billing & Payments</h3><p>Automated invoicing, multiple payment modes, GST reports, and detailed financial analytics.</p><span class="f-badge">Finance</span></div>
        <div class="feat-card"><div class="f-icon">📊</div><h3>Live Dashboard</h3><p>Real-time analytics, occupancy rates, revenue tracking, and performance KPIs on one screen.</p><span class="f-badge">Analytics</span></div>
        <div class="feat-card"><div class="f-icon">🔒</div><h3>Secure Access</h3><p>Role-based login system with encrypted data, audit logs, and secure session management.</p><span class="f-badge">Security</span></div>
    </div>
</div>

<!-- ═══ ROOMS PANEL (Gold/Dark Theme — UNCHANGED) ═══ -->
<div class="info-panel" id="roomsPanel">
    <div class="panel-navbar">
        <span class="p-logo">🏨 Our Rooms</span>
        <button class="panel-back-btn" onclick="closePanel('roomsPanel')">← Back to Login</button>
    </div>
    <div class="rooms-hero">
        <div class="tag">Premium Stays</div>
        <h1>Our <span>Accommodations</span></h1>
        <p>Handcrafted spaces designed for your ultimate comfort and luxury</p>
    </div>
    <div class="rooms-grid">
        <div class="room-card">
            <img src="https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=600" alt="Deluxe">
            <div class="room-info">
                <h3>Deluxe Room</h3>
                <p>Spacious room with king-size bed, city view, and premium amenities for the perfect stay.</p>
                <div class="room-amenities"><span class="amenity">🛏 King Bed</span><span class="amenity">📶 Free WiFi</span><span class="amenity">❄️ AC</span><span class="amenity">🍳 Breakfast</span></div>
                <div class="room-footer"><div class="room-price">₹2,500 <span>/ night</span></div><span class="room-badge">✓ Available</span></div>
            </div>
        </div>
        <div class="room-card">
            <img src="https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=600" alt="Suite">
            <div class="room-info">
                <h3>Executive Suite</h3>
                <p>Luxury suite with separate living area, jacuzzi, and breathtaking panoramic views.</p>
                <div class="room-amenities"><span class="amenity">🛁 Jacuzzi</span><span class="amenity">📶 Free WiFi</span><span class="amenity">🍽 Room Service</span><span class="amenity">🚗 Parking</span></div>
                <div class="room-footer"><div class="room-price">₹5,500 <span>/ night</span></div><span class="room-badge">✓ Available</span></div>
            </div>
        </div>
        <div class="room-card">
            <img src="https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600" alt="Standard">
            <div class="room-info">
                <h3>Standard Room</h3>
                <p>Comfortable and cozy room with all essential amenities for a pleasant, relaxing stay.</p>
                <div class="room-amenities"><span class="amenity">🛏 Queen Bed</span><span class="amenity">📶 Free WiFi</span><span class="amenity">❄️ AC</span><span class="amenity">📺 Smart TV</span></div>
                <div class="room-footer"><div class="room-price">₹1,200 <span>/ night</span></div><span class="room-badge">✓ Available</span></div>
            </div>
        </div>
    </div>
</div>

<!-- ═══ CONTACT PANEL (Blue Theme — UNCHANGED) ═══ -->
<div class="info-panel" id="contactPanel">
    <div class="panel-navbar">
        <span class="p-logo">📬 Contact Us</span>
        <button class="panel-back-btn" onclick="closePanel('contactPanel')">← Back to Login</button>
    </div>
    <div class="contact-hero">
        <div class="tag">📬 Get In Touch</div>
        <h1>Contact <span>Us</span></h1>
        <p>We're available 24/7 to assist you with anything you need</p>
    </div>
    <div class="contact-grid">
        <div class="contact-info">
            <h3>Contact <span>Information</span></h3>
            <div class="c-item"><div class="c-icon">📍</div><div class="c-text"><h4>Address</h4><p>123, Luxury Street, Marine Drive<br>Mumbai, Maharashtra - 400001</p></div></div>
            <div class="c-item"><div class="c-icon">📞</div><div class="c-text"><h4>Phone</h4><p>+91 98765 43210<br>+91 22 1234 5678</p></div></div>
            <div class="c-item"><div class="c-icon">📧</div><div class="c-text"><h4>Email</h4><p>info@luxurystay.com<br>support@luxurystay.com</p></div></div>
            <div class="c-item"><div class="c-icon">🕐</div><div class="c-text"><h4>Working Hours</h4><p>Reception: 24/7<br>Admin: Mon–Sat, 9AM–6PM</p></div></div>
            <div class="social-row">
                <a class="s-btn" href="#">📘</a><a class="s-btn" href="#">📸</a><a class="s-btn" href="#">🐦</a><a class="s-btn" href="#">💬</a><a class="s-btn" href="#">▶️</a>
            </div>
        </div>
        <div class="contact-form">
            <h3>Send Us a <span>Message</span></h3>
            <p>Fill out the form and we'll get back to you within 24 hours.</p>
            <div class="cf-success" id="cfSuccess">✅ Message sent successfully! We'll contact you soon.</div>
            <form onsubmit="sendContact(event)">
                <div class="cf-row">
                    <div class="cf-group"><label>First Name *</label><input type="text" placeholder="Divya" required></div>
                    <div class="cf-group"><label>Last Name *</label><input type="text" placeholder="Mhadse" required></div>
                </div>
                <div class="cf-row">
                    <div class="cf-group"><label>Email *</label><input type="email" placeholder="divya@email.com" required></div>
                    <div class="cf-group"><label>Phone</label><input type="tel" placeholder="+91 98765 43210"></div>
                </div>
                <div class="cf-group">
                    <label>Subject *</label>
                    <select required><option value="" disabled selected>Select a subject</option><option>Room Booking Inquiry</option><option>Reservation Cancellation</option><option>Billing & Payment</option><option>Feedback & Complaint</option><option>Special Request</option><option>Other</option></select>
                </div>
                <div class="cf-group"><label>Message *</label><textarea placeholder="How can we help you?" required></textarea></div>
                <button type="submit" class="cf-submit">📨 Send Message</button>
            </form>
        </div>
    </div>
</div>

<script>
    function openPanel(id) { document.getElementById(id).classList.add('active'); document.body.style.overflow = 'hidden'; }
    function closePanel(id) { document.getElementById(id).classList.remove('active'); document.body.style.overflow = ''; }
    function openForgot() { document.getElementById('forgotModal').classList.add('active'); document.body.style.overflow = 'hidden'; }
    function closeForgot() { document.getElementById('forgotModal').classList.remove('active'); document.body.style.overflow = ''; }
    document.getElementById('forgotModal').addEventListener('click', function(e) { if (e.target === this) closeForgot(); });
    function sendContact(e) { e.preventDefault(); const s = document.getElementById('cfSuccess'); s.style.display = 'block'; e.target.reset(); setTimeout(() => { s.style.display = 'none'; }, 4000); }
    document.addEventListener('keydown', function(e) { if (e.key === 'Escape') { ['featuresPanel','roomsPanel','contactPanel'].forEach(id => { document.getElementById(id).classList.remove('active'); }); closeForgot(); document.body.style.overflow = ''; } });
</script>

</body>
</html>

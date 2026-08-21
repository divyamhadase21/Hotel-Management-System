<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Stay - Hotel Management System</title>
   
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        :root {
            --gold: #f8c146;
            --dark: #1a1a2e;
            --darker: #0f0f1a;
        }

        html { scroll-behavior: smooth; }

        body {
            background: var(--darker);
            color: white;
            overflow-x: hidden;
        }

        /* ─── NAVBAR ─── */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px 80px;
            background: rgba(0,0,0,0.2);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(248,193,70,0.15);
            transition: background 0.4s;
        }
        .navbar.scrolled {
            background: rgba(10,10,20,0.95);
            box-shadow: 0 4px 20px rgba(0,0,0,0.5);
        }
        .logo {
            font-size: 28px;
            font-weight: 800;
            color: var(--gold);
            letter-spacing: 1px;
        }
        .logo span { color: white; }
        .nav-links a {
            color: rgba(255,255,255,0.85);
            text-decoration: none;
            margin-left: 30px;
            font-size: 15px;
            font-weight: 500;
            position: relative;
            transition: color 0.3s;
        }
        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: -4px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--gold);
            transition: width 0.3s;
        }
        .nav-links a:hover { color: var(--gold); }
        .nav-links a:hover::after { width: 100%; }
        .nav-links .btn-nav {
            background: var(--gold);
            color: black;
            padding: 8px 22px;
            border-radius: 25px;
            font-weight: 700;
            margin-left: 30px;
        }
        .nav-links .btn-nav:hover { background: white; color: black; }
        .nav-links .btn-nav::after { display: none; }

        /* ─── HERO ─── */
        .hero {
            height: 100vh;
            background:
                linear-gradient(rgba(0,0,0,0.55), rgba(0,0,0,0.55)),
                url('https://images.unsplash.com/photo-1566073771259-6a8506099945?w=1600');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 0 20px;
            position: relative;
        }
        .hero-badge {
            background: rgba(248,193,70,0.2);
            border: 1px solid var(--gold);
            color: var(--gold);
            padding: 6px 20px;
            border-radius: 30px;
            font-size: 13px;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 25px;
            animation: fadeDown 0.8s ease both;
        }
        .hero h1 {
            font-size: 64px;
            font-weight: 800;
            line-height: 1.15;
            margin-bottom: 22px;
            animation: fadeDown 1s ease 0.2s both;
        }
        .hero h1 span { color: var(--gold); }
        .hero p {
            font-size: 19px;
            max-width: 650px;
            color: rgba(255,255,255,0.8);
            margin-bottom: 38px;
            line-height: 1.7;
            animation: fadeDown 1s ease 0.4s both;
        }
        .hero-btns {
            display: flex;
            gap: 16px;
            animation: fadeDown 1s ease 0.6s both;
        }
        .btn {
            display: inline-block;
            padding: 14px 36px;
            border-radius: 35px;
            font-size: 16px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.3s;
            cursor: pointer;
        }
        .btn-primary {
            background: var(--gold);
            color: black;
            box-shadow: 0 6px 25px rgba(248,193,70,0.4);
        }
        .btn-primary:hover {
            background: white;
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(255,255,255,0.3);
        }
        .btn-outline {
            background: transparent;
            color: white;
            border: 2px solid rgba(255,255,255,0.5);
        }
        .btn-outline:hover {
            border-color: var(--gold);
            color: var(--gold);
            transform: translateY(-3px);
        }
        .scroll-down {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 8px;
            color: rgba(255,255,255,0.5);
            font-size: 12px;
            letter-spacing: 2px;
            animation: bounce 2s infinite;
        }
        .scroll-down::before {
            content: '';
            width: 1px;
            height: 50px;
            background: linear-gradient(to bottom, transparent, var(--gold));
        }

        /* ─── STATS ─── */
        .stats {
            background: var(--dark);
            padding: 50px 80px;
            display: flex;
            justify-content: center;
            gap: 60px;
            border-bottom: 1px solid rgba(255,255,255,0.05);
        }
        .stat-item {
            text-align: center;
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.6s ease;
        }
        .stat-item.visible { opacity: 1; transform: translateY(0); }
        .stat-item .number {
            font-size: 42px;
            font-weight: 800;
            color: var(--gold);
            display: block;
        }
        .stat-item .label {
            font-size: 14px;
            color: rgba(255,255,255,0.5);
            letter-spacing: 1px;
            text-transform: uppercase;
            margin-top: 6px;
        }

        /* ─── SECTIONS ─── */
        .section { padding: 90px 80px; }
        .section-title {
            text-align: center;
            margin-bottom: 60px;
        }
        .section-title .tag {
            color: var(--gold);
            font-size: 13px;
            letter-spacing: 3px;
            text-transform: uppercase;
            display: block;
            margin-bottom: 12px;
        }
        .section-title h2 {
            font-size: 40px;
            font-weight: 800;
            color: white;
        }
        .section-title p {
            color: rgba(255,255,255,0.5);
            margin-top: 12px;
            font-size: 16px;
        }

        /* ─── FEATURES ─── */
        .features-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 28px;
            max-width: 1100px;
            margin: 0 auto;
        }
        .feature-card {
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 16px;
            padding: 36px 28px;
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.6s ease, transform 0.6s ease, background 0.3s, box-shadow 0.3s;
        }
        .feature-card.visible { opacity: 1; transform: translateY(0); }
        .feature-card:hover {
            background: rgba(248,193,70,0.06);
            border-color: rgba(248,193,70,0.3);
            box-shadow: 0 10px 40px rgba(248,193,70,0.1);
            transform: translateY(-6px);
        }
        .feature-card .icon {
            font-size: 42px;
            margin-bottom: 18px;
            display: block;
        }
        .feature-card h3 {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 10px;
        }
        .feature-card p {
            color: rgba(255,255,255,0.5);
            font-size: 14px;
            line-height: 1.7;
        }

        /* ─── ROOMS ─── */
        .rooms-section {
            background: var(--dark);
            padding: 90px 80px;
        }
        .rooms-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
            max-width: 1100px;
            margin: 0 auto;
        }
        .room-card {
            border-radius: 16px;
            overflow: hidden;
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.08);
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.6s ease, transform 0.6s ease, box-shadow 0.3s;
        }
        .room-card.visible { opacity: 1; transform: translateY(0); }
        .room-card:hover {
            box-shadow: 0 15px 50px rgba(0,0,0,0.4);
            transform: translateY(-8px);
        }
        .room-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            display: block;
        }
        .room-info { padding: 22px; }
        .room-info h3 {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 8px;
        }
        .room-info p {
            color: rgba(255,255,255,0.5);
            font-size: 13px;
            margin-bottom: 16px;
        }
        .room-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .room-price {
            color: var(--gold);
            font-size: 20px;
            font-weight: 800;
        }
        .room-price span {
            font-size: 13px;
            color: rgba(255,255,255,0.4);
            font-weight: 400;
        }
        .room-badge {
            background: rgba(40,167,69,0.2);
            color: #28a745;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        /* ─── CONTACT SECTION ─── */
        .contact-section {
            padding: 90px 80px;
            background: var(--darker);
        }
        .contact-grid {
            display: grid;
            grid-template-columns: 1fr 1.6fr;
            gap: 40px;
            max-width: 1100px;
            margin: 0 auto;
            align-items: start;
        }
        .info-card {
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 16px;
            padding: 36px 28px;
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.6s ease, transform 0.6s ease;
        }
        .info-card.visible { opacity: 1; transform: translateY(0); }
        .info-card h2 {
            font-size: 24px;
            font-weight: 800;
            margin-bottom: 8px;
        }
        .info-card h2 span { color: var(--gold); }
        .info-card > p {
            color: rgba(255,255,255,0.5);
            font-size: 14px;
            margin-bottom: 28px;
            line-height: 1.7;
        }
        .contact-item {
            display: flex;
            align-items: flex-start;
            gap: 14px;
            margin-bottom: 18px;
            padding: 16px;
            background: rgba(255,255,255,0.03);
            border-radius: 12px;
            border: 1px solid rgba(255,255,255,0.05);
            transition: all 0.3s;
        }
        .contact-item:hover {
            border-color: rgba(248,193,70,0.3);
            background: rgba(248,193,70,0.05);
            transform: translateX(5px);
        }
        .ci-icon {
            font-size: 24px;
            min-width: 42px;
            height: 42px;
            background: rgba(248,193,70,0.15);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .ci-text h4 {
            font-size: 12px;
            color: var(--gold);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 3px;
        }
        .ci-text p {
            font-size: 14px;
            color: rgba(255,255,255,0.75);
            line-height: 1.5;
        }
        .social-links {
            display: flex;
            gap: 10px;
            margin-top: 24px;
        }
        .social-btn {
            width: 42px;
            height: 42px;
            border-radius: 10px;
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            text-decoration: none;
            transition: all 0.3s;
        }
        .social-btn:hover {
            background: rgba(248,193,70,0.15);
            border-color: var(--gold);
            transform: translateY(-3px);
        }

        /* ─── FORM ─── */
        .form-card {
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 16px;
            padding: 40px;
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.6s ease, transform 0.6s ease;
        }
        .form-card.visible { opacity: 1; transform: translateY(0); }
        .form-card h2 {
            font-size: 24px;
            font-weight: 800;
            margin-bottom: 6px;
        }
        .form-card h2 span { color: var(--gold); }
        .form-card > p {
            color: rgba(255,255,255,0.5);
            font-size: 14px;
            margin-bottom: 28px;
        }
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }
        .form-group { margin-bottom: 18px; }
        .form-group label {
            display: block;
            font-size: 12px;
            color: rgba(255,255,255,0.55);
            margin-bottom: 7px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 10px;
            color: white;
            font-size: 14px;
            outline: none;
            transition: all 0.3s;
            font-family: inherit;
        }
        .form-group input::placeholder,
        .form-group textarea::placeholder {
            color: rgba(255,255,255,0.25);
        }
        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: var(--gold);
            background: rgba(248,193,70,0.05);
            box-shadow: 0 0 0 3px rgba(248,193,70,0.1);
        }
        .form-group select option { background: #1a1a2e; color: white; }
        .form-group textarea { height: 120px; resize: vertical; }
        .rating-group {
            display: flex;
            gap: 6px;
            flex-direction: row-reverse;
            justify-content: flex-end;
        }
        .rating-group input { display: none; }
        .rating-group label {
            font-size: 26px;
            cursor: pointer;
            color: rgba(255,255,255,0.2);
            transition: color 0.2s;
            text-transform: none;
            letter-spacing: 0;
        }
        .rating-group label:hover,
        .rating-group label:hover ~ label,
        .rating-group input:checked ~ label { color: var(--gold); }
        .submit-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, var(--gold), #e6a800);
            color: black;
            font-size: 15px;
            font-weight: 800;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 6px;
        }
        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(248,193,70,0.4);
        }
        .success-msg {
            display: none;
            background: rgba(40,167,69,0.15);
            border: 1px solid rgba(40,167,69,0.4);
            color: #5dd879;
            padding: 12px 16px;
            border-radius: 10px;
            margin-bottom: 18px;
            font-size: 14px;
            text-align: center;
        }

        /* ─── FAQ ─── */
        .faq-section {
            background: var(--dark);
            padding: 90px 80px;
        }
        .faq-grid {
            max-width: 800px;
            margin: 0 auto;
        }
        .faq-item {
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 12px;
            margin-bottom: 12px;
            overflow: hidden;
            transition: border-color 0.3s;
        }
        .faq-item.open { border-color: rgba(248,193,70,0.35); }
        .faq-question {
            padding: 18px 22px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            font-size: 15px;
            font-weight: 600;
            transition: color 0.3s;
        }
        .faq-item.open .faq-question { color: var(--gold); }
        .faq-arrow {
            font-size: 20px;
            transition: transform 0.3s;
            color: var(--gold);
        }
        .faq-item.open .faq-arrow { transform: rotate(45deg); }
        .faq-answer {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.4s ease, padding 0.3s;
            color: rgba(255,255,255,0.55);
            font-size: 14px;
            line-height: 1.7;
            padding: 0 22px;
        }
        .faq-item.open .faq-answer {
            max-height: 200px;
            padding: 0 22px 18px;
        }

        /* ─── CTA ─── */
        .cta-section {
            padding: 90px 80px;
            text-align: center;
            background:
                linear-gradient(rgba(0,0,0,0.75), rgba(0,0,0,0.75)),
                url('https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=1600');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
        .cta-section h2 {
            font-size: 46px;
            font-weight: 800;
            margin-bottom: 16px;
        }
        .cta-section h2 span { color: var(--gold); }
        .cta-section p {
            color: rgba(255,255,255,0.7);
            font-size: 17px;
            margin-bottom: 36px;
        }

        /* ─── FOOTER ─── */
        footer {
            background: #0a0a12;
            padding: 30px 80px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid rgba(255,255,255,0.05);
        }
        footer .logo { font-size: 20px; }
        footer p { color: rgba(255,255,255,0.3); font-size: 13px; }

        /* ─── ANIMATIONS ─── */
        @keyframes fadeDown {
            from { opacity: 0; transform: translateY(-20px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        @keyframes bounce {
            0%, 100% { transform: translateX(-50%) translateY(0); }
            50%       { transform: translateX(-50%) translateY(8px); }
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar" id="navbar">
    <div class="logo">Luxury<span>Stay</span></div>
    <div class="nav-links">
        <a href="#">Home</a>
        <a href="#features">Features</a>
        <a href="#rooms">Rooms</a>
        <a href="#contact">Contact</a>
        <a href="login.jsp" class="btn-nav">Login</a>
    </div>
</nav>

<!-- HERO -->
<section class="hero">
    <div class="hero-badge">⭐ 5-Star Luxury Experience</div>
    <h1>Welcome to <span>Luxury Stay</span><br>Hotel Management</h1>
    <p>Experience world-class hospitality with seamless room booking, premium services, and unforgettable stays crafted just for you.</p>
    <div class="hero-btns">
        <a href="login.jsp" class="btn btn-primary">🚀 Get Started</a>
        <a href="#rooms" class="btn btn-outline">🛏 View Rooms</a>
    </div>
    <div class="scroll-down">SCROLL</div>
</section>

<!-- STATS -->
<div class="stats" id="stats">
    <div class="stat-item">
        <span class="number" data-target="150">0</span>
        <span class="label">Luxury Rooms</span>
    </div>
    <div class="stat-item">
        <span class="number" data-target="5000">0</span>
        <span class="label">Happy Guests</span>
    </div>
    <div class="stat-item">
        <span class="number" data-target="15">0</span>
        <span class="label">Years Experience</span>
    </div>
    <div class="stat-item">
        <span class="number" data-target="98">0</span>
        <span class="label">% Satisfaction</span>
    </div>
</div>

<!-- FEATURES -->
<section class="section" id="features">
    <div class="section-title">
        <span class="tag">Why Choose Us</span>
        <h2>Everything You Need</h2>
        <p>Powerful features to manage your hotel effortlessly</p>
    </div>
    <div class="features-grid">
        <div class="feature-card">
            <span class="icon">🏨</span>
            <h3>Room Management</h3>
            <p>Add, update, and track all rooms with real-time availability status and pricing control.</p>
        </div>
        <div class="feature-card">
            <span class="icon">📅</span>
            <h3>Smart Booking</h3>
            <p>Streamlined reservation system with instant confirmation and booking history.</p>
        </div>
        <div class="feature-card">
            <span class="icon">👥</span>
            <h3>Guest Management</h3>
            <p>Complete guest profiles, preferences, and stay history at your fingertips.</p>
        </div>
        <div class="feature-card">
            <span class="icon">💳</span>
            <h3>Billing & Payments</h3>
            <p>Automated invoicing, multiple payment modes, and detailed financial reports.</p>
        </div>
        <div class="feature-card">
            <span class="icon">📊</span>
            <h3>Live Dashboard</h3>
            <p>Real-time analytics, occupancy rates, and revenue tracking on one screen.</p>
        </div>
        <div class="feature-card">
            <span class="icon">🔒</span>
            <h3>Secure Access</h3>
            <p>Role-based login system with encrypted data and session management.</p>
        </div>
    </div>
</section>

<!-- ROOMS -->
<section class="rooms-section" id="rooms">
    <div class="section-title">
        <span class="tag">Our Rooms</span>
        <h2>Premium Accommodations</h2>
        <p>Handcrafted spaces designed for ultimate comfort</p>
    </div>
    <div class="rooms-grid">
        <div class="room-card">
            <img class="room-img" src="https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=600" alt="Deluxe Room">
            <div class="room-info">
                <h3>Deluxe Room</h3>
                <p>Spacious room with king-size bed, city view, and premium amenities.</p>
                <div class="room-footer">
                    <div class="room-price">₹2,500 <span>/ night</span></div>
                    <span class="room-badge">Available</span>
                </div>
            </div>
        </div>
        <div class="room-card">
            <img class="room-img" src="https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=600" alt="Suite">
            <div class="room-info">
                <h3>Executive Suite</h3>
                <p>Luxury suite with living area, jacuzzi, and panoramic views.</p>
                <div class="room-footer">
                    <div class="room-price">₹5,500 <span>/ night</span></div>
                    <span class="room-badge">Available</span>
                </div>
            </div>
        </div>
        <div class="room-card">
            <img class="room-img" src="https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600" alt="Standard Room">
            <div class="room-info">
                <h3>Standard Room</h3>
                <p>Comfortable room with all essentials for a pleasant stay.</p>
                <div class="room-footer">
                    <div class="room-price">₹1,200 <span>/ night</span></div>
                    <span class="room-badge">Available</span>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CONTACT -->
<section class="contact-section" id="contact">
    <div class="section-title">
        <span class="tag">📬 Get In Touch</span>
        <h2>Contact <span style="color:var(--gold)">Us</span></h2>
        <p>We're available 24/7 to assist you with anything you need</p>
    </div>
    <div class="contact-grid">

        <!-- Info -->
        <div class="info-card">
            <h2>Contact <span>Information</span></h2>
            <p>Reach out through any channel and we'll respond as soon as possible.</p>
            <div class="contact-item">
                <div class="ci-icon">📍</div>
                <div class="ci-text">
                    <h4>Address</h4>
                    <p>123, Luxury Street, Marine Drive<br>Mumbai, Maharashtra - 400001</p>
                </div>
            </div>
            <div class="contact-item">
                <div class="ci-icon">📞</div>
                <div class="ci-text">
                    <h4>Phone</h4>
                    <p>+91 98765 43210<br>+91 22 1234 5678</p>
                </div>
            </div>
            <div class="contact-item">
                <div class="ci-icon">📧</div>
                <div class="ci-text">
                    <h4>Email</h4>
                    <p>info@luxurystay.com<br>support@luxurystay.com</p>
                </div>
            </div>
            <div class="contact-item">
                <div class="ci-icon">🕐</div>
                <div class="ci-text">
                    <h4>Working Hours</h4>
                    <p>Reception: 24/7<br>Admin Office: Mon–Sat, 9AM–6PM</p>
                </div>
            </div>
            <div class="social-links">
                <a class="social-btn" href="#">📘</a>
                <a class="social-btn" href="#">📸</a>
                <a class="social-btn" href="#">🐦</a>
                <a class="social-btn" href="#">💬</a>
                <a class="social-btn" href="#">▶️</a>
            </div>
        </div>

        <!-- Form -->
        <div class="form-card">
            <h2>Send Us a <span>Message</span></h2>
            <p>Fill out the form and we'll get back to you within 24 hours.</p>
            <div class="success-msg" id="successMsg">
                ✅ Thank you! Your message has been sent successfully.
            </div>
            <form id="contactForm" onsubmit="submitForm(event)">
                <div class="form-row">
                    <div class="form-group">
                        <label>First Name *</label>
                        <input type="text" placeholder="Divya" required>
                    </div>
                    <div class="form-group">
                        <label>Last Name *</label>
                        <input type="text" placeholder="Mhadse" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Email *</label>
                        <input type="email" placeholder="divya@email.com" required>
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="tel" placeholder="+91 98765 43210">
                    </div>
                </div>
                <div class="form-group">
                    <label>Subject *</label>
                    <select required>
                        <option value="" disabled selected>Select a subject</option>
                        <option>Room Booking Inquiry</option>
                        <option>Reservation Cancellation</option>
                        <option>Billing & Payment</option>
                        <option>Feedback & Complaint</option>
                        <option>Special Request</option>
                        <option>Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Message *</label>
                    <textarea placeholder="Tell us how we can help you..." required></textarea>
                </div>
                <div class="form-group">
                    <label>Rate Your Experience</label>
                    <div class="rating-group">
                        <input type="radio" id="star5" name="rating" value="5">
                        <label for="star5">★</label>
                        <input type="radio" id="star4" name="rating" value="4">
                        <label for="star4">★</label>
                        <input type="radio" id="star3" name="rating" value="3">
                        <label for="star3">★</label>
                        <input type="radio" id="star2" name="rating" value="2">
                        <label for="star2">★</label>
                        <input type="radio" id="star1" name="rating" value="1">
                        <label for="star1">★</label>
                    </div>
                </div>
                <button type="submit" class="submit-btn">📨 Send Message</button>
            </form>
        </div>
    </div>
</section>

<!-- FAQ -->
<section class="faq-section">
    <div class="section-title">
        <span class="tag">Got Questions?</span>
        <h2>Frequently Asked Questions</h2>
        <p>Everything you need to know about LuxuryStay</p>
    </div>
    <div class="faq-grid">
        <div class="faq-item">
            <div class="faq-question" onclick="toggleFaq(this)">
                What is the check-in and check-out time?
                <span class="faq-arrow">+</span>
            </div>
            <div class="faq-answer">Check-in time is 2:00 PM and check-out is 11:00 AM. Early check-in and late check-out available on request subject to availability.</div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleFaq(this)">
                How can I cancel or modify my reservation?
                <span class="faq-arrow">+</span>
            </div>
            <div class="faq-answer">Contact our front desk at +91 98765 43210 or email support@luxurystay.com at least 24 hours before check-in for a full refund.</div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleFaq(this)">
                Is breakfast included in the room price?
                <span class="faq-arrow">+</span>
            </div>
            <div class="faq-answer">Complimentary breakfast is included with Executive Suite bookings. For other rooms, breakfast can be added for ₹500 per person per day.</div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleFaq(this)">
                Do you offer airport pickup service?
                <span class="faq-arrow">+</span>
            </div>
            <div class="faq-answer">Yes! Complimentary airport pickup for Executive Suite guests. For other rooms, transfers are available at additional charge. Contact us 48 hours in advance.</div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleFaq(this)">
                Is Wi-Fi available throughout the hotel?
                <span class="faq-arrow">+</span>
            </div>
            <div class="faq-answer">Yes, high-speed Wi-Fi is available complimentary throughout the hotel including all rooms, lobby, restaurant, and pool area.</div>
        </div>
    </div>
</section>

<!-- CTA -->
<section class="cta-section">
    <h2>Ready to <span>Experience</span> Luxury?</h2>
    <p>Login to manage rooms, bookings, and guests all in one place.</p>
    <a href="login.jsp" class="btn btn-primary">Login to Dashboard →</a>
</section>

<!-- FOOTER -->
<footer>
    <div class="logo">Luxury<span style="color:white">Stay</span></div>
    <p>&copy; 2026 LuxuryStay Hotel Management System. All rights reserved.</p>
</footer>

<script>
    // Navbar scroll
    window.addEventListener('scroll', () => {
        document.getElementById('navbar').classList.toggle('scrolled', window.scrollY > 50);
    });

    // Intersection Observer
    const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry, i) => {
            if (entry.isIntersecting) {
                setTimeout(() => entry.target.classList.add('visible'), i * 120);
            }
        });
    }, { threshold: 0.1 });

    document.querySelectorAll('.feature-card, .room-card, .stat-item, .info-card, .form-card')
            .forEach(el => observer.observe(el));

    // Counter animation
    const counterObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                document.querySelectorAll('.number').forEach(num => {
                    const target = +num.getAttribute('data-target');
                    const step = target / 60;
                    let current = 0;
                    const timer = setInterval(() => {
                        current += step;
                        if (current >= target) {
                            num.textContent = target + (target === 98 ? '%' : '+');
                            clearInterval(timer);
                        } else {
                            num.textContent = Math.floor(current);
                        }
                    }, 25);
                });
                counterObserver.disconnect();
            }
        });
    }, { threshold: 0.5 });
    counterObserver.observe(document.getElementById('stats'));

    // Contact form
    function submitForm(e) {
        e.preventDefault();
        const msg = document.getElementById('successMsg');
        msg.style.display = 'block';
        document.getElementById('contactForm').reset();
        setTimeout(() => { msg.style.display = 'none'; }, 5000);
    }

    // FAQ
    function toggleFaq(el) {
        const item = el.parentElement;
        const isOpen = item.classList.contains('open');
        document.querySelectorAll('.faq-item').forEach(i => i.classList.remove('open'));
        if (!isOpen) item.classList.add('open');
    }
</script>

</body>
</html>
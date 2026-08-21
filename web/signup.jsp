<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Luxury Stay</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --gold:         #C9A84C;
            --gold-light:   #E8C97A;
            --gold-dim:     rgba(201,168,76,0.15);
            --navy:         #0C1B33;
            --navy-mid:     #122040;
            --glass-bg:     rgba(12,27,51,0.72);
            --glass-border: rgba(201,168,76,0.28);
            --text-primary: #F4EDD8;
            --text-muted:   rgba(244,237,216,0.50);
        }

        * { font-family: 'Inter', 'Segoe UI', sans-serif; }

        body {
            min-height: 100vh;
            background:
                linear-gradient(160deg, rgba(10,20,40,0.88) 0%, rgba(18,32,64,0.82) 100%),
                url("../images/hotel.jpg");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
        }

        /* ─── NAVBAR ─── */
        .navbar {
            width: 100%;
            padding: 18px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(10,20,40,0.55);
            backdrop-filter: blur(14px);
            border-bottom: 1px solid var(--glass-border);
        }
        .logo {
            font-family: 'Playfair Display', serif;
            color: var(--gold-light);
            font-size: 24px;
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
        .nav-links a {
            color: var(--text-muted);
            text-decoration: none;
            margin-left: 20px;
            font-size: 14px;
            font-weight: 500;
            padding: 8px 14px;
            border-radius: 8px;
            transition: color .25s;
            position: relative;
            letter-spacing: .3px;
        }
        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: 4px; left: 14px;
            width: 0; height: 1.5px;
            background: var(--gold);
            transition: width .3s;
        }
        .nav-links a:hover { color: var(--gold-light); }
        .nav-links a:hover::after { width: calc(100% - 28px); }

        /* ─── MAIN ─── */
        .main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .signup-wrapper {
            display: flex;
            width: 920px;
            max-width: 100%;
            border-radius: 26px;
            overflow: hidden;
            box-shadow:
                0 2px 0 rgba(201,168,76,0.30) inset,
                0 28px 70px rgba(0,0,0,0.55);
            border: 1px solid var(--glass-border);
            animation: fadeUp .5s cubic-bezier(.22,.68,0,1.15) both;
        }

        @keyframes fadeUp {
            from { opacity:0; transform:translateY(28px); }
            to   { opacity:1; transform:translateY(0);    }
        }

        /* ─── LEFT PANEL ─── */
        .left-panel {
            flex: 1;
            background: linear-gradient(160deg, #C9A84C 0%, #A8782A 60%, #8A5F1A 100%);
            padding: 50px 38px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }
        .left-panel::before {
            content: '';
            position: absolute;
            top: -70px; right: -70px;
            width: 220px; height: 220px;
            border-radius: 50%;
            background: rgba(255,255,255,0.10);
        }
        .left-panel::after {
            content: '';
            position: absolute;
            bottom: -90px; left: -50px;
            width: 260px; height: 260px;
            border-radius: 50%;
            background: rgba(255,255,255,0.07);
        }
        .left-panel .crown-icon {
            font-size: 46px;
            margin-bottom: 18px;
            filter: drop-shadow(0 4px 8px rgba(0,0,0,.2));
            position: relative;
            z-index: 1;
        }
        .left-panel h2 {
            font-family: 'Playfair Display', serif;
            font-size: 26px;
            font-weight: 700;
            color: #0C1B33;
            margin-bottom: 10px;
            line-height: 1.3;
            position: relative;
            z-index: 1;
        }
        .left-panel > p {
            color: rgba(12,27,51,0.70);
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 30px;
            position: relative;
            z-index: 1;
        }
        .left-divider {
            width: 40px;
            height: 2px;
            background: rgba(12,27,51,0.25);
            border-radius: 2px;
            margin-bottom: 24px;
            position: relative;
            z-index: 1;
        }
        .benefit-item {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 13px;
            position: relative;
            z-index: 1;
        }
        .benefit-item .b-icon {
            width: 34px;
            height: 34px;
            background: rgba(12,27,51,0.14);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
            flex-shrink: 0;
        }
        .benefit-item span {
            font-size: 13.5px;
            color: #0C1B33;
            font-weight: 600;
            letter-spacing: .2px;
        }

        /* ─── RIGHT PANEL ─── */
        .right-panel {
            flex: 1.15;
            background: var(--glass-bg);
            backdrop-filter: blur(24px);
            -webkit-backdrop-filter: blur(24px);
            padding: 48px 44px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-header { margin-bottom: 28px; }
        .form-header .tag {
            display: inline-block;
            background: var(--gold-dim);
            border: 1px solid rgba(201,168,76,0.30);
            color: var(--gold-light);
            padding: 4px 14px;
            border-radius: 20px;
            font-size: 11px;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-bottom: 12px;
            font-weight: 600;
        }
        .form-header h2 {
            font-family: 'Playfair Display', serif;
            font-size: 26px;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 6px;
        }
        .form-header h2 span { color: var(--gold-light); }
        .form-header p { color: var(--text-muted); font-size: 13px; }

        /* Alerts */
        .alert {
            padding: 11px 16px;
            border-radius: 12px;
            margin-bottom: 20px;
            font-size: 13px;
            font-weight: 500;
            text-align: center;
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
            color: var(--gold-light);
            margin-bottom: 8px;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 1.2px;
            font-weight: 600;
        }
        .input-wrap { position: relative; }
        .input-wrap .input-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 15px;
            pointer-events: none;
        }
        .form-group input {
            width: 100%;
            padding: 13px 16px 13px 42px;
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(201,168,76,0.22);
            border-radius: 12px;
            color: var(--text-primary);
            font-size: 15px;
            font-family: 'Inter', sans-serif;
            outline: none;
            transition: all .25s;
        }
        .form-group input::placeholder { color: rgba(244,237,216,0.28); font-size: 14px; }
        .form-group input:focus {
            border-color: var(--gold);
            background: rgba(201,168,76,0.07);
            box-shadow: 0 0 0 3px rgba(201,168,76,0.14);
        }

        /* Password strength */
        .strength-bar {
            height: 3px;
            border-radius: 4px;
            background: rgba(255,255,255,0.08);
            margin-top: 8px;
            overflow: hidden;
        }
        .strength-fill {
            height: 100%;
            border-radius: 4px;
            width: 0%;
            transition: all .3s;
        }
        .strength-text {
            font-size: 11px;
            margin-top: 5px;
            color: var(--text-muted);
        }

        /* Terms */
        .terms-check {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            margin-bottom: 22px;
        }
        .terms-check input[type="checkbox"] {
            width: 15px;
            height: 15px;
            margin-top: 2px;
            accent-color: var(--gold);
            flex-shrink: 0;
        }
        .terms-check label {
            font-size: 13px;
            color: var(--text-muted);
            cursor: pointer;
            line-height: 1.6;
        }
        .terms-check label a { color: var(--gold-light); text-decoration: none; }
        .terms-check label a:hover { text-decoration: underline; }

        /* Buttons */
        .btn-signup {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, var(--gold) 0%, var(--gold-light) 100%);
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
            margin-bottom: 14px;
        }
        .btn-signup:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 28px rgba(201,168,76,0.50);
            filter: brightness(1.06);
        }
        .btn-signup:active { transform: translateY(0); }

        .or-divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 14px;
        }
        .or-divider::before, .or-divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: rgba(201,168,76,0.18);
        }
        .or-divider span { color: var(--text-muted); font-size: 12px; letter-spacing: .5px; }

        .btn-back {
            width: 100%;
            padding: 13px;
            background: rgba(201,168,76,0.08);
            color: var(--text-muted);
            border: 1px solid rgba(201,168,76,0.22);
            border-radius: 50px;
            font-size: 14px;
            font-weight: 600;
            font-family: 'Inter', sans-serif;
            cursor: pointer;
            transition: all .25s;
            text-decoration: none;
            display: block;
            text-align: center;
            letter-spacing: .2px;
        }
        .btn-back:hover {
            background: rgba(201,168,76,0.18);
            border-color: var(--gold);
            color: var(--gold-light);
            transform: translateY(-1px);
        }

        .login-link {
            text-align: center;
            margin-top: 18px;
            font-size: 13px;
            color: var(--text-muted);
        }
        .login-link a { color: var(--gold-light); text-decoration: none; font-weight: 600; }
        .login-link a:hover { text-decoration: underline; }

        /* Footer */
        footer {
            text-align: center;
            padding: 16px;
            color: rgba(244,237,216,0.22);
            font-size: 12px;
            letter-spacing: .3px;
        }

        @media(max-width: 768px) {
            .navbar { padding: 15px 22px; }
            .signup-wrapper { flex-direction: column; }
            .left-panel { padding: 32px 24px; }
            .right-panel { padding: 32px 24px; }
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <a href="../index.jsp" class="logo">
        <span class="logo-crown">♛</span>
        Luxury Stay
    </a>
    <div class="nav-links">
       
<a href="index.jsp">Home</a>               ✅
<a href="login.jsp">Login</a>              ✅
    </div>
</div>

<!-- MAIN -->
<div class="main">
    <div class="signup-wrapper">

        <!-- LEFT PANEL -->
        <div class="left-panel">
            <div class="crown-icon">♛</div>
            <h2>Join Luxury Stay Hotel System</h2>
            <p>Create your admin account and start managing your hotel with powerful tools.</p>
            <div class="left-divider"></div>
            <div class="benefit-item"><div class="b-icon">🏠</div><span>Manage Rooms &amp; Bookings</span></div>
            <div class="benefit-item"><div class="b-icon">👥</div><span>Track Guest Profiles</span></div>
            <div class="benefit-item"><div class="b-icon">📊</div><span>Live Analytics Dashboard</span></div>
            <div class="benefit-item"><div class="b-icon">🔒</div><span>Secure &amp; Encrypted Access</span></div>
            <div class="benefit-item"><div class="b-icon">💳</div><span>Automated Billing System</span></div>
        </div>

        <!-- RIGHT PANEL -->
        <div class="right-panel">
            <div class="form-header">
                <div class="tag">New Account</div>
                <h2>Create <span>Account</span></h2>
                <p>Fill in the details below to register as admin</p>
            </div>

            <%
                String msg = request.getParameter("msg");
                if ("exists".equals(msg)) {
            %>
                <div class="alert alert-error">✖ &nbsp;Username already exists! Please choose another.</div>
            <% } else if ("success".equals(msg)) { %>
                <div class="alert alert-success">✔ &nbsp;Account created successfully! Please login.</div>
            <% } else if ("error".equals(msg)) { %>
                <div class="alert alert-error">✖ &nbsp;Something went wrong. Please try again.</div>
            <% } %>

            <form action="SignupServlet" method="post">
                <div class="form-group">
                    <label>Username *</label>
                    <div class="input-wrap">
                        <span class="input-icon">👤</span>
                        <input type="text"
                               name="username"
                               placeholder="Choose a username"
                               required
                               minlength="3"
                               autocomplete="off">
                    </div>
                </div>

                <div class="form-group">
                    <label>Password *</label>
                    <div class="input-wrap">
                        <span class="input-icon">🔒</span>
                        <input type="password"
                               name="password"
                               id="passwordInput"
                               placeholder="Create a strong password"
                               required
                               minlength="6"
                               oninput="checkStrength(this.value)">
                    </div>
                    <div class="strength-bar">
                        <div class="strength-fill" id="strengthFill"></div>
                    </div>
                    <div class="strength-text" id="strengthText">Enter password</div>
                </div>

                <div class="terms-check">
                    <input type="checkbox" id="terms" required>
                    <label for="terms">
                        I agree to the <a href="#">Terms of Service</a> and
                        <a href="#">Privacy Policy</a> of Luxury Stay HMS
                    </label>
                </div>

                <button type="submit" class="btn-signup">Create Account</button>

                <div class="or-divider"><span>or</span></div>

                <a href="login.jsp" class="btn-back">← Back to Login</a>
            </form>

            <div class="login-link">
                Already have an account? <a href="login.jsp">Login here</a>
            </div>
        </div>

    </div>
</div>

<footer>&copy; 2025 Luxury Stay · Hotel Management System. All rights reserved.</footer>

<script>
    function checkStrength(password) {
        const fill = document.getElementById('strengthFill');
        const text = document.getElementById('strengthText');

        let strength = 0;
        if (password.length >= 6)          strength++;
        if (password.length >= 10)         strength++;
        if (/[A-Z]/.test(password))        strength++;
        if (/[0-9]/.test(password))        strength++;
        if (/[^A-Za-z0-9]/.test(password)) strength++;

        const levels = [
            { width: '0%',   color: 'transparent',  label: 'Enter password' },
            { width: '25%',  color: '#e74c3c',       label: 'Weak' },
            { width: '50%',  color: '#f39c12',       label: 'Fair' },
            { width: '75%',  color: '#C9A84C',       label: 'Good' },
            { width: '90%',  color: '#6FCF97',       label: 'Strong' },
            { width: '100%', color: '#27ae60',       label: 'Very Strong' },
        ];

        const level = levels[Math.min(strength, 5)];
        fill.style.width  = level.width;
        fill.style.background = level.color;
        text.textContent  = level.label;
        text.style.color  = level.color === 'transparent' ? 'rgba(244,237,216,0.4)' : level.color;
    }
</script>

</body>
</html>

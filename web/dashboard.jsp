<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Luxury Stay — Dashboard</title>
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
                --gold-dim:     rgba(201,168,76,0.12);
                --navy:         #0C1B33;
                --glass-bg:     rgba(8,18,38,0.72);
                --glass-border: rgba(201,168,76,0.22);
                --text-primary: #F4EDD8;
                --text-muted:   rgba(244,237,216,0.50);
            }

            body {
                min-height: 100vh;
                font-family: 'Inter', sans-serif;
                background:
                    linear-gradient(150deg, rgba(4,10,24,0.92) 0%, rgba(10,22,46,0.88) 100%),
                    url("images/hotel.jpg");
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                display: flex;
                flex-direction: column;
            }

            /* ── Navbar ── */
            .navbar {
                width: 100%;
                padding: 16px 60px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: rgba(4,10,24,0.75);
                backdrop-filter: blur(16px);
                border-bottom: 1px solid var(--glass-border);
                position: sticky;
                top: 0;
                z-index: 100;
            }

            .logo {
                font-family: 'Playfair Display', serif;
                color: var(--gold-light);
                font-size: 24px;
                font-weight: 700;
                letter-spacing: .5px;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .logo-crown {
                font-size: 20px;
                filter: drop-shadow(0 0 6px rgba(201,168,76,.55));
            }

            .logout-btn {
                text-decoration: none;
                background: transparent;
                color: var(--gold-light);
                padding: 8px 22px;
                border-radius: 50px;
                border: 1.5px solid rgba(201,168,76,0.55);
                font-weight: 600;
                font-size: 13px;
                letter-spacing: .4px;
                transition: background .25s, color .25s, transform .2s;
            }

            .logout-btn:hover {
                background: var(--gold);
                color: #0C1B33;
                transform: translateY(-1px);
            }

            /* ── Main ── */
            .container {
                flex: 1;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 36px 20px;
            }

            /* ── Dashboard Card ── */
            .dashboard-card {
                width: 740px;
                max-width: 100%;
                background: var(--glass-bg);
                backdrop-filter: blur(24px);
                -webkit-backdrop-filter: blur(24px);
                border: 1px solid var(--glass-border);
                border-radius: 26px;
                padding: 44px 40px 38px;
                box-shadow:
                    0 1px 0 rgba(201,168,76,0.18) inset,
                    0 30px 80px rgba(0,0,0,0.6);
                text-align: center;
                animation: fadeUp .5s cubic-bezier(.22,.68,0,1.15) both;
            }

            @keyframes fadeUp {
                from { opacity:0; transform:translateY(28px); }
                to   { opacity:1; transform:translateY(0); }
            }

            /* ── Hero Section ── */
            .hero-tag {
                display: inline-block;
                font-size: 10.5px;
                letter-spacing: 2.8px;
                text-transform: uppercase;
                color: var(--gold);
                border: 1px solid rgba(201,168,76,0.28);
                border-radius: 50px;
                padding: 4px 16px;
                margin-bottom: 14px;
            }

            .card-icon {
                font-size: 36px;
                display: block;
                margin-bottom: 12px;
                filter: drop-shadow(0 0 8px rgba(201,168,76,.45));
            }

            h1 {
                font-family: 'Playfair Display', serif;
                color: var(--text-primary);
                font-size: 30px;
                font-weight: 700;
                line-height: 1.2;
                margin-bottom: 8px;
            }

            .subtitle {
                color: var(--text-muted);
                font-size: 14px;
                line-height: 1.6;
            }

            .divider {
                width: 48px;
                height: 1.5px;
                background: linear-gradient(90deg, transparent, var(--gold), transparent);
                margin: 18px auto 26px;
                border-radius: 2px;
            }

            /* ── Menu Grid ── */
            .menu {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 12px;
                text-align: left;
            }

            .menu-item {
                text-decoration: none;
                display: flex;
                flex-direction: column;
                gap: 4px;
                padding: 16px 14px 14px;
                border-radius: 14px;
                background: rgba(10,20,44,0.60);
                border: 1px solid rgba(201,168,76,0.18);
                color: var(--text-primary);
                position: relative;
                overflow: hidden;
                transition: border-color .25s, transform .22s, box-shadow .22s, background .25s;
            }

            /* Top gold accent line */
            .menu-item::before {
                content: '';
                position: absolute;
                top: 0; left: 0; right: 0;
                height: 2px;
                background: linear-gradient(90deg, transparent, var(--gold), transparent);
                opacity: 0.35;
                transition: opacity .25s;
            }

            .menu-item:hover {
                border-color: rgba(201,168,76,0.5);
                transform: translateY(-3px);
                box-shadow: 0 10px 28px rgba(0,0,0,0.35), 0 0 0 1px rgba(201,168,76,0.15);
                background: rgba(14,26,56,0.80);
            }

            .menu-item:hover::before {
                opacity: 1;
            }

            .item-icon {
                width: 40px;
                height: 40px;
                background: rgba(201,168,76,0.1);
                border: 1px solid rgba(201,168,76,0.2);
                border-radius: 11px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 19px;
                margin-bottom: 8px;
                transition: background .25s;
            }

            .menu-item:hover .item-icon {
                background: rgba(201,168,76,0.18);
            }

            .item-label {
                font-size: 13px;
                font-weight: 600;
                color: var(--text-primary);
                letter-spacing: .2px;
            }

            .item-sub {
                font-size: 11px;
                color: var(--text-muted);
                margin-top: 1px;
            }

            .arrow {
                position: absolute;
                bottom: 12px;
                right: 13px;
                font-size: 13px;
                color: var(--gold);
                opacity: 0.45;
                transition: opacity .2s, transform .2s;
            }

            .menu-item:hover .arrow {
                opacity: 1;
                transform: translateX(3px);
            }

            .footer-note {
                margin-top: 26px;
                color: var(--text-muted);
                font-size: 11.5px;
                letter-spacing: .3px;
            }

            /* ════════════════════════════
               CHATBOT — Gold Luxury Theme
            ════════════════════════════ */

            #chat-toggle {
                position: fixed;
                bottom: 24px;
                right: 24px;
                width: 58px;
                height: 58px;
                border-radius: 50%;
                background: linear-gradient(135deg, var(--gold), var(--gold-light));
                border: none;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 24px;
                box-shadow: 0 4px 18px rgba(201,168,76,0.5);
                z-index: 9999;
                transition: transform 0.2s, box-shadow 0.2s;
            }
            #chat-toggle:hover {
                transform: scale(1.08);
                box-shadow: 0 6px 24px rgba(201,168,76,0.65);
            }

            #chat-widget {
                position: fixed;
                bottom: 94px;
                right: 24px;
                width: 340px;
                background: var(--glass-bg);
                backdrop-filter: blur(20px);
                -webkit-backdrop-filter: blur(20px);
                border-radius: 18px;
                border: 1px solid var(--glass-border);
                box-shadow: 0 8px 36px rgba(0,0,0,0.45);
                z-index: 9998;
                display: flex;
                flex-direction: column;
                overflow: hidden;
                transition: opacity 0.22s, transform 0.22s;
                transform-origin: bottom right;
            }
            #chat-widget.hidden {
                opacity: 0;
                pointer-events: none;
                transform: scale(0.92) translateY(14px);
            }

            #chat-header {
                background: linear-gradient(135deg, rgba(201,168,76,0.28), rgba(201,168,76,0.12));
                padding: 14px 16px;
                display: flex;
                align-items: center;
                gap: 10px;
                border-bottom: 1px solid var(--glass-border);
            }
            #chat-header .avatar {
                width: 38px;
                height: 38px;
                border-radius: 50%;
                background: rgba(201,168,76,0.22);
                border: 1.5px solid var(--gold);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 20px;
            }
            #chat-header .info { flex: 1; }
            #chat-header .ch-title {
                color: var(--gold-light);
                font-size: 15px;
                font-weight: 600;
                margin: 0;
                font-family: 'Playfair Display', serif;
            }
            #chat-header .ch-status {
                color: #81c784;
                font-size: 12px;
                margin: 0;
                font-family: 'Inter', sans-serif;
            }
            #close-btn {
                background: none;
                border: none;
                cursor: pointer;
                color: var(--gold-light);
                font-size: 20px;
                line-height: 1;
                padding: 4px 7px;
                border-radius: 6px;
                transition: background 0.15s;
            }
            #close-btn:hover {
                background: rgba(201,168,76,0.2);
                color: var(--gold);
            }

            #chat-box {
                height: 265px;
                overflow-y: auto;
                padding: 14px 12px 8px;
                display: flex;
                flex-direction: column;
                gap: 8px;
                background: rgba(8,16,36,0.65);
            }
            #chat-box::-webkit-scrollbar { width: 4px; }
            #chat-box::-webkit-scrollbar-thumb {
                background: rgba(201,168,76,0.35);
                border-radius: 4px;
            }

            .msg {
                max-width: 85%;
                padding: 9px 13px;
                border-radius: 14px;
                font-size: 14px;
                line-height: 1.5;
                font-family: 'Inter', sans-serif;
            }
            .msg.user {
                align-self: flex-end;
                background: linear-gradient(135deg, var(--gold), var(--gold-light));
                color: #0C1B33;
                font-weight: 600;
                border-bottom-right-radius: 4px;
            }
            .msg.bot {
                align-self: flex-start;
                background: rgba(12,27,51,0.88);
                color: var(--text-primary);
                border: 1px solid var(--glass-border);
                border-bottom-left-radius: 4px;
            }

            #input-area {
                display: flex;
                gap: 8px;
                padding: 10px 12px;
                border-top: 1px solid var(--glass-border);
                background: rgba(6,14,30,0.80);
                align-items: center;
            }
            #userInput {
                flex: 1;
                padding: 9px 14px;
                border: 1px solid rgba(201,168,76,0.3);
                border-radius: 20px;
                font-size: 14px;
                background: rgba(12,27,51,0.55);
                color: var(--text-primary);
                outline: none;
                font-family: 'Inter', sans-serif;
                transition: border-color 0.15s;
            }
            #userInput::placeholder { color: var(--text-muted); }
            #userInput:focus { border-color: var(--gold); }

            #send-btn {
                width: 38px;
                height: 38px;
                border-radius: 50%;
                background: linear-gradient(135deg, var(--gold), var(--gold-light));
                border: none;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #0C1B33;
                font-size: 18px;
                font-weight: bold;
                transition: transform 0.1s, box-shadow 0.15s;
                flex-shrink: 0;
            }
            #send-btn:hover {
                box-shadow: 0 4px 14px rgba(201,168,76,0.5);
                transform: scale(1.05);
            }
            #send-btn:active { transform: scale(0.94); }

            #mic-btn {
                width: 38px;
                height: 38px;
                border-radius: 50%;
                background: rgba(201,168,76,0.12);
                border: 1.5px solid rgba(201,168,76,0.35);
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 17px;
                transition: background 0.15s, border-color 0.15s;
                flex-shrink: 0;
            }
            #mic-btn:hover {
                background: rgba(201,168,76,0.22);
                border-color: var(--gold);
            }
            #mic-btn.listening {
                background: rgba(229,115,115,0.2);
                border-color: #e57373;
                animation: micPulse 1s infinite;
            }
            @keyframes micPulse {
                0%, 100% { box-shadow: 0 0 0 0 rgba(229,115,115,0.4); }
                50%       { box-shadow: 0 0 0 7px rgba(229,115,115,0); }
            }

            /* ── Responsive ── */
            @media (max-width: 760px) {
                .navbar { padding: 14px 22px; }
                .dashboard-card { padding: 32px 20px 28px; }
                h1 { font-size: 24px; }
                .menu { grid-template-columns: repeat(2, 1fr); }
            }
            @media (max-width: 480px) {
                .menu { grid-template-columns: 1fr 1fr; gap: 10px; }
                #chat-widget { width: 95vw; right: 2.5vw; }
            }

        </style>
    </head>
    <body>

        <!-- Navbar -->
        <nav class="navbar">
            <div class="logo">
                <span class="logo-crown">♛</span>
                Luxury Stay
            </div>
            <a href="login.jsp" class="logout-btn">Logout</a>
        </nav>

        <!-- Main -->
        <div class="container">
            <div class="dashboard-card">

                <span class="card-icon">🏨</span>
                <div class="hero-tag">Hotel Management</div>
                <h1>Management Dashboard</h1>
                <p class="subtitle">Manage rooms, bookings and hotel operations efficiently.</p>
                <div class="divider"></div>

                <div class="menu">

                    <a href="rooms/addRoom.jsp" class="menu-item">
                        <div class="item-icon">🛏️</div>
                        <div class="item-label">Add Room</div>
                        <div class="item-sub">New listings</div>
                        <span class="arrow">→</span>
                    </a>

                    <a href="bookings/billing.jsp" class="menu-item">
                        <div class="item-icon">💰</div>
                        <div class="item-label">Generate Bill</div>
                        <div class="item-sub">Invoices & payments</div>
                        <span class="arrow">→</span>
                    </a>

                    <a href="<%= request.getContextPath()%>/RoomServlet" class="menu-item">
                        <div class="item-icon">📋</div>
                        <div class="item-label">View Rooms</div>
                        <div class="item-sub">All listings</div>
                        <span class="arrow">→</span>
                    </a>

                    <a href="bookings/checkIn.jsp" class="menu-item">
                        <div class="item-icon">🏁</div>
                        <div class="item-label">Check In</div>
                        <div class="item-sub">Arrivals</div>
                        <span class="arrow">→</span>
                    </a>

                    <a href="bookings/banquet.jsp" class="menu-item">
                        <div class="item-icon">🎊</div>
                        <div class="item-label">Banquet</div>
                        <div class="item-sub">Reservations</div>
                        <span class="arrow">→</span>
                    </a>

                    <a href="bookings/meal.jsp" class="menu-item">
                        <div class="item-icon">🍽️</div>
                        <div class="item-label">Meal</div>
                        <div class="item-sub">Food orders</div>
                        <span class="arrow">→</span>
                    </a>

                    <a href="bookings/checkOut.jsp" class="menu-item">
                        <div class="item-icon">🚪</div>
                        <div class="item-label">Check Out</div>
                        <div class="item-sub">Departures</div>
                        <span class="arrow">→</span>
                    </a>

                    <a href="bookings/viewCheckIn.jsp" class="menu-item">
                        <div class="item-icon">📋</div>
                        <div class="item-label">Check In Records</div>
                        <div class="item-sub">History</div>
                        <span class="arrow">→</span>
                    </a>

                    <a href="bookings/viewCheckOut.jsp" class="menu-item">
                        <div class="item-icon">📋</div>
                        <div class="item-label">Check Out Records</div>
                        <div class="item-sub">History</div>
                        <span class="arrow">→</span>
                    </a>

                </div>
            </div>

            <p class="footer-note">© 2025 Luxury Stay · Hotel Management System</p>
        </div>

        <!-- ════════════════════════════
             CHATBOT
        ════════════════════════════ -->

        <button id="chat-toggle" onclick="toggleChat()" title="Chat with us">💬</button>

        <div id="chat-widget" class="hidden">

            <div id="chat-header">
                <div class="avatar">♛</div>
                <div class="info">
                    <p class="ch-title">Luxury Stay</p>
                    <p class="ch-status">● Online</p>
                </div>
                <button id="close-btn" onclick="closeChat()" title="Close">✕</button>
            </div>

            <div id="chat-box">
                <div class="msg bot">👋 Welcome to Luxury Stay! How may I assist you?</div>
            </div>

            <div id="input-area">
                <button id="mic-btn" onclick="toggleMic()" title="Voice input">🎤</button>
                <input id="userInput" type="text" placeholder="Type or speak..." autocomplete="off"/>
                <button id="send-btn" onclick="sendMessage()">➤</button>
            </div>

        </div>

        <script>
            let recognition = null;
            let isListening = false;

            function toggleMic() {
                if (!('webkitSpeechRecognition' in window || 'SpeechRecognition' in window)) {
                    alert('Voice input requires Chrome or Edge.');
                    return;
                }
                if (isListening) {
                    recognition && recognition.stop();
                    return;
                }

                const SR = window.SpeechRecognition || window.webkitSpeechRecognition;
                recognition = new SR();
                recognition.lang = 'en-US';
                recognition.interimResults = false;
                recognition.maxAlternatives = 1;

                recognition.onstart = () => {
                    isListening = true;
                    document.getElementById('mic-btn').classList.add('listening');
                    document.getElementById('userInput').placeholder = 'Listening…';
                };
                recognition.onresult = (e) => {
                    document.getElementById('userInput').value = e.results[0][0].transcript;
                };
                recognition.onend = () => {
                    isListening = false;
                    document.getElementById('mic-btn').classList.remove('listening');
                    document.getElementById('userInput').placeholder = 'Type or speak...';
                };
                recognition.onerror = recognition.onend;
                recognition.start();
            }

            function toggleChat() {
                const widget = document.getElementById("chat-widget");
                const toggleBtn = document.getElementById("chat-toggle");
                if (widget.classList.contains("hidden")) {
                    widget.classList.remove("hidden");
                    toggleBtn.textContent = "✕";
                    document.getElementById("userInput").focus();
                } else {
                    closeChat();
                }
            }

            function closeChat() {
                document.getElementById("chat-widget").classList.add("hidden");
                document.getElementById("chat-toggle").textContent = "💬";
                window.speechSynthesis && window.speechSynthesis.cancel();
            }

            function sendMessage() {
                let input = document.getElementById("userInput");
                let message = input.value.trim();
                if (!message) return;

                let chatBox = document.getElementById("chat-box");
                chatBox.innerHTML += '<div class="msg user">' + message + '</div>';
                input.value = "";
                chatBox.scrollTop = chatBox.scrollHeight;

                fetch("/HotelManagementSystem/ChatServlet", {
                    method: "POST",
                    headers: {"Content-Type": "application/x-www-form-urlencoded"},
                    body: "message=" + encodeURIComponent(message)
                })
                .then(r => r.text())
                .then(data => {
                    chatBox.innerHTML += '<div class="msg bot">' + data + '</div>';
                    chatBox.scrollTop = chatBox.scrollHeight;
                    speakText(data);
                });
            }

            function speakText(text) {
                const utterance = new SpeechSynthesisUtterance(text);
                utterance.lang = 'en-IN';
                utterance.rate = 0.95;
                utterance.pitch = 1.1;
                utterance.volume = 1;
                window.speechSynthesis.speak(utterance);
            }

            document.addEventListener("DOMContentLoaded", () => {
                document.getElementById("userInput").addEventListener("keydown", e => {
                    if (e.key === "Enter") sendMessage();
                });
            });
        </script>

    </body>
</html>

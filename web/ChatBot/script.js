console.log("Script Loaded");

// =======================
// Text To Speech
// =======================
function speakText(text) {

    if ('speechSynthesis' in window) {

        window.speechSynthesis.cancel();

        const utterance = new SpeechSynthesisUtterance(text);

        utterance.lang = "en-US";
        utterance.rate = 1;
        utterance.pitch = 1;
        utterance.volume = 1;

        setTimeout(function () {
            window.speechSynthesis.speak(utterance);
        }, 100);

    } else {

        console.log("Speech synthesis not supported");

    }
}
// =======================
// Open / Close Chat
// =======================
function toggleChat() {

    const widget = document.getElementById("chat-widget");
    const toggleBtn = document.getElementById("chat-toggle");

    if (widget.classList.contains("hidden")) {
          alert("Chat Opened");

        widget.classList.remove("hidden");
        toggleBtn.textContent = "✕";

        document.getElementById("userInput").focus();

        setTimeout(function () {
            speakText(
                "Welcome to Luxury Stay Hotel. How may I help you?"
            );
        }, 500);

    } else {

        closeChat();
    }
}

function closeChat() {

    document.getElementById("chat-widget").classList.add("hidden");

    document.getElementById("chat-toggle").textContent = "💬";
}

// =======================
// Send Message
// =======================
function sendMessage() {

    let input = document.getElementById("userInput");
    let message = input.value.trim();

    if (message === "") {
        return;
    }

    let chatBox = document.getElementById("chat-box");

    chatBox.innerHTML +=
        '<div class="msg user">' + message + '</div>';

    input.value = "";

    chatBox.scrollTop = chatBox.scrollHeight;

    fetch("/HotelManagementSystem/ChatServlet", {

        method: "POST",

        headers: {
            "Content-Type":
            "application/x-www-form-urlencoded"
        },

        body:
            "message=" +
            encodeURIComponent(message)

    })

    .then(response => response.text())

  .then(data => {

    chatBox.innerHTML +=
        '<div class="msg bot">' + data + '</div>';

    chatBox.scrollTop = chatBox.scrollHeight;

    setTimeout(function () {
        speakText(data);
    }, 300);

})

    .catch(error => {

        console.error(error);

        chatBox.innerHTML +=
            '<div class="msg bot">Server Error</div>';

    });
}

// =======================
// Enter Key Support
// =======================
document.addEventListener("DOMContentLoaded", function () {

    const input =
        document.getElementById("userInput");

    if (input) {

        input.addEventListener("keydown",
        function (e) {

            if (e.key === "Enter") {

                sendMessage();

            }
        });
    }
});

// =======================
// Speech Recognition
// =======================
document.addEventListener("DOMContentLoaded", function () {

    const SpeechRecognition =
        window.SpeechRecognition ||
        window.webkitSpeechRecognition;

    if (!SpeechRecognition) {

        console.log(
            "Speech Recognition Not Supported"
        );

        return;
    }

    const recognition =
        new SpeechRecognition();

    recognition.lang = "en-US";
    recognition.continuous = false;
    recognition.interimResults = false;

    const micBtn =
        document.getElementById("micBtn");

    if (micBtn) {

        micBtn.addEventListener("click",
        function () {

            console.log("Mic Clicked");

            recognition.start();

        });

        recognition.onresult =
        function (event) {

            const text =
                event.results[0][0].transcript;

            document.getElementById(
                "userInput"
            ).value = text;

            console.log(
                "Voice Input:",
                text
            );
        };

        recognition.onerror =
        function (event) {

            console.log(
                "Voice Error:",
                event.error
            );
        };
    }
});
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Forgot Password</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    height:100vh;

    background:
    linear-gradient(rgba(0,0,0,.6),
    rgba(0,0,0,.6)),
    url("../images/hotel.jpg");

    background-size:cover;
    background-position:center;

    display:flex;
    justify-content:center;
    align-items:center;
}

.card{
    width:450px;

    background:rgba(255,255,255,.12);
    backdrop-filter:blur(15px);

    padding:40px;
    border-radius:20px;

    box-shadow:0 8px 30px rgba(0,0,0,.4);
}

.card h2{
    color:white;
    text-align:center;
    margin-bottom:25px;
}

.form-group{
    margin-bottom:20px;
}

.form-group label{
    display:block;
    color:white;
    margin-bottom:8px;
}

.form-group input{
    width:100%;
    padding:12px;

    border:none;
    border-radius:10px;
}

.btn{
    width:100%;
    padding:12px;

    border:none;
    border-radius:30px;

    background:#f8c146;
    font-weight:bold;
    cursor:pointer;
}

.btn:hover{
    background:white;
}

.message{
    color:#fff;
    text-align:center;
    margin-bottom:15px;
}

.back{
    display:block;
    text-align:center;
    color:white;
    margin-top:15px;
    text-decoration:none;
}

</style>
</head>

<body>

<div class="card">

<h2>Forgot Password</h2>

<%
String msg=request.getParameter("msg");

if("failed".equals(msg)){
%>
<div class="message">Username not found!</div>
<%
}

if("error".equals(msg)){
%>
<div class="message">Something went wrong!</div>
<%
}
%>

<form action="<%=request.getContextPath()%>/ForgotPasswordServlet"
      method="post">

    <div class="form-group">
        <label>Username</label>
        <input type="text"
               name="username"
               required>
    </div>

    <div class="form-group">
        <label>New Password</label>
        <input type="password"
               name="password"
               required>
    </div>

    <input type="submit"
           value="Update Password"
           class="btn">

</form>

<a href="<%=request.getContextPath()%>/login.jsp"
   class="back">
   Back To Login
</a>
</div>

</body>
</html>
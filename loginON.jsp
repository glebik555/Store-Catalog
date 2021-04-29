<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Menu</title>
    <style>
        .text {
            text-align: center;
        }
        .body{
            text-align: center;
        }
    </style>
    <%@page import ="java.util.*" %>
    <%@page import ="java.io.*" %>
    <link rel=stylesheet type=text/css href=style2.css>
</head>

<body>
    <h1>Login App using HttpSession</h1>
    <a href="login.jsp">Login</a>|
    <a href="LogoutServlet">Logout</a>|
    <a href="ProfileServlet">Profile</a>


    <form method="POST" action="MyBoard">
        Text:<input type="text" name="value"><br>
        <input type="submit" value="add">
    </form>

    <div class="text">
        <%
        
    


    %>
    </div>

</body>

</html>
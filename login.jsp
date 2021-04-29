<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Menu</title>
    <script type ="text/javascript">
    <%@include file = "jscript.js"%>
  </script>
    <style>
        .text {
            text-align: center;
            color: white;
             background-color: blue;
            vertical-align: middle;

        }
        .catalog{
            text-align: center;
            background-color: rgb(255,255,255);
            vertical-aligh: middle;
        }
        .books{
            background-color: rgb(39, 68, 231);
            color: white;
             padding: 2px;
            text-align: center;
            vertical-aligh: middle;
        }
        .hidden {
            display: none;
        }

    </style>
    <%@page import ="java.util.*" %>
    <%@page import ="java.io.*" %>

    <link rel=stylesheet type=text/css href=style.css>
</head>

<body>
<div class="text">
<p> </p>

<form action="LoginServlet" method="post">
    Name:<input type="text" name="name"><br>
Password:<input type="password" name="password"><br>
    <input type="submit" value="login">
    <input value="Back" type="button" onclick="location.href='index.jsp'">
</form>
</div>

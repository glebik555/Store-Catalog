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
            text-align: right;
            color: black;
             background-color: rgb(15, 15, 15);
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
        .back{
            position: absolute;

            top: 40px;
            display: inline-block;
            color: black;
              
              text-decoration: none;
              user-select: none;
              padding: .25em .5em;
              outline: none;
              border: 1px solid rgb(250,172,17);
              border-radius: 7px;
              background: rgb(255,212,3) linear-gradient(rgb(255,212,3), rgb(248,157,23));
              box-shadow: inset 0 -2px 1px rgba(0,0,0,0), inset 0 1px 2px rgba(0,0,0,0), inset 0 0 0 60px rgba(255,255,0,0);
              transition: box-shadow .2s, border-color .2s;
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
    <p> 
    <a class="back" href=index.jsp>Catalog</a>

    <h1 class="catalog">Bag</h1>
    <div class="books">
        <%
            
        HashMap<String, Integer[]> hm = (HashMap<String,Integer[]>)session.getAttribute("Bag");
            
        int i = 0;
        int cost = 0;
        int flag = 0;
        for (Map.Entry<String, Integer[]> entry1 : hm.entrySet()) {
            if(entry1.getValue()[1]!=0){
            out.println("Name of book: " + entry1.getKey() + "\n");
            out.println("<p> </p>");
            out.println("Price: "+ entry1.getValue()[0] + "\n ");
            out.println("<p> </p>");
            out.println("Number of book:" + entry1.getValue()[1]);
            out.println("<p> </p>");
            cost += entry1.getValue()[0] * entry1.getValue()[1];
            flag = 1;
            }
        }
        if(flag==1){
        out.println(cost);
        

        out.println("<input value=\"Reset Bag\" type=\"button\" onclick=\"location.href='clearBag.jsp'\" />");
        
        out.println("<button class=\"js-show-form\">Buy</button>");
        
        out.println("<form class=\"js-form hidden\" action=\"Email\" method=\"post\">");
       
        out.println("<label>email<input type=\"text\" name=\"buy\"> </label>");
        
        out.println("<input type=\"submit\" value=\"send\"> </form>");

        out.println("<form method=\"post\" action=\"Catalog\">");
        out.println("<input name=\"promo\" type=\"text\" placeholder=\"Promocode\" />");
         out.println("<button type=\"submit\">send</button></form>");

        }

        %>
    </div>



</body>
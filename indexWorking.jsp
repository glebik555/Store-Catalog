<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Menu</title>
    <script type ="text/javascript">
    <%@include file = "jscript.js"%>
  </script>
    <style>
            .border{
                border: 2px solid #ffff00;
                padding: 0px 40px 0px 0px;
                margin: 0px 780px 0px 800px;
            }
        .text {
            text-align: right;
            
            vertical-align: middle;
        }
        .catalog{
            text-align: center;
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

            top: 50px;
            right:10px;
            display: inline-block;
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
    </style>
    <%@page import ="java.util.*" %>
    <%@page import ="java.io.*" %>

    <link rel=stylesheet type=text/css href=style.css>
</head>

<body>
    
    <h1 class="catalog">Catalog</h1>
    <div class="back">
    <a  href="LogoutServlet">Account</a>
    </div>
    <div class="books">
        <%
        
        HashMap<String, Integer[]> hm = (HashMap)session.getAttribute("books");

         out.println("<button class=\"js-show-form\">Add book</button>");
        
        out.println("<form class=\"js-form hidden\" action=\"AddBook\" method=\"post\">");
       
        out.println("<label> NameOfBook <input type=\"text\" name=\"BooksName\"> </label>");
        out.println("<p>" + "</p>");
        out.println("<label> Price <input type=\"text\" name=\"PriceOfBook\"> </label>");
        out.println("<p>" + "</p>");
        out.println("<label> NumOfBook <input type=\"text\" name=\"NumOfBook\"> </label>");  
        out.println("<p>" + "</p>");      
        out.println("<input type=\"submit\" value=\"send\"> </form>");
        out.println("<p>" + "</p>");      
        out.println("<p>" + "</p>");      
        
        for (Map.Entry<String, Integer[]> entry : hm.entrySet()){
            
            out.println("Name of Book: " + "\""+ entry.getKey() + "\"" + " ");
            out.println("<p>" + "</p>");
            out.println("Price: " + entry.getValue()[0] + " ");
            out.println("<p>" + "</p>");
            out.println("Stock: " + entry.getValue()[1] + " ");
            out.println("<p>" + "</p>");

            out.print("<form action=\"AddBook\" method=\"GET\">");
            out.println("<dir class=\"border\">");
            out.println("New num of Book");
            out.println("</dir>");
            out.println("</p>");
            out.println("<p>" + "</p>");
            out.print("<input type=\"text\" name=\"change\">");
            out.print("<input type=\"hidden\" name=\"nameBook\" value=\"" + entry.getKey() + "\">");
            out.println("<input type=\"submit\" value=\"change\">");
            out.println("</form>");
            out.println("<p>" + "</p>");
            out.println("<p>" + "</p>");
            
            
            
        }
       

       


    %>
    </div>

</body>

</html>
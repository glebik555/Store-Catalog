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

            top: 90px;
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
        .button{
            
            display: inline-block;
            color: black;
              font-size: 125%;
              font-weight: 700;
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
            a.button10:hover {
              box-shadow: inset 0 -1px 1px rgba(0,0,0,0), inset 0 1px 2px rgba(0,0,0,0), inset 0 0 0 60px rgba(255,255,0,.5);
            }
            a.button10:active {
              padding: calc(.25em + 1px) .5em calc(.25em - 1px);
              border-color: rgba(177,159,0,1);
              box-shadow: inset 0 -1px 1px rgba(0,0,0,.1), inset 0 1px 2px rgba(0,0,0,.3), inset 0 0 0 60px rgba(255,255,0,.45);
            }
    </style>
    <%@page import ="java.util.*" %>
    <%@page import ="java.io.*" %>

    <link rel=stylesheet type=text/css href=style.css>
</head>

<body>
    
    <h1 class="catalog">Catalog</h1>
    <div class="back">
    <a  href="bag.jsp">Bag</a>|
    <a  href="login.jsp">Account</a>
    </div>

    <div class="button">
    <%
        out.println("<input value=\"Cost filtr\" type=\"button\" onclick=\"location.href='indexCost.jsp'\" />");
        out.println("<input value=\"Stock filtr\" type=\"button\" onclick=\"location.href='indexStock.jsp'\" />");
    %>
    </div>
    <div class="books">
        <%
        

        HashMap<String, Integer[]> hmStr = (HashMap)session.getAttribute("str");
        HashMap<String, Integer[]> hm = (HashMap)session.getAttribute("books");
        
        ArrayList<String> prom = new ArrayList<>();
         int k = 0;
         int skip = 0;
         int size = 0;
        for (Map.Entry<String, Integer[]> entry : hmStr.entrySet()){
            
            
           if(k!=4){
          
            if(entry.getValue()[1]!=0){
               
            out.println("Name of book: \"" + entry.getKey() + "\" ");
            out.println("<p>" + "</p>");
            out.println("Price: " + entry.getValue()[0] + " ");
            out.println("<p>" + "</p>");
            out.println("Stock: " + entry.getValue()[1] + " ");
            out.print("<form action=\"Bag\" method=\"post\">");
            out.print("<input type=\"text\" name=\"numOfBook\">");
            out.print("<input type=\"hidden\" name=\"nameBook\" value=\"" + entry.getKey() + "\">");
            out.print("<input type=\"submit\" value=\"+\">");
            out.print("</form>");
            out.println("<p>" + "</p>");
            k++;
            }
            
          }
        }
            for (Map.Entry<String, Integer[]> entry1 : hm.entrySet()){
                if(entry1.getValue()[1]!=0){
                         size++;
                }
            }

        while(size%4!=0){
            size++;
        }
        out.println("<p>" + "</p>");
        for(int i = 0; i < size/4;i++){
            if(i==0){
            out.print("<form action=\"Bag\" method=\"GET\">");
    
            out.print("<input type=\"hidden\" name=\"numStr\" value=\""+i+"\">");
            out.print("<input type=\"submit\" value="+i+">");
            out.print("</form>");
            }else{
                out.print("<form action=\"Bag\" method=\"GET\">");
               
                 out.print("<input type=\"hidden\" name=\"numStr\" value=\""+i+"\">");
                 out.print("<input type=\"submit\" value="+i+">");
                 out.print("</form>");
            }
        }
        session.setAttribute("Prom",prom);

    %>

    <div class="button">
    <%
       
    %>
    </div>
    </div>

</body>

</html>
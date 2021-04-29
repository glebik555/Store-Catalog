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
            background-color: #d24dff;
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
        out.println("<input value=\"Standart\" type=\"button\" onclick=\"location.href='index1.jsp'\" />");
        out.println("<input value=\"Cost filter\" type=\"button\" onclick=\"location.href='indexCost.jsp'\" />");
        out.println("<input value=\"Standart\" type=\"button\" onclick=\"location.href='index.jsp'\" />");

    %>
    </div>
    <div class="books">
        <%
        
        HashMap<String, Integer[]> hm = (HashMap)session.getAttribute("books");
        HashMap<String, Integer[]> tmpHM = new HashMap<>();
        int [] stock = new int [hm.size()];
        int c = 0;
        for (Map.Entry<String, Integer[]> entry1 : hm.entrySet()){
            tmpHM.put(entry1.getKey(),entry1.getValue());
            stock[c]=entry1.getValue()[1];
            c++;
        }
        Arrays.sort(stock);
        LinkedHashMap<String,Integer[]> costHM = new LinkedHashMap<>();
        int maxStock = -1;
        String maxName = "";
        
        while(tmpHM.size()!=0){
            for (Map.Entry<String, Integer[]> entry1 : tmpHM.entrySet()){
            if(entry1.getValue()[1]>maxStock){
                maxStock = entry1.getValue()[1];
                maxName = entry1.getKey();
            }
        }
        
        Integer [] tmp = new Integer[2];
        tmp[0] = hm.get(maxName)[0];
        tmp[1] =  maxStock;
        maxStock = 0;
        tmpHM.remove(maxName);
        costHM.put(maxName,tmp);
        }
        c=stock.length;
        boolean complite = true;
        for (Map.Entry<String, Integer[]> entry : costHM.entrySet()){
            if(stock[c-1]==entry.getValue()[1]){
                c--;
                continue;
            }else{
                out.println("Error!");
            }
        }
        if(complite==true){
            out.println("<p> </p>");
            out.println("Complited");
            out.println("<p> </p>");
        }


        for (Map.Entry<String, Integer[]> entry : costHM.entrySet()){
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
            }
        }

    %>
    </div>

</body>

</html>
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
        
    </style>
    <%@page import ="java.util.*" %>
    <%@page import ="java.io.*" %>

    <link rel=stylesheet type=text/css href=style.css>
</head>

<body>
        <%
            
        HashMap<String, Integer[]> hm = (HashMap<String,Integer[]>)session.getAttribute("Bag");
        HashMap<String,Integer[]> hmStart = (HashMap<String, Integer[]>)session.getAttribute("books");
        ArrayList<String> prom = (ArrayList<String>)session.getAttribute("Prom");
        while(prom.size()!=0){
            prom.remove(prom.size()-1);
        }
        Integer [] tmp = new Integer[2];
        tmp[0]=0;
        tmp[1]=0;
        for (Map.Entry<String, Integer[]> entry1 : hm.entrySet()) {
            if(hmStart.containsKey(entry1.getKey())){
                Integer [] numCost = new Integer[2];
                numCost[1] = hmStart.get(entry1.getKey())[1] + entry1.getValue()[1];                
                numCost[0] = hmStart.get(entry1.getKey())[0];
                hm.put(entry1.getKey(),tmp);
                hmStart.put(entry1.getKey(),numCost);
            }
        }

        session.setAttribute("books",hmStart);
        session.setAttribute("Bag",hm);
        request.getRequestDispatcher("index1.jsp").include(request, response);

        %>
    </div>



</body>
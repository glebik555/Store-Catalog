import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.text.*;
import javax.servlet.http.*;

public class Email extends HttpServlet {
    private HashMap<String, Integer[]> hm = new HashMap<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String email = (String)request.getParameter("buy");
        if (email.contains("@mail.ru") || email.contains("@bk.ru") || email.contains("@gmail.com")|| email.contains("@yandex.ru")) {
            out.println("<p>" + "The order was sent. Please check your email." + "</p>");
            HashMap<String,Integer[]> hm = (HashMap<String,Integer[]>)session.getAttribute("books");
            HashMap<String,Integer[]> bag = (HashMap<String,Integer[]>)session.getAttribute("Bag");
            for (Map.Entry<String, Integer[]> entry : bag.entrySet()) {
                if(hm.containsKey(entry.getKey())){
                    String name = entry.getKey();
                    Integer [] numCost = new Integer[2];
                    numCost[0] = entry.getValue()[0];
                    numCost[1] = hm.get(name)[1];
                    hm.put(name,numCost);
                }
            }
                bag.clear();
                session.setAttribute("books",hm);
                session.setAttribute("Bag",bag);
        


            request.getRequestDispatcher("bag.jsp").include(request, response);
        } else {
            out.println("<p>" + "Invalid email address" + "</p>");
            request.getRequestDispatcher("bag.jsp").include(request, response);
        }
    }
}

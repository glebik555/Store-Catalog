import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class AddBook extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();

        HashMap<String, Integer[]> hmCost = (HashMap) session.getAttribute("books");
        String name = request.getParameter("BooksName");
        Integer[] val = new Integer[2];
        val[0] = Integer.parseInt(request.getParameter("PriceOfBook"));
        val[1] = Integer.parseInt(request.getParameter("NumOfBook"));
        hmCost.put(name, val);

        session.setAttribute("books", hmCost);
        request.getRequestDispatcher("indexWorking.jsp").include(request, response);

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();

        HashMap<String, Integer[]> hmCost = (HashMap) session.getAttribute("books");
        String name = request.getParameter("nameBook");
        Integer[] val = new Integer[2];
        int num = Integer.parseInt(request.getParameter("change"));
        if(num<=0){
            num = 0;
        }
        int price = hmCost.get(name)[0];
        val[0]=price; val[1]=num;
        hmCost.put(name,val);
        session.setAttribute("books", hmCost);
        request.getRequestDispatcher("indexWorking.jsp").include(request, response);


    }
}
import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session1 = request.getSession();
        HashMap<String, Integer[]> hmCost = (HashMap) session1.getAttribute("books");
        HashMap<String, Integer[]> hm = (HashMap) session1.getAttribute("Bag");
        session1.invalidate();
        HttpSession session = request.getSession();
        session.setAttribute("books",hmCost);
        session.setAttribute("Bag",hm);
        request.getRequestDispatcher("index.jsp").include(request, response);
    }
}
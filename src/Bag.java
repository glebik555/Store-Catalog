import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.text.*;
import javax.servlet.http.*;

public class Bag extends HttpServlet {
    private HashMap<String, Integer[]> hm = new HashMap<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String num = request.getParameter("numOfBook");
        HttpSession session = request.getSession();

        HashMap<String, Integer[]> hmCost = (HashMap) session.getAttribute("books");

        String nameOfBook = request.getParameter("nameBook");
        Integer[] numCost = new Integer[2];



        if (hmCost.containsKey(nameOfBook)) {
            if (Integer.parseInt(num) <= 0) {
                request.getRequestDispatcher("index1.jsp").include(request, response);
            } else {
                if (Integer.parseInt(num) > hmCost.get(nameOfBook)[1]) {
                    num = hmCost.get(nameOfBook)[1].toString();
                }
                hmCost.get(nameOfBook)[1]-= Integer.parseInt(num);
                numCost[0] = hmCost.get(nameOfBook)[0];
                numCost[1] = Integer.parseInt(num);
                if(hm.containsKey(nameOfBook)){
                   numCost[1]+= hm.get(nameOfBook)[1];
                }
                hm.put(nameOfBook, numCost);
                
                session.setAttribute("Bag", hm);
                session.setAttribute("books",hmCost);
                
                request.getRequestDispatcher("bag.jsp").include(request, response);
            }

        }

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                HttpSession session = request.getSession();
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                HashMap<String, Integer[]> hmCost = (HashMap) session.getAttribute("books");
                int numStr = Integer.parseInt(request.getParameter("numStr"));
             
                HashMap<String, Integer[]> hmStr = new HashMap<>();
                int k = 0;
                int num = 0;
                for (Map.Entry<String, Integer[]> entry : hmCost.entrySet()){
                    
                    
                    if(k>=4*numStr){
                        hmStr.put(entry.getKey(),entry.getValue());
                        num++;
                    }
                    k++;
                    
                }


                session.setAttribute("str", hmStr);
                request.getRequestDispatcher("index1.jsp").include(request, response);







            }
}

import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.text.*;
import javax.servlet.http.*;

public class Catalog extends HttpServlet {
    private ArrayList<String> prom = new ArrayList<>();
    private HashMap<String,Integer[]> hm = new HashMap<>();
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        response.setContentType("text/html");
        try (FileReader reader = new FileReader(
                "/home/glebasta/Desktop/tomcat/apache-tomcat-9.0.39/webapps/kursach/src/book.txt")) {
            BufferedReader br = new BufferedReader(reader);
            String line;
            String[] subStr;
            while (((line = br.readLine()) != null)) {
                Integer[] CostNum = new Integer[2];
                subStr = line.split("_");
                CostNum[0] = Integer.parseInt(subStr[1]); // price
                CostNum[1] = Integer.parseInt(subStr[2]); // num of book
                hm.put(subStr[0], CostNum);
            }
        }
        HashMap<String, Integer[]> hm1 = new HashMap<>();
        session.setAttribute("Bag",hm1);
        session.setAttribute("books", hm);
        request.setAttribute("str",0);
        request.getRequestDispatcher("index.jsp").include(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        try (FileReader reader = new FileReader(
                "/home/glebasta/Desktop/tomcat/apache-tomcat-9.0.39/webapps/kursach/src/promo.txt")) {
            BufferedReader br = new BufferedReader(reader);
            PrintWriter out = response.getWriter();
            String line;
            HttpSession session = request.getSession();
            ArrayList<String> promo = new ArrayList<>();
            HashMap<String, Integer[]> hm1 = new HashMap<>();
            while (((line = br.readLine()) != null)) {
                promo.add(line);
            }
            String promocode = request.getParameter("promo");
            if (promo.contains(promocode)) {
                if ((prom.size() == 0) || (prom.size() != 0 && !prom.contains(promocode))) {
                    prom.add(promocode);
                    hm1 = (HashMap<String,Integer[]>) session.getAttribute("Bag");
                    for (Map.Entry<String, Integer[]> entry : hm1.entrySet()) {
                        Integer[] costNum = new Integer[2];
                        costNum[0] = (int) ((int) (entry.getValue()[0]) * 0.90);
                        costNum[1] = entry.getValue()[1];
                        hm1.put(entry.getKey(), costNum);

                    }
                session.setAttribute("Bag", hm1);
                session.setAttribute("Prom",prom);
                out.println("You used a promo");
                out.println("<p> </p>");
                request.getRequestDispatcher("bag.jsp").include(request, response);
                }else{
                    request.getRequestDispatcher("bag.jsp").include(request, response);
                }

                
            } else {
                out.println("Invalid promo");
                request.getRequestDispatcher("bag.jsp").include(request, response);
            }
        }
    }
}

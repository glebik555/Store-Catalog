import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
    private HashMap<String, String> hm1 = new HashMap<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html");
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        PrintWriter out = response.getWriter();

        

        try (FileReader reader = new FileReader("/home/glebasta/Desktop/tomcat/apache-tomcat-9.0.39/webapps/kursach/src/password.txt")) {
            BufferedReader br = new BufferedReader(reader);
            String line;
            String[] subStr;
            while (((line = br.readLine()) != null)) {
                subStr = line.split(" ");
                hm1.put(subStr[0], subStr[1]);
            }
        }
        
        
        int flag = 0;
        for (Map.Entry<String, String> entry : hm1.entrySet()) {

            if (password.equals(entry.getValue()) && (name.equals(entry.getKey()))) {
                
                HttpSession session = request.getSession();
                session.setAttribute("name", name);
                flag = 1;
                request.getRequestDispatcher("indexWorking.jsp").include(request, response);
            }

        }
        if (flag == 0) {
            out.print("Sorry, username or password error!");
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
        out.close();
    }

}
package controle;
 
import java.io.IOException;
 

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.email1;
 
/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 *
 * @author www.codejava.net
 *
 */
@WebServlet("/Email1")
public class Email1 extends HttpServlet {
    private String host;
    private String port;
    private String user;
    private String pass;
 
    public void init() {
        // reads SMTP server setting from web.xml file
//        ServletContext context = getServletContext();
        host ="smtp.gmail.com";
        port = "587";
        user ="hicham.dandan@gmail.com";
        pass = "zineb123";
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        String recipient = request.getParameter("email");
        String subject = request.getParameter("subject");
        String content = request.getParameter("message");
 
        String resultMessage = "";
 
        try {
        	email1.sendEmail(host, port, user, pass, recipient, subject, content);
            resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
        	email1.ajouter(request.getParameter("name"), recipient, subject, content);
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/contact.jsp").forward(request, response);
        }
        
    }
    
    
    
    
    
}
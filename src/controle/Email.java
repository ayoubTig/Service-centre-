package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.email;


@WebServlet("/Email")
public class Email extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Email() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/contact.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		email em = new email();
		em.sendEmail(email, subject, message);
		em.ajouter(name, email, subject, message);
		this.getServletContext().getRequestDispatcher("/contact.jsp").forward(request, response);
	}

}

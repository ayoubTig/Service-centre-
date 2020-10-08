package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.Admin;

/**
 * Servlet implementation class ajouterAdmin
 */
@WebServlet("/ajouterAdmin")
public class ajouterAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ajouterAdmin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin a=new Admin();
		a.setUsername(request.getParameter("username"));
		a.setPassword(request.getParameter("password"));
		Admin.add(a);
		//		this.getServletContext().getRequestDispatcher("/ajouteradmin.jsp").forward(request, response);
		response.sendRedirect("ajouteradmin.jsp");
	}

}

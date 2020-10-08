package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

@WebServlet("/comentaire")
public class comentaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public comentaire() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
HttpSession s = request.getSession();
		
		
		
		int idC = Integer.parseInt(request.getParameter("id_client"));
		String text = request.getParameter("text");
		int idA = Integer.parseInt(request.getParameter("id_annone"));
		String date = request.getParameter("date");
		
		Commentaire c = new Commentaire();
		c.setID_Client(Integer.parseInt(request.getParameter("id_client")));
		c.setText(request.getParameter("text"));
		c.setID_annonce(Integer.parseInt(request.getParameter("id_annone")));
		c.setDate(request.getParameter("date"));
		
		String msg = "";
		if(idC==0) {
			
			msg = "Vous n'etes pas connecter <br>Connecter s'il vous plais ou creer un compte c'est facile";
			response.sendRedirect("detail_annonce.jsp?idd="+idA);
		}else {
			c.add(idC, idA);
			response.sendRedirect("detail_annonce.jsp?idd="+idA);
		}
		
		request.setAttribute("messageCom", msg);
		
		
		
	 
		//this.getServletContext().getRequestDispatcher("/detail_annonce.jsp").forward(request, response);
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		

}}

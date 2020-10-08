package controle;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Categorie;


@WebServlet("/ajoutercategorie")
public class ajoutercategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ajoutercategorie() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		model.Categorie c=new Categorie();
		c.setNom(request.getParameter("nom_categorie"));
		c.setClasse(request.getParameter("class_BOOt"));
		try {
			c.ajouter();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("gestion_categorie.jsp");
		
	}

}

package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Gerer_off;
import model.offreur;

@WebServlet("/updateoff")
public class updateoff extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Gerer_off o;
	
	  public void init() throws ServletException
	    {
	    	super.init();
	    	o=new Gerer_off ();
	    	
	    }
    
    public updateoff() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//doGet(request, response);
		 int id=Integer.parseInt(request.getParameter("ID_off"));
		   String nom=request.getParameter("nom");
		   String email=request.getParameter("email");
		    String prenom=request.getParameter("prenom");
		    int phone=Integer.parseInt(request.getParameter("phone"));
		    String pass=request.getParameter("password");
		    String service=request.getParameter("nom_service");
		    String desc=request.getParameter("descreption");
		    String ville=request.getParameter("ville");
		    String genre=request.getParameter("genre");
		    String photo=request.getParameter("photo"); 
		    System.out.print(nom+"    "+prenom+"   "+phone+"    "+pass+"  "+service+"  "+desc+""+ville);
		    offreur or=new offreur(id,nom,prenom,email,pass,genre,phone,service,desc,ville,photo);
		    
		    o.updateOffreurr(id,or);
		    response.sendRedirect("profil.jsp?ID_off="+id);	  
	}

}

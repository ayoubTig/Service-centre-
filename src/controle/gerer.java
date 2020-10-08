package controle;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


import model.Gerer_off;

import model.offreur;




@WebServlet("/gerer")
public class gerer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Gerer_off of;
	String resultat;
	
    public gerer() {
        super();}
    public void init() throws ServletException
    {
    	super.init();
    	of=new Gerer_off ();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		offreur e=new offreur();
		Map<String, String> erreurs = new HashMap<String, String>();
        Map<String, String> result = new HashMap<String, String>();
		   e.setNom(request.getParameter("nom"));
	       e.setPrenom(request.getParameter("prenom"));
	       e.setEmail(request.getParameter("email"));
	       e.setService(request.getParameter("nom_service"));
	       int phone=Integer.parseInt(request.getParameter("phone"));
		   e.setPhone(phone);
		   e.setGenre(request.getParameter("genre"));
	       e.setPassword(request.getParameter("password"));
	       
	       e.setDescreption(request.getParameter("descreption"));
	       e.setVille(request.getParameter("ville"));
			
			//response.sendRedirect("loginO.jsp");
	       try {
	            validationEmail( e.getEmail() );
	        } catch ( Exception ex ) {
	            erreurs.put( "email", ex.getMessage() );
	        }

	        try {
	            validationMotsDePasse( e.getPassword(), request.getParameter("password2") );
	        } catch ( Exception ex ) {
	            erreurs.put( "password", ex.getMessage() );
	        }

	        /* Validation du champ nom. */
	        try {
	            validationNom( e.getNom() );
	        } catch ( Exception ex ) {
	            erreurs.put( "nom", ex.getMessage() );
	        }

	        /* Initialisation du résultat global de la validation. */
	        if ( erreurs.isEmpty() ) {
	            resultat = "<h5 style='color:green'>Inscription effectuée avec succès</h5>";
	            result.put( "ok", resultat);
	        } else {
	            resultat = "<h6 style='color:#d45252'>Échec de l'inscription</h6><br>";
	            result.put( "ok", resultat);
	        }
	        request.setAttribute( "erreurs", erreurs );
	        request.setAttribute( "result", result );

	       if (resultat.equals("<h5 style='color:green'>Inscription effectuée avec succès</h5>")) {
	    	   of.ajouter(e);
	       }
	       response.sendRedirect("/loginO.jsp");
	       //this.getServletContext().getRequestDispatcher("/offr.jsp" ).forward( request, response );

	     }	
	
private void validationEmail( String email ) throws Exception{
	  if ( email != null && email.trim().length() != 0 ) {
	        if ( !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
	            throw new Exception( "Merci de saisir une adresse e-mail valide." );
	        }
	    } else {
	        throw new Exception( "Merci de saisir une adresse e-mail." );
	    }
}
 private void validationMotsDePasse( String motDePasse, String confirmation ) throws Exception{
 	if (motDePasse != null && motDePasse.trim().length() != 0 && confirmation != null && confirmation.trim().length() != 0) {
         if (!motDePasse.equals(confirmation)) {
             throw new Exception("Les mots de passe entrés sont différents, merci de les saisir à nouveau.");
         } else if (motDePasse.trim().length() < 3) {
             throw new Exception("Les mots de passe doivent contenir au moins 3 caractères.");
         }
     } else {
         throw new Exception("Merci de saisir et confirmer votre mot de passe.");
     }
 }
 private void validationNom( String nom ) throws Exception{
 	
 	if ( nom != null && nom.trim().length() < 3 ) {
         throw new Exception( "Le nom doit contenir au moins 3 caractères." );
     }
 }


}
	

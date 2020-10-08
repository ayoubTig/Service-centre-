package controle;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Annonce;
import model.annonce_func;

 
@WebServlet("/pagenation")
public class pagenation extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public pagenation() {
        super();
         
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		
		
		
//		String key=request.getParameter("keyword");
//		String ville=request.getParameter("cherch_ville");
//		String categor=request.getParameter("cherch_categorie");
//		String valid=request.getParameter("valide");
		 
		 HttpSession session=request.getSession();
		
		int pageid=Integer.parseInt(request.getParameter("page"));
		
		int total=4;//nombre des lines qui on peux affiche
 		if(request.getParameter("page")==null)
 		{ // response.sendRedirect("/category.jsp/pagenation?page=1");
 			pageid=1;
 			System.out.print("ffffffffffffffirst fois");
 		}
		else if(pageid==1){
			
			
			
		}else{
			
			pageid=pageid-1;
			pageid=total*pageid+1;
			
			
		}
		ArrayList<Annonce> annonce=new ArrayList<Annonce>();
		
		
		try {
			System.out.print("Secccccconde fois pageid "+pageid );
			annonce=annonce_func.pagenation(pageid,total);
			System.out.print("22222222222222");
		} catch (SQLException e) {
	 
			e.printStackTrace();
		}
		
		request.setAttribute("list", annonce );
		
		 session.setAttribute("idPage",Integer.parseInt(request.getParameter("page")));
		 
	 getServletContext().getRequestDispatcher("/category.jsp").forward( request, response );
// System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaayayyyyyyysoiqsjlq");
	 
	 
	 
  		// response.sendRedirect("/category.jsp");
 		 
 
		
 	
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		
	}

}

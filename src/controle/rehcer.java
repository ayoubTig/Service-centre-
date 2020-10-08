package controle;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Annonce;
import model.annonce_func;

/**
 * Servlet implementation class rehcer
 */
@WebServlet("/rehcer")
public class rehcer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rehcer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// recherche(String key ,String ville,String categor,int start, int total)
		
		

		String key=request.getParameter("keyword");
		String ville=request.getParameter("cherch_ville");
		String categor=request.getParameter("cherch_categorie");
 
		System.out.print("request.getParameter( page )         "+request.getParameter("page"));
		 
		int pageid=Integer.parseInt(request.getParameter("page"));
		
		int total=6;//nombre des lines qui on peux affiche
 		if(request.getParameter("page")==null)
 		{ // response.sendRedirect("/category.jsp/pagenation?page=1");
 			 
 			 
 		}
		else if(pageid==1){
			
			
			
		}else{
			
			pageid=pageid-1;
			pageid=total*pageid+1;
			
			
		}
		ArrayList<Annonce> annonce=new ArrayList<Annonce>();
		
		
		try {
			
			
			System.out.print("System.out.print( recher1 ); pageid "+pageid );
			
			
			
			
			annonce=annonce_func.recherche(key,ville,categor,pageid, total);
			System.out.print(" System.out.print( recher1 ); 22222222222222");
		} catch (SQLException e) {
	 
			e.printStackTrace();
		}
		
		request.setAttribute("list", annonce );
		
	 getServletContext().getRequestDispatcher("/chercher.jsp").forward( request, response );
  System.out.println(" System.out.print( recher1 ); aaaaaaaaaaaaaaaaaaaaaaaaaaaayayyyyyyysoiqsjlq");
  		// response.sendRedirect("/chercher.jsp/pagenation?page="+pageid);
 		 
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

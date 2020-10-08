package controle;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.connect;
import javax.servlet.http.HttpSession;


@WebServlet("/loginoff")
public class loginoff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public loginoff() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*offreur*/
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		request.getSession().invalidate();
		 HttpSession session = request.getSession();
//		  RequestDispatcher rd;
		
		
		String sql = "SELECT * FROM offreur_service WHERE email=? AND password=?";
		Connection cnx = null;
		cnx=(Connection) connect.loadDatabase();
		
		
		try {
			PreparedStatement preparedS = (PreparedStatement) cnx.prepareStatement(sql);
			preparedS.setString(1, username);
			preparedS.setString(2, password);
			ResultSet res = null;
			res = preparedS.executeQuery();
			//////////////////////////////////////
			String sqlClient = "SELECT * FROM client WHERE email=? AND password=?";
			String clientN = request.getParameter("email");
			String clientP = request.getParameter("password");
			PreparedStatement prep = (PreparedStatement) cnx.prepareStatement(sqlClient);
			prep.setString(1, clientN);
			prep.setString(2, clientP);
			ResultSet Client = null;
			Client = prep.executeQuery();
			
				//////////////////////////////////////////////
				String useadmin = request.getParameter("email");
				String passadmin = request.getParameter("password");		
				String sqla = "SELECT * FROM admin WHERE username=? AND password=?";
					PreparedStatement prepare = (PreparedStatement) cnx.prepareStatement(sqla);
					prepare.setString(1, useadmin);
					prepare.setString(2, passadmin);
					ResultSet r = null;
					r = prepare.executeQuery();
				/////////////////////////////////////////////////////
			if( res.next())
			{
				//session.setAttribute("er", "Echéc de connexion");
				//String er=(String)request.getSession().getAttribute("er");
				int id=res.getInt(1);
				 session.setAttribute("id", id);
//				 this.getServletContext().getRequestDispatcher("GererAnnonce.jsp").forward(request, response);
				 response.sendRedirect("GererAnnonce.jsp");
				
//					System.out.println("Ce compte n'exist pas offreur_service offreur_service !! !! vérifier que vous avez bien insérer les information  Si n'a pas encore un compte essayer d'inscrire"); 
					//this.getServletContext().getRequestDispatcher("/loginO.jsp").forward(request, response);
			}
			else if( r.next())
			{
				//session.setAttribute("er", "Echéc de connexion");
				//String er=(String)request.getSession().getAttribute("er");
				System.out.println("ok111111111111111111");
				// 
				int id=r.getInt(1);
				 session.setAttribute("id", id);
				 response.sendRedirect("OfferurAdmine.jsp");
//				 rd=this.getServletContext().getRequestDispatcher("/OfferurAdmine.jsp");
//					rd.forward(request, response);
				 //this.getServletContext().getRequestDispatcher("/OfferurAdmine.jsp").forward(request, response);
				System.out.println("Ce compte n'exist pas admin  "); 
						
					// this.getServletContext().getRequestDispatcher("/loginO.jsp").forward(request, response);
			}
			else  if( Client.next())
			{
				//session.setAttribute("er", "Echéc de connexion");
				//String er=(String)request.getSession().getAttribute("er");
				int id=Client.getInt(1);
				 session.setAttribute("idcc", id);
				System.out.println("okokokokokokokokokokokokokokokokokokokokokokokokokokokokokok");
				   response.sendRedirect("index.jsp");
//				rd=this.getServletContext().getRequestDispatcher("/index.jsp");
//				rd.forward(request, response);
				  //this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			
			}
			else{
				session.setAttribute("erreur_d'authentification", '0');
				//System.out.println("Ce compte n'exist pas ClientClientClientClientClientClientClientClientClient !vérifier que vous avez bien insérer les information Si n'a pas encore un compte essayer d'inscrire"); 
				session.setAttribute("erreur_d'authentification", '1');
				 this.getServletContext().getRequestDispatcher("/loginO.jsp").forward(request, response);
				//this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
		
	

}

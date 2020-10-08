package controle;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.*;



@WebServlet("/LoginClient")
public class LoginClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LoginClient() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idAnnonce = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		String util = null;
		int id=0;
		
		try {
			ResultSet res1=null;
			ResultSet res2=null;
			
		String sql1 = "SELECT * FROM client WHERE email=? AND password=?";
		String sql2 = "SELECT * FROM offreur_service WHERE email=? AND password=?";
		Connection con = (Connection) connect.loadDatabase();
		PreparedStatement preparedS1= (PreparedStatement) con.prepareStatement(sql1);
		PreparedStatement preparedS2= (PreparedStatement) con.prepareStatement(sql2);
			preparedS1.setString(1, username);
			preparedS1.setString(2, password);
			
			preparedS2.setString(1, username);
			preparedS2.setString(2, password);
			
			res1 = preparedS1.executeQuery();
			res2 = preparedS2.executeQuery();
			
			if(res1.next())
			{
				client c = new client();
				
				
				 id=res1.getInt(1);
				c.setId(id);
				c.setNom(res1.getString(2));
				c.setPrenom(res1.getString(2));
				c.setEmail(res1.getString(3));
				c.setPassword(res1.getString(4));
				c.setPhone(res1.getString(5));
				c.setGenre(res1.getString(6));
				
				util = "client";
				request.setAttribute("util", util);
				
				session.setAttribute("Client", c);
				//response.sendRedirect("detail_annonce.jsp?idd="+idAnnonce);
				
				this.getServletContext().getRequestDispatcher("/detail_annonce.jsp?idd="+idAnnonce).forward(request, response);
			}else if(res2.next()){
				
				offreur o = new offreur();
				
				
				 id=res2.getInt(1);
				o.setId(id);
				o.setNom(res2.getString(2));
				o.setPrenom(res2.getString(2));
				o.setEmail(res2.getString(3));
				o.setPassword(res2.getString(4));
				o.setPhone(res2.getInt(5));
				o.setService(res2.getString(6));
				o.setDescreption(res2.getString(7));
				o.setVille(res2.getString(8));
				o.setGenre(res2.getString(9));
				
				util = "offreur";
				session.setAttribute("Offreur", o);
				request.setAttribute("util", util);
				//response.sendRedirect("detail_annonce.jsp?idd="+idAnnonce);
				
				this.getServletContext().getRequestDispatcher("/detail_annonce.jsp?idd="+idAnnonce).forward(request, response);
				
				}else {
					request.setAttribute("util", util);
					session.setAttribute("erreur", "Ce compte n'exist pas !! vérifier que vous avez bien insérer les information  Si n'a pas encore un compte essayer d'inscrire");
					response.sendRedirect("detail_annonce.jsp?idd="+idAnnonce);
				}
			
			
			} catch (SQLException e) {
					e.printStackTrace();
				}	
				
				 
				
			
		//
		
		
	}

}

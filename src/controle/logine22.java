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

import model.connect;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class logine22
 */
@WebServlet("/logine22")
public class logine22 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logine22() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		 HttpSession session = request.getSession();
		 int nbr=0;
			// `ID_Client`, `nom`, `prenom`, `email`, `password`, `phone`, `genre`
				String sql = "SELECT count(*) FROM `client` WHERE  `password`='"+password+"' AND `email`='"+username+"';";
				System.out.print("le pass  "+password+ "  email       "+username);
				Connection cnx = null;
				cnx=(Connection) connect.loadDatabase();
				
				try {
					PreparedStatement preparedS = (PreparedStatement) cnx.prepareStatement(sql);
					 
					ResultSet res = null;
					res = preparedS.executeQuery();
				
				if(res.next())
				{
					//session.setAttribute("er", "Echéc de connexion");
					//String er=(String)request.getSession().getAttribute("er");
					  nbr=res.getInt(1);
						
						//this.getServletContext().getRequestDispatcher("/loginO.jsp").forward(request, response);
				}
				 if( nbr==0){System.out.println("cleint ascrier vous pllzzzz"); 
					response.sendRedirect("logine22.jsp");}
				 else {
					int id=res.getInt(1);
					 session.setAttribute("id_Client", id);
					 
					 //session.getAttribute("id_off");
					 response.sendRedirect("category.jsp");
					
				}}catch (SQLException e) {
					e.printStackTrace();}
		}
		
		
	}



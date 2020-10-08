package controle;

import java.awt.print.Printable;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.annonce_func;

/**
 * Servlet implementation class ratingStar
 */
@WebServlet("/ratingStar")
public class ratingStar extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ratingStar() {
        super();
      
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		PrintWriter out = response.getWriter();
// 	int id_off=Integer.parseInt(request.getParameter("id_off"));
// 	int nbr_star=Integer.parseInt(request.getParameter("nbr_star"));
// 		int id_client=Integer.parseInt(request.getParameter("id_client"));
////		
// 		
// 		try {
// 			boolean voteor=annonce_func.dejavote(id_client);
// 			if(voteor==false){
//			annonce_func.inset(id_off,  nbr_star, id_client );}
// 			else if(voteor==true){out.println("<h1>  vous avez deja votez attention !!!!!!!!</h1>");}
//		} catch (SQLException e) {
//			 
//			e.printStackTrace();
//		}
//		
	int id_off=Integer.parseInt(request.getParameter("id_off"));
	 doPost(request,response);
	 ///ratingStar?id_off="+id_off /ratingStar?
		 response.sendRedirect("/publication/Ann.jsp?id_off="+id_off);	
		
		
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		
		PrintWriter out = response.getWriter();
	 	int id_off=Integer.parseInt(request.getParameter("id_off"));
	 	double nbr_star=Double.parseDouble(request.getParameter("rating"));
	 		int id_client=Integer.parseInt(request.getParameter("id_client"));
 				System.out.print("dddddddddddddddddddddddddddddeja insertaaaaaaaa"+request.getParameter("rating"));
	 		
	 		try {
	 			boolean voteor=annonce_func.dejavote(id_client,id_off);
	 			if(voteor==false){
				annonce_func.inset(id_off,nbr_star, id_client );}
	 			else if(voteor==true){
	 				annonce_func.update1(nbr_star,id_client,id_off );
	 				System.out.print("dddddddddddddddddddddddddddddeja insertaaaaaaaa");
	 				out.println("<h1>  vous avez deja votez attention !!!!!!!!</h1>");}
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
	 	
		
		
		
		
//		PrintWriter out = response.getWriter();
//	
//		 int cfg_min_stars=1;
//				 //Integer.parseInt(request.getParameter("minstar"));
//		 int cfg_max_stars=5;
//				 //Integer.parseInt(request.getParameter("maxstar"));
//		 //double temp_stars=Double.parseDouble(request.getParameter("rating"));
//		 double temp_stars=0;
//		try {
//			
//			temp_stars = annonce_func.selction_moyene(1);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		 for(int i=cfg_min_stars; i<=cfg_max_stars; i++) {
//			 
//			 
//			 if ( temp_stars >= 1) { // it going to check if your average rating is greater than equal to 1 or not if it is then it give you full star.
//			    out.println("<img src='./img/Star (Full).png' width='100'/>");
//			      temp_stars--; //after getting full star it decremnt the value and contiune the loop.
//			    }else {
//			      if ( temp_stars >= 0.5) { // if user select 3.5 rating, so in above condition at last it remain 0.5 rating will get left. then it came to this condition and give you the half star.
//			    	  out.println("<img src='./img/Star (Half Full).png' width='100'/>");
//			         temp_stars -= 0.5;
//			      }else { // at last but not the least when value gets zero then it return empty star.
//			    	  out.println("<img src='./img/Star (Empty).png' width='100'/>");
//			      }
//			    }
//			 
 	//	 }
//		 
 }

}

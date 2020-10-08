package controle;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import model.*;
 

 
@WebServlet("/GererAnnonce")
@javax.servlet.annotation.MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)

public class GererAnnonce extends HttpServlet {
	 private final String upload_directory="C:\\Users\\ACER\\Desktop\\web doc\\Projet_fin_etude\\FinalProjet\\WebContent\\img";
		private static final long serialVersionUID = 1L;	
	
	public void init() throws ServletException
    {
    	super.init();
    }
    public GererAnnonce() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//this.getServletContext().getRequestDispatcher("/WEB-INF/GererAnnonce.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String fname="";
		int item3=0;
		 response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        if(ServletFileUpload.isMultipartContent(request))
	        {
	        	try
	        	{
	        		DiskFileItemFactory factory=new DiskFileItemFactory();
	        		ServletFileUpload upload = new ServletFileUpload(factory);
	        		upload.setHeaderEncoding("UTF-8"); 
	        		List<FileItem> multparr=upload.parseRequest(request);
//	        				new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	        		
 
	        		 for (FileItem item : multparr) {
	        		        if (!item.isFormField()) 
  {  
	        		        	 
	        		           fname=new File (item.getName()).getName() ;
    
	        		           System.out.println("its very wierd to b here with Ayoub____________"+fname);
	        		           item.write(new File(upload_directory+File.separator+item.getName()));  
	        		           System.out.println("its very wierd to b here with AyoubHHHHHHHHHHH"+fname);
	        	            } 
	        		        if(item.isFormField())
	        	            { 
	        		        	if(item.getFieldName().equals("ID_off"))
        	                {   
       	                     item3=Integer.parseInt(item.getString());
       	                  System.out.println("its very wierd to b here with CCCCCCCCCCCCCCCCC"+item3);
       	               System.out.println("its very wierd to b here with CCCCCCCCCCCCCCCCC"+fname);
	        		        } }}
	        		 Gerer_off.updatePicture(fname,item3);
	        	            response.sendRedirect("profil.jsp?ID_off="+item3);
	       }catch (Exception e) { 
	    	   
	    	   out.println(e);}
	        	

	}
	       }}
	



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
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.Annonce;
import model.Gerer_off;
import model.annonce_func;
 

 
@WebServlet("/FileUploadServlet")
@javax.servlet.annotation.MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)

public class FileUploadServlet extends HttpServlet {
	 private final String upload_directory="C:\\Users\\ACER\\Desktop\\web doc\\Projet_fin_etude\\FinalProjet\\WebContent\\img";
		private static final long serialVersionUID = 1L;	
	
	public void init() throws ServletException
    {
    	super.init();
    }
    public FileUploadServlet() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//this.getServletContext().getRequestDispatcher("/WEB-INF/GererAnnonce.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
		String fname="";
		int id=0,price=0;
		String title="",desc="",cat="",type="";
		Annonce a = new Annonce();
		 response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        if(ServletFileUpload.isMultipartContent(request))
	        {
	        	try
	        	{
//	        		List<FileItem> multparr=new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	        		DiskFileItemFactory factory=new DiskFileItemFactory();
	        		ServletFileUpload upload = new ServletFileUpload(factory);
	        		upload.setHeaderEncoding("UTF-8"); 
	        		List<FileItem> multparr=upload.parseRequest(request);
	        		
	        		for (FileItem item : multparr) {
         		      
//	        		        {  System.out.println("its vvvvvvvvvvvvvvvv Ayoub" );
//	        		           fname=new File (item.getName()).getName();
//	        		           System.out.println("its very wierd to b here with636  Ayoub"+fname);
//	        		           item.write(new File(upload_directory+File.separator+fname));   
//	        	            } 		        if (!item.isFormField()) 
	        			 if (!item.isFormField())  {  
	        		        	 
	        		           fname=new File (item.getName()).getName() ;
   
	        		           System.out.println("its very wierd to b here with Ayoub____________"+fname);
	        		           item.write(new File(upload_directory+File.separator+item.getName()));  
	        		           System.out.println("its very wierd to b here with AyoubHHHHHHHHHHH"+fname);
	        	            }  
	        		        if(item.isFormField())
	        	            {
	        		        	if(item.getFieldName().equals("ID_off"))
        	                {   
       	                     id=Integer.parseInt(item.getString());  
       	                     System.out.println("its 1 Ayoub"+id);
	        		        } 
	        		        	if(item.getFieldName().equals("price"))
	        	                {   
	       	                     price=Integer.parseInt(item.getString());
	       	                     System.out.println("its 2 Ayoub"+price);
		        		        } 
	        		        	if(item.getFieldName().equals("description")) 
	        	                {   
	       	                     desc=item.getString();
	       	                     System.out.println("its 3 Ayoub"+desc);
		        		        } 
	        		        	
	        		        	if(item.getFieldName().equals("title")) 
	        	                {   
	       	                     title=item.getString(); System.out.println("its 4 Ayoub"+title);
		        		        } 
	        		        	if(item.getFieldName().equals("cherch_categorie"))
	        	                {   
	       	                    cat=item.getString();
	       	                    System.out.println("its 5 Ayoub"+cat);
		        		        } 
	        		        	if(item.getFieldName().equals("type"))
	        	                {   
	       	                    type=item.getString();
	       	                    System.out.println("its 6 Ayoub"+type);
		        		        } 
	        		        	}}annonce_func.addforOff(id, cat, fname,desc,title,price,type);
	        		        	System.out.println("its 222222222222222222222222222222222222222"+fname);
	        	            response.sendRedirect("annoncee.jsp?ID_off="+id);
	       }catch (Exception e) { out.println(e);}
	        	

	}
	       }}
	



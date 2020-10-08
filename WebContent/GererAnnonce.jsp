<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="assets/fonts/line-icons.css">

<link rel="stylesheet" type="text/css" href="assets/css/slicknav.css">

<link rel="stylesheet" type="text/css" href="assets/css/color-switcher.css">

<link rel="stylesheet" type="text/css" href="assets/css/nivo-lightbox.css">

<link rel="stylesheet" type="text/css" href="assets/css/animate.css">

<link rel="stylesheet" type="text/css" href="assets/css/owl.carousel.css">

<link rel="stylesheet" type="text/css" href="assets/css/main.css">

<link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
<style>
 @import "./assets/font-awesome-4.7.0/css/font-awesome.css";


/* fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; } */
/* h1 { font-size: 1.5em; margin: 10px; } */

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
/*   margin: 5px; */
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 
  </style>
</head>
<body>
<%@ page import="model.annonce_func" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.SQLException" %>
  <%	PrintWriter out1 = response.getWriter();
  String star[]=new String[6];
	 int cfg_min_stars=1;
	
	
		int ido=(Integer)request.getSession().getAttribute("id");
				
			 
	 int cfg_max_stars=5;
		 
	 double temp_stars=0;
	try {
		
		temp_stars = annonce_func.selction_moyene(ido);
			//	selction_moyene(idoff);
		System.out.println("nnnnnnnnnnnnn"+temp_stars);
	} catch (SQLException k) {
		// TODO Auto-generated catch block
		k.printStackTrace();
	}
	 
	 for(int l=cfg_min_stars; l<=cfg_max_stars; l++) {
		 
		
		 if ( temp_stars >= 1) { // it going to check if your average rating is greater than equal to 1 or not if it is then it give you full star.
			 star[l]="./img/Star (Full).png";
		      temp_stars--; //after getting full star it decremnt the value and contiune the loop.
		    }else {
		      if ( temp_stars >= 0.5 ) { // if user select 3.5 rating, so in above condition at last it remain 0.5 rating will get left. then it came to this condition and give you the half star.
		    	  star[l]="./img/Star (Half Full).png";
		         temp_stars -= 0.5;
		      }else { // at last but not the least when value gets zero then it return empty star.
		    	  star[l]="./img/Star (Empty).png";
		      }
		    }
		 
	 } %>

<header id="header-wrap">

<nav class="navbar navbar-expand-lg fixed-top scrolling-navbar">
<div class="container">

<div class="navbar-header">
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-navbar" aria-controls="main-navbar" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
<span class="lni-menu"></span>
<span class="lni-menu"></span>
<span class="lni-menu"></span>
</button>

</div>
<div class="collapse navbar-collapse" id="main-navbar">
<ul class="navbar-nav mr-auto">
<li class="nav-item active">
<a class="nav-link" href="index.jsp">
Accueil
</a>
</li>
<li class="nav-item">
<a class="nav-link" href="category.jsp">
Annonces
</a>
</li>
<li class="nav-item">
<a class="nav-link" href="contact.jsp">
Contact
</a>
</li>
</ul>
<ul class="sign-in">
<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="lni-user"></i> Mon Compte</a>
<div class="dropdown-menu">
<%  if (session.getAttribute("id") != null) {   %>
<a class="dropdown-item" href="GererAnnonce.jsp"><i class="lni-home"></i> Mon profil</a>
<a class="dropdown-item" href="Deconnexion"><i class="lni-close"></i> Déconnexion</a>
<%}else { %>
<a class="dropdown-item" href="loginO.jsp"><i class="lni-lock"></i> Se Connecter</a>
<a class="dropdown-item" href="offr.jsp"><i class="lni-user"></i> Inscreption</a>


<%} %>

</div>
</li>
</ul>
<a class="tg-btn" href="annoncee.jsp">
<i class="lni-pencil-alt"></i> Déposer Annonce
</a>
</div>
</div>

<ul class="mobile-menu">
<li>
<a class="active" href="index.jsp">Accueil</a>
</li>
<li>
<a href="category.jsp">Annonces</a>
</li>


<li>
<a href="contact..jsp">Contact </a>
</li>
<li>
<a href="">Mon Compte</a>
<ul class="dropdown">
<li><a href="annoncee.jsp"><i class="lni-lock"></i>Mon Profil</a></li>
<li><a href="loginO.jsp"><i class="lni-lock"></i>Se connecter</a></li>
<li><a href="offr.jsp"><i class="lni-user"></i>Inscription</a></li>
</ul>
</li>
</ul>

</nav>
</header>
<div class="page-header" style="background: url(assets/img/banner1.jpg);">
<div class="container">
<div class="row">
<div class="col-md-12">
<div class="breadcrumb-wrapper">
<h2 class="product-title">Mes annonces </h2>
<ol class="breadcrumb">
<li><a href="#">Accueil/</a></li>
<li class="current">Mes Annonces</li>
</ol>
</div>
</div>
</div>
</div>
</div>


<div id="content" class="section-padding">
<div class="container">
<div class="row">
<div class="col-sm-12 col-md-4 col-lg-3 page-sidebar">
<aside>
<div class="sidebar-box">
<div class="user">
<figure>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Gerer_off" %>
<%@ page import="model.offreur" %>
<% 
int idd=(Integer)request.getSession().getAttribute("id");
int ii;
Gerer_off o;
o=new Gerer_off();
offreur t=new offreur();
String user=request.getParameter("email");
//int id=Integer.parseInt(request.getParameter("ID_off"));
ArrayList<offreur> e= new ArrayList<offreur>();
e=o.AllOffreur(); 
       
        
        	 for( ii=0;ii<e.size();ii++){
        		if(idd==e.get(ii).getId()){%>
<a href="#"><img src="img/<% out.println(e.get(ii).getPhoto());%>" alt="" height="80" width="80"></a>
</figure>
<div class="usercontent">
<h3><% out.println(e.get(ii).getNom());%></h3>
<h4><% out.println(e.get(ii).getPrenom());}}%></h4>
</div>
</div>

<img alt="" src="<%=star[1]%>" width="30">
<img alt="" src="<%=star[2]%>" width="30">
<img alt="" src="<%=star[3]%>" width="30">
 <img alt="" src="<%=star[4]%>" width="30">  
<img alt="" src="<%=star[5]%>" width="30">

<br>
<a href="inde.jsp">Changer photo </a>



<nav class="navdashboard">
<ul>
<li>
<a  class="active" href="GererAnnonce.jsp">
<i class="lni-dashboard"></i>
<span>Mes Annonces</span>
</a>
</li>
<li>
<a  href="profil.jsp">
<i class="lni-cog"></i>
<span>Editer Mon Profil</span>
</a>
</li>
<li>
<a  href="annoncee.jsp">
<i class="lni-layers"></i>
<span>Ajouter Annonce</span>
</a>
</li>
<li>
<li>
<a href="Deconnexion">
<i class="lni-enter"></i>
<span>Déconnexion</span>
</a>
</li>
</ul>
</nav>
</div>
</aside>
</div>
<div class="col-sm-12 col-md-8 col-lg-9">
<div class="page-content">
<div class="inner-box">
<div class="dashboard-box">
<h2 class="dashbord-title">Mes annonces</h2>
</div>
<div class="dashboard-wrapper">
<nav class="nav-table">
<ul>
<li><a href="#">Tous les annonces(<%out.println(annonce_func.compterNombreAnn(idd));%>)</a></li>
<li><a href="#">les annonces publier(<%out.println(annonce_func.compterNombreAnnonceAccept(idd));%>)</a></li>
<li><a href="#">Les annonces non publier(<%out.println(annonce_func.compterNombreAnnonceRefus(idd));%>)</a></li>
</ul>
</nav>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
	<%@ page import="model.Annonce" %>
	<%@ page import="model.annonce_func" %>
	
	<% 
 		//String id_p = request.getParameter("ID_off");
		//String id2 = id_p;
        int i;
		int an=0;
		
		
		List<Annonce> annonces = new ArrayList<Annonce>();
		
		annonces = annonce_func.getAllAnnonce(idd);
		String idx=request.getParameter("ID_annonce");
		int idf = annonce_func.getIdOff(idx);
        
	%>

<table class="table table-responsive dashboardtable tablemyads">

<th>IMAGE</th>

<th>Categorie</th>
<th>Etat</th>

<th>price</th>
<th>title</th>
<th>Type</th>
<th>Action</th>
<%HttpSession sess= request.getSession();
        for( i=0;i<annonces.size();i++){
         if(request.getParameter("op")!=null)
			{
				if(request.getParameter("op").equals("m"))
				{
					int ide=Integer.parseInt(request.getParameter("ID_annonce"));
					if(ide==annonces.get(i).getId())
					{%>
					
						<form action='' >
						<%sess.setAttribute("ID_annonce", annonces.get(i).getId()); %>
						<%sess.setAttribute("ID_categorie", annonces.get(i).getId_cat()); %>
						<%sess.setAttribute("price", annonces.get(i).getPrice()); %>
						<%sess.setAttribute("ID_off", annonces.get(i).getId_off()); %>
						
						
						<%-- <input hidden type='number' value='<%out.println(annonces.get(i).getId());%>' name='ID_annonce'/> --%>
						<input hidden type='number' name='ID_off' value='<%out.println(annonces.get(i).getId_off());%>'/>
						<tr><td><input type='text' name='image' value='<%out.println(annonces.get(i).getImage());%>' readonly/>
						</td><input  type='text' name='descreption' value= <%=annonces.get(i).getDescription()%>  hidden/>
						<td><input type='number' name='ID_categorie' value='<%=annonces.get(i).getId_cat()%>' readonly /></td>
						<td><input type='text' name='etat' value='<%out.println(annonces.get(i).getEtat());%>' readonly/>
						</td><input  name='date' value='<%out.println(annonces.get(i).getDatepub());%>' readonly hidden= />
						<td><input type='number' name='price' value='<%=annonces.get(i).getPrice()%>'/>
						</td><td><input type='text' name='title' value='<%out.println(annonces.get(i).getTitle());%>'/></td>
						<td><select name='Type'><option>Je me propose</option><option>Je cherche</option></select>
					</td>
						<td><!-- <input type='hidden' name='op' value='u'/> -->
						<button class="btn btn-common log-btn" name='op' value='u' >valider</button>
						</td>
						</tr>
						
						</form>
					<% }
					else 
					{
						%>
						
						<tr>
						<td class="photo"><img class="img-fluid" src="img/<%out.println(annonces.get(i).getImage());%>" alt=""></td>
						
						<td>
				         <%out.println(annonce_func.getCae(annonces.get(i).getId_cat()));%>
			           </td>
						
						<td><%out.println(annonces.get(i).getEtat());%></td>
						
						<td><%out.println(annonces.get(i).getPrice());%></td>
						<td><%out.println(annonces.get(i).getTitle());%></td>
						<td><%out.println(annonces.get(i).getType());%></td>
						<td data-title="Action">
<div class="btns-actions">
<a class="btn-action btn-view" href="detail_annonce.jsp?idd=<%out.println(annonces.get(i).getId()); %>"><i class="lni-eye"></i></a>
<a class="btn-action btn-edit" href='?ID_annonce=<%out.println(annonces.get(i).getId());%>&op=m&ID_off=<%out.println(annonces.get(i).getId_off());%>'><i class="lni-pencil"></i></a>
<a class="btn-action btn-delete" href='?ID_annonce=<%out.println(annonces.get(i).getId());%>&op=d&ID_off=<%out.println(annonces.get(i).getId_off());%>'><i class="lni-trash"></i></a>
</div></td>	
						</tr>
						
				<%}
				
			}}
				else 
				{
					%>

						<tr>
						
						<td class="photo"><img class="img-fluid" src="img/<%out.println(annonces.get(i).getImage());%>" alt=""></td>
						
						
						<td>
				         <%out.println(annonce_func.getCae(annonces.get(i).getId_cat()));%>
			           </td>
						<td><%out.println(annonces.get(i).getEtat());%></td>
						
						<td><%out.println(annonces.get(i).getPrice());%></td>
						<td><%out.println(annonces.get(i).getTitle());%></td>
							<td><%out.println(annonces.get(i).getType());%></td>
 <td data-title="Action">
<div class="btns-actions">
<a class="btn-action btn-view" href="detail_annonce.jsp?idd=<%out.println(annonces.get(i).getId()); %>"><i class="lni-eye"></i></a>
<a class="btn-action btn-edit" href='?ID_annonce=<%out.println(annonces.get(i).getId());%>&op=m&ID_off=<%out.println(annonces.get(i).getId_off());%>'><i class="lni-pencil"></i></a>
<a class="btn-action btn-delete" href='?ID_annonce=<%out.println(annonces.get(i).getId());%>&op=d&ID_off=<%out.println(annonces.get(i).getId_off());%>'><i class="lni-trash"></i></a>
</div></td>	    
						</tr>
					<%
				}
         
        }%></table>
		<%
//		try{
		if(request.getParameter("op")!=null)
		{
			if(request.getParameter("op").equals("d")) {
			int iddd=(Integer)sess.getAttribute("ID_annonce");
//					(sess.getAttribute("ID_annonce"));
					//Integer.parseInt(request.getParameter("ID_annonce"));
			
			
			annonce_func.delete(iddd);
			
			response.sendRedirect("GererAnnonce.jsp?ID_off="+idf);}
			else if(request.getParameter("op").equals("u"))
			{	
			
			    int idr =(Integer)(sess.getAttribute("ID_annonce"));
			    int id_off=(Integer)(sess.getAttribute("ID_off"));
			    		//Integer.parseInt(request.getParameter("ID_off"));
			    
			    String desc=request.getParameter("descreption");
			   int id_cat=(Integer)(sess.getAttribute("ID_categorie"));
					   //Integer.parseInt(request.getParameter("ID_categorie"));
			  String title=request.getParameter("title");
			  String type=request.getParameter("Type");
			   
			    int price =(Integer)sess.getAttribute("price");
			    		//Integer.parseInt(request.getParameter("price"));
			    		//Integer.parseInt(request.getParameter("price"));
			
			    
			  
			    annonce_func.updateforann(idr,desc,title,type,price);
			    response.sendRedirect("GererAnnonce.jsp?ID_off="+idf);
			}

		}
		//} catch(Exception es){ out.print(es.getMessage());}%>
</body>
</html>
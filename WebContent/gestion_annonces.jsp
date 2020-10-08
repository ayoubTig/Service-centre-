<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</head>
<body>
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
<%}else if(session.getAttribute("Client") != null){ %>
<a class="dropdown-item" href="Deconnexion"><i class="lni-lock"></i> Deconnexion</a>


<%}else if(session.getAttribute("id_Client") != null){%>
	<a class="dropdown-item" href="Deconnexion"><i class="lni-lock"></i> Deconnexion</a>
<%}else {%>
	<a class="dropdown-item" href="loginO.jsp"><i class="lni-lock"></i> Se connecter</a>
	<a class="dropdown-item" href="offr.jsp"><i class="lni-lock"></i> Inscription</a>
<%}
%>

</div>
</li>
</ul>
<%if(session.getAttribute("id") != null) {%>
	<a class="tg-btn" href="annoncee.jsp">
<i class="lni-pencil-alt"></i> Deposer Annonce
</a>
<%}else {%>
<a class="tg-btn" href="loginO.jsp">
<i class="lni-pencil-alt"></i> Deposer Annonce
</a>
<%}%>
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
<h2 class="product-title">Gestion Des Annonces</h2>
<ol class="breadcrumb">
<li><a href="#">Accueil /</a></li>
<li class="current">Annonce</li>
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
<a href="#"><img width="80" height="80" src="img/adm.PNG" alt=""></a>
</figure>
<div class="usercontent">
<h3>Admin</h3>
<h4></h4>
</div>
</div>
<nav class="navdashboard">
<ul>
<li>
<a href="OfferurAdmine.jsp">
<i class="lni-dashboard"></i>
<span>Annonceurs</span>
</a>
</li>
<li>
<a href="ClientAmdmin.jsp">
<i class="lni-cog"></i>
<span>Clients</span>
</a>
</li>
<li>
<a  href="gestion_categorie.jsp">
<i class="lni-layers"></i>
<span> Categories</span>
</a>
</li>

<li>
<a class="active" href="gestion_annonces.jsp">
<i class="lni-wallet"></i>
<span>Annonces</span>
</a>
</li>
<li>
<a href="ajouteradmin.jsp">
<i class="lni-heart"></i>
<span>Ajouter Admin</span>
</a>
</li>

<li>
<a href="loginO.jsp">
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
<h2 class="dashbord-title">Liste Des Annonces</h2>
</div>
<div class="dashboard-wrapper">
<nav class="nav-table">
<ul>
<li><a href="">Annonce Accepter(<%out.println(annonce_func.compterNombreAnnonceAccepter());%>)</a></li>
<li><a href="#">Annonce Refuser (<%out.println(annonce_func.compterNombreAnnonceRefuser());%>)</a></li>
<li><a href="#">Total Des Annonces (<%out.println(annonce_func.compterNombreAnnonce());%>)</a></li>
</ul>
</nav>
<body>

<%@ page import="java.util.*"%>
	<%@ page import="model.*"%>
	<% 
			        int i;
			annonce_func  et;
			et=new annonce_func();
			Annonce t=new Annonce();
			ArrayList<Annonce> e= annonce_func.getAllAannonce();
			HttpSession sess= request.getSession();
      
%>


	<table class="table table-responsive dashboardtable tablemyads">
		
		<tr>
			
			<th>Image</th>
			<th>Title</th>
			
			<th>Categogie</th>
			<th>date</th>
			<th>Price</th>
			<th>etat</th>
			<th>Type</th>
			<th>Action</th>
		</tr>
		<%

for( i=0;i<e.size();i++){
    
    if(request.getParameter("op")!=null)
		{
			if(request.getParameter("op").equals("m"))
			{
				int id=Integer.parseInt(request.getParameter("ID_annonce"));
				if(id==e.get(i).getId())
				{%>

		<form action=''>

		<%sess.setAttribute("ID_annonce",e.get(i).getId());%>
		<%sess.setAttribute("ID_off",e.get(i).getId_off());%>
		<%sess.setAttribute("ID_off",e.get(i).getId_cat());%>
				<input hidden  type='number' readonly value='<%out.println(e.get(i).getId());%>' name='ID_annonce' />
			<input hidden name='ID_off' type='number' readonly
					value='<%out.println(e.get(i).getId_off());%>' />	<tr>
				<td><input name='image' type='text' readonly
					value='<%out.println(e.get(i).getImage());%>' /></td>
					<td><input name='title' type='text' readonly
					value='<%out.println(e.get(i).getTitle());%>' /></td>
				
				<td><input name='ID_categorie' type='number' readonly
					value='<%out.println(e.get(i).getId_cat());%>' /></td>
				<td><input name='date' type='date' readonly
					value='<%out.println(e.get(i).getDatepub());%>' /></td>
					<td><input name='price' type='number' readonly
					value='<%out.println(e.get(i).getPrice());%>' /></td>
					<td><select name='etat'><option>Refuser</option><option>Accepter</option><</select>
					</td>
					<td><input name='Type' type='text' 
					value='<%out.println(e.get(i).getType());%>' /></td>
				<td><input type='hidden' name='op' value='u' />
				<button class="btn btn-common log-btn">valider</button></td>
			</tr>
		</form>
		<% }

				else 
				{
					%>

		<tr>
			
			
			<td class="photo"><img class="img-fluid" src="img/<%out.println(e.get(i).getImage());%>" alt=""></td>
			<td>
				<%out.println(e.get(i).getTitle());%>
			</td>
			
			<td>
				<%out.println(annonce_func.getCae(e.get(i).getId_cat()));%>
			</td>
			<td>
				<%out.println(e.get(i).getDatepub());%>
			</td>
			<td>
				<%out.println(e.get(i).getPrice());%>
			</td>
			<td>
				<%out.println(e.get(i).getEtat());%>
			</td>
			<td>
				<%out.println(e.get(i).getType());%>
			</td>
			
				<td data-title="Action">
<div class="btns-actions">
<a class="btn-action btn-view" href="detail_annonce.jsp?idd=<%out.println(e.get(i).getId()); %>"><i class="lni-eye"></i></a>
<a class="btn-action btn-edit" href="?ID_annonce=<%out.println(e.get(i).getId());%>&op=m"><i class="lni-pencil"></i></a>
<a class="btn-action btn-delete" href="?ID_annonce=<%out.println(e.get(i).getId());%>&op=d"><i class="lni-trash"></i></a>
</div></td>	
				
		</tr>

		<%}
			
		}}
    else 
	{
		%>

		<tr>
			
			<td class="photo"><img class="img-fluid" src="img/<%out.println(e.get(i).getImage());%>" alt=""></td>
			<td>
				<%out.println(e.get(i).getTitle());%>
			</td>
			
			<td>
				<%out.println(annonce_func.getCae(e.get(i).getId_cat()));%>
			</td>
			<td>
				<%out.println(e.get(i).getDatepub());%>
			</td>
			<td>
				<%out.println(e.get(i).getPrice());%>
			</td>
			<td>
				<%out.println(e.get(i).getEtat());%>
			</td>
			<td>
				<%out.println(e.get(i).getType());%>
			</td>
			<td data-title="Action">
<div class="btns-actions">
<a class="btn-action btn-view" href="detail_annonce.jsp?idd=<%out.println(e.get(i).getId()); %>"><i class="lni-eye"></i></a>
<a class="btn-action btn-edit" href="?ID_annonce=<%out.println(e.get(i).getId());%>&op=m"><i class="lni-pencil"></i></a>
<a class="btn-action btn-delete" href="?ID_annonce=<%out.println(e.get(i).getId());%>&op=d"><i class="lni-trash"></i></a>
</div></td>	

		</tr>
		<%
	}
}%>


	</table>
	<%
if(request.getParameter("op")!=null)
{
	if(request.getParameter("op").equals("d")) {
	int id=(Integer) sess.getAttribute("ID_annonce");
			//Integer.parseInt(request.getParameter("ID_annonce"));
	
	annonce_func.delete(id);
	response.sendRedirect("gestion_annonces.jsp");}
	else if(request.getParameter("op").equals("u"))
	{	
		int id =(Integer) sess.getAttribute("ID_annonce");
				//Integer.parseInt(request.getParameter("ID_annonce"));
	    int id_off=(Integer) sess.getAttribute("ID_off");
	    		//Integer.parseInt(request.getParameter("ID_off"));
	    String image=request.getParameter("image");
	   
	   int id_cat=(Integer) sess.getAttribute("ID_categorie");
			   //Integer.parseInt(request.getParameter("ID_categorie"));
	  
	    String etat=request.getParameter("etat");
	    annonce_func.update(id,etat);
	   
	    response.sendRedirect("gestion_annonces.jsp");
	}

}%>


	<br>
	







</body>
</html>
</body>
</html>
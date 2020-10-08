<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="liste.css">
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
<%}else { %>
<a class="dropdown-item" href="loginO.jsp"><i class="lni-lock"></i> Se Connecter</a>
<a class="dropdown-item" href="offr.jsp"><i class="lni-user"></i> Inscreption</a>


<%} %>

</div>
</li>
</ul>
<a class="tg-btn" href="loginO.jsp">
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
<h2 class="product-title">Gestion Des Clients</h2>
<ol class="breadcrumb">
<li><a href="#">Accueil /</a></li>
<li class="current">Clients</li>
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
<a href="#"><img src="img/adm.PNG" alt="" width="80" height="80"></a>
</figure>
<div class="usercontent">
<h3>Admin</h3>

</div>
</div>
<nav class="navdashboard">
<ul>
<li>
<a href="OfferurAdmine.jsp">
<i class="lni-dashboard"></i>
<span> Annonceurs</span>
</a>
</li>
<li>
<a class="active" href="ClientAmdmin.jsp">
<i class="lni-cog"></i>
<span>Clients</span>
</a>
</li>
<li>
<a  href="gestion_categorie.jsp">
<i class="lni-layers"></i>
<span>Categories</span>
</a>
</li>
<li>
<a href="gestion_annonces.jsp">
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
<h2 class="dashbord-title">Liste Des Clients</h2>
</div>
<div class="dashboard-wrapper">
<nav class="nav-table">
<ul>
<li><a href="#">Total des visiteur (<%out.println(trai_client.compterNombreClient());%>)</a></li>


</ul>
</nav>
	<%@ page import="java.util.ArrayList"%>
	<%@ page import="model.client"%>
	<%@ page import="model.trai_client"%>

	<% 
			        int i;
			trai_client  et;
			et=new trai_client();
			client t=new client();
			ArrayList<client> e= et.AllC();
			HttpSession sess= request.getSession();
      
%>


	<table class="table table-responsive dashboardtable tablemyads">

<tr>


<th>NOM</th>
<th>PRENOM</th>
<th>EMAIL</th>
<th>PHONE</th>
<th>PASSWORD</th>
<th>Opération</th></tr>

</tr>

	
		<%

for( i=0;i<e.size();i++){
    
    if(request.getParameter("op")!=null)
		{
			if(request.getParameter("op").equals("m"))
			{
				int id=Integer.parseInt(request.getParameter("idE"));
				//id=(Integer) sess.getAttribute("idE");
				if(id==e.get(i).getId())
				{%>

		<form action=''>
 
					<%sess.setAttribute("idE",e.get(i).getId());%>
			<tr>
			<%-- 	<%sess.setAttribute("nom",e.get(i).getNom()); %>
				<%sess.setAttribute("prenom",e.get(i).getPrenom()); %>
				<%sess.setAttribute("email",e.get(i).getEmail()); %>
				<%sess.setAttribute("phone",e.get(i).getPhone()); %>
				<%sess.setAttribute("pass",e.get(i).getPassword()); %> --%>
			 
				<td><input name='nom' type='text' value='<%out.println(e.get(i).getNom());%>' /></td>
				<td><input name='prenom' type='text' value='<%out.println(e.get(i).getPrenom());%>' /></td>
				<td><input name='email' type='text' value='<%out.println(e.get(i).getEmail());%>' /></td>
				<td><input name='phone' type='text' value='<%out.println(e.get(i).getPhone());%>' /></td>
				<td><input name='pass' type='text' value='<%out.println(e.get(i).getPassword());%>' /></td>
					<%-- <%sess.setAttribute("nom",e.get(i).getNom()); %>
				<%sess.setAttribute("prenom",e.get(i).getPrenom()); %>
				<%sess.setAttribute("email",e.get(i).getEmail()); %>
				<%sess.setAttribute("phone",e.get(i).getPhone()); %>
				<%sess.setAttribute("pass",e.get(i).getPassword()); %> --%>
				<td><input type='hidden' name='op' value='u' />
				<button class="btn btn-common log-btn">valider</button>
				
			</tr>
		</form>
		<% }

				else 
				{
					%>

		<tr>
			
			<td>
				<%out.println(e.get(i).getNom());%>
			</td>
			<td>
				<%out.println(e.get(i).getPrenom());%>
			</td>
			<td>
				<%out.println(e.get(i).getEmail());%>
			</td>
			<td>
				<%out.println(e.get(i).getPhone());%>
			</td>
			<td>
				<%out.println(e.get(i).getPassword());%>
			</td>
			<td data-title="Action">
<div class="btns-actions">

<a class="btn-action btn-edit" href="?idE=<%out.println(e.get(i).getId());/* sess.setAttribute( "idE",e.get(i).getId()); */%>&op=m"><i class="lni-pencil"></i></a>
<a class="btn-action btn-delete" href="?idE=<%out.println(e.get(i).getId());/* sess.setAttribute( "idE",e.get(i).getId()); */%>&op=d"><i class="lni-trash"></i></a>
</div></td>				
			
		</tr>

		<%}
			
		}}
    else 
	{
		%>

		<tr>
			
			<td>
				<%out.println(e.get(i).getNom());%>
			</td>
			<td>
				<%out.println(e.get(i).getPrenom());%>
			</td>
			<td>
				<%out.println(e.get(i).getEmail());%>
			</td>
			<td>
				<%out.println(e.get(i).getPhone());%>
			</td>
			<td>
				<%out.println(e.get(i).getPassword());%>
			</td>

			<td data-title="Action">
<div class="btns-actions">

<a class="btn-action btn-edit" href="?idE=<%out.println(e.get(i).getId()); %>&op=m"><i class="lni-pencil"></i></a>
<a class="btn-action btn-delete" href="?idE=<%out.println(e.get(i).getId()); %>&op=d"><i class="lni-trash"></i></a>
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
	int id=(Integer) sess.getAttribute("idE");
	
	et.deleteClient(id);
	response.sendRedirect("ClientAmdmin.jsp");}
	else if(request.getParameter("op").equals("u"))
	{	
		int id =(Integer) sess.getAttribute("idE");
		
	    String nom=request.getParameter("nom");
	    		//(String) sess.getAttribute("nom");
	    
	    String prenom=request.getParameter("prenom");
	    		//(String) sess.getAttribute("prenom");
	    		//
	    String email=request.getParameter("email");
	    		//(String) sess.getAttribute("email");
	    		//
	    String phone= request.getParameter("phone");
	    		//(String) sess.getAttribute("phone");
	    	
	    String pass=request.getParameter("pass");
	    		//(String) sess.getAttribute("pass");
	    		//
	    		System.out.println("NOM  "+nom+"  prenom  "+prenom+"  email  "+email+" phone "+phone+"  pass  "+pass);
	     String genre=request.getParameter("genre");
	    client es=new client(id,nom,prenom,email,phone,pass,genre);
	    et.updateClinet (id ,nom,prenom,email,phone,pass);
	   
	    response.sendRedirect("ClientAmdmin.jsp");
	}

}%>


	






</body>
</html>
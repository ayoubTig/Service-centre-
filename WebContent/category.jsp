
<!DOCTYPE html>

<html lang="en">
 
<!-- Mirrored from preview.uideck.com/items/classixer-template/category.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 03 Apr 2018 23:57:44 GMT -->
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ClassiXER - Classified Ads Website Template</title>

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
<body >
 

 
<%
 ArrayList<Annonce>  part_annonce = new ArrayList<Annonce>();
 int idPage;
 HttpSession sese=request.getSession(); 
%>

<% 

 
%> 

<%if(request.getParameter("page")==null ){%><%  
     part_annonce=annonce_func.pagenation(1, 5);
idPage=1;
 sese.setAttribute("idPage", 1);
 %><%}else {part_annonce=( ArrayList<Annonce> )request.getAttribute("list");}%>
   <%   idPage=(Integer)sese.getAttribute("idPage");  %>   
     
     
     
     
     
     
   <%-- <jsp:forward page="/pagenation">
   <jsp:param name="page" value="1"/>
  </jsp:forward> --%>
    
     
     
     
     
     
<%@ page import="java.util.ArrayList" %>
 
	<%@ page import="model.*" %>
	<%@ page import="model.annonce_func" %>
 

 

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
<a href="index.jsp" class="navbar-brand"><img src="" alt=""></a>
</div>
<div class="collapse navbar-collapse" id="main-navbar">
<ul class="navbar-nav mr-auto">
<li class="nav-item">
<a class="nav-link" href="index.jsp">
Accueil
</a>
</li>
<li class="nav-item active">
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
<a class="dropdown-item" href="Deconnexion"><i class="lni-close"></i> D�connexion</a>
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


<div id="hero-area">
<div class="overlay"></div>
<div class="container">
<div class="row">
<div class="col-md-12 col-sm-12 text-center">
 <div class="contents-ctg">
<div class="search-bar">
<div class="search-inner">
<form class="search-form" action="rehcer" method="get">
<div class="form-group inputwithicon">
<i class="lni-tag"></i>
<input type="text" name="keyword" class="form-control" placeholder="What are you looking for">
</div>
<div class="form-group inputwithicon">
<i class="lni-map-marker"></i>
<%ArrayList<String> ville = new ArrayList<String>(); 
ville=annonce_func.selctVille();
%>
<div class="select">
<select name="cherch_ville">
<option></option>
<%for(int ii=0;ii<ville.size();ii++){ %>
<option><% out.println(ville.get(ii));%></option><%} %>
</select>
</div>
</div>
<div class="form-group inputwithicon">
<i class="lni-menu"></i>
<div class="select">

 <%ArrayList<String> cate = new ArrayList<String>(); 
cate=annonce_func.selctCa();
%>

 
<select name="cherch_categorie">
<option></option>
<%for(int ii=0;ii<cate.size();ii++){ %>
<option><% out.println(cate.get(ii));%></option><%} %>
</select>
</div>
</div>
<button class="btn btn-common" type="submit" name="page" value="1" ><i class="lni-search"></i> chercher</button>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</header>

<% /* HttpSession sese=request.getSession(); */   idPage=(Integer)sese.getAttribute("idPage");  %>
<div class="main-container section-padding">
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-12 col-xs-12 page-sidebar">
<aside>

<div class="widget categories">
<h4 class="widget-title">All Categories</h4>
<ul class="categories-list">
		<% ArrayList<Categorie> cat = Categorie.getAllCategorie1();
		
		
	 						
			 				for(int i=0;i<cat.size();i++)
		{
			 					ArrayList<Annonce> annonces = Categorie.getAnnonceOfCategorie(cat.get(i).getId());
		%>
		
			<li>
			<a href="detail_category.jsp?id=<%= cat.get(i).getId() %>">
			<i class="<% out.println(cat.get(i).getClasse()); %>"></i>
			<% out.println(cat.get(i).getNom()); %> <span class="category-counter">(<%= annonces.size() %>)</span>
			</a>
			</li>
			
		<%
			}
		%>
</ul>
</div>

</aside>
</div>
<div class="col-lg-9 col-md-12 col-xs-12 page-content">

<div class="product-filter">
<div class="short-name">
<span>Trouvez des comp�tences et des talents pr�s de chez vous.  professionnels, proposez vos services 
D�posez une annonce gratuite. (<%out.print(idPage);%> - 10 annonces of <%out.print(annonce_func.compterNombreAnnonceAccepter()); %> annonces)</span>
</div>
<div class="Show-item">
<span>Show Items</span>

</div>
<ul class="nav nav-tabs">
<li class="nav-item">
<a class="nav-link" data-toggle="tab" href="#grid-view"><i class="lni-grid"></i></a>
</li>
<li class="nav-item">
<a class="nav-link " data-toggle="tab" href="#list-view"><i class="lni-list"></i></a>
</li>
</ul>
</div>
 <%-- <%
/*  ArrayList<Annonce>  part_annonce = new ArrayList<Annonce>(); */

part_annonce=( ArrayList<Annonce> )request.getAttribute("list");

%>  --%>

<div  class= "adds-wrapper" >

<div class="tab-content">
<div id="grid-view" class="tab-pane fade">
<%for( int j=0;j<part_annonce.size();j++){ %>
<div class="row">


<%String url=annonce_func.getImage(part_annonce.get(j).getImage()); %>
 
  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">  
<div class="featured-box">
<figure>
<div class="icon">
<i class="lni-heart"></i>
</div>
<a href="detail_annonce.jsp?id=<%= part_annonce.get(j).getId() %>"><img class="img-fluid"  src="<%=url%>" alt=""></a>
</figure>


<div class="feature-content">
<div class="product">
<a href="detail_annonce.jsp?idd=<%= part_annonce.get(j).getId() %>"><% out.print( part_annonce.get(j).getType()); %></a>
</div>
<h4><a href="detail_annonce.jsp?idd=<%= part_annonce.get(j).getId() %>"><% out.print( part_annonce.get(j).getTitle()); %></a></h4>
 
<ul class="address">
<li>
<a href="detail_annonce.jsp?idd=<%= part_annonce.get(j).getId() %>"><i class="lni-map-marker"></i><%out.print(annonce_func.selctVille(part_annonce.get(j).getId_off())); %></a>
</li>
<li>
<a href="detail_annonce.jsp?idd=<%= part_annonce.get(j).getId() %>"><i class="lni-alarm-clock"></i>  <%out.println(part_annonce.get(j).getDatepub());%></a>
</li>
<li>
<a href="Ann.jsp?id_off= <%out.println(part_annonce.get(j).getId_off());%>"></a>
<a class="lni-user" href="Ann.jsp?id_off=<%=part_annonce.get(j).getId_off()%>"  ><%out.println(annonce_func.selctNOm(part_annonce.get(j).getId_off()));%></a> 
</li>
<li>
<a href="detail_category.jsp?idd=<%= part_annonce.get(j).getId_cat()%>"><i class="lni-package"></i> <%out.println(annonce_func.selctcatego(part_annonce.get(j).getId_cat()));%></a>
</li>
</ul>
<div class="listing-bottom">
<h3 class="price float-left"> <% out.print( part_annonce.get(j).getPrice()+" DH"); %></h3>
<a href="detail_annonce.jsp" class="btn-verified float-right"><i class="lni-check-box"></i> voir les d�tailles</a>
</div>
</div>
</div>
</div>
</div>
<%} %>
</div>




<div id="list-view" class="tab-pane fade active show">
<div class="row">

<!-- <form action="pagenation" method="get"> -->
 

 



<%--    <h2>Last Updated: <%out.print( part_annonce.get(1).getEtat()); %></h2>  --%> 



 

<%for( int j=0;j<part_annonce.size();j++){ %>






<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
<div class="featured-box">
<figure>
<div class="icon">
<i class="lni-heart"></i>
</div>
<!-- assets/img/featured/img5.jpg -->
<%String url=annonce_func.getImage(part_annonce.get(j).getImage()); %>
<a href="detail_annonce.jsp?idd=<%= part_annonce.get(j).getId() %>"><img class="img-fluid" class="img-rounded" src="<%=url%>" alt="hhhhhhhhhhhh" width="640" height="420"/></a>
</figure>

<div class="feature-content">
<div class="product">
<a href="detail_annonce.jsp?idd=<%= part_annonce.get(j).getId() %>"><% out.print( part_annonce.get(j).getType()); %></a>
</div>
<h4><a href="detail_annonce.jsp?idd=<%= part_annonce.get(j).getId() %>"><% out.print( part_annonce.get(j).getTitle()); %></a></h4>
<%-- <span>Last Updated: <%out.print(part_annonce.get(j).getDatepub()); %></span> --%>
<ul class="address">
<li>
 
<a href="detail_annonce.jsp?idd=<%= part_annonce.get(j).getId() %>"><i class="lni-map-marker"></i><%out.print(annonce_func.selctVille(part_annonce.get(j).getId_off())); %></a>
</li>
<li>
<a href="detail_annonce.jsp?idd=<%= part_annonce.get(j).getId() %>"><i class="lni-alarm-clock"></i> <%out.println(part_annonce.get(j).getDatepub());%></a>
</li>
<li>
<a href="Ann.jsp?id_off=<%out.println(part_annonce.get(j).getId_off());%>"><i class="lni-user"></i><%out.println(annonce_func.selctNOm(part_annonce.get(j).getId_off()));%></a>
</li>
<li>
<a href="detail_category.jsp?idd=<%= part_annonce.get(j).getId_cat()%>"><i class="lni-package"></i><%out.println(annonce_func.selctcatego(part_annonce.get(j).getId_cat()));%></a>
</li>
</ul>
<div class="listing-bottom">
<h3 class="price float-left"> <% out.print( part_annonce.get(j).getPrice()+"  DH"); %></h3>

<a href="detail_annonce.jsp?idd=<%= part_annonce.get(j).getId() %>" class="btn-verified float-right"><i class="lni-check-box"></i> voir les d�tailles</a>
</div>
</div>
</div>
</div>

 <%} %>
 
 
</div>
</div>
</div>
</div>


<div class="pagination-bar">
<nav>
<ul class="pagination">
<%
//String idS=request.getParameter("page");
 int id=idPage-1;
 if(id>0){
 String urlll="pagenation?page="+id;
 %>
<li class="page-item"><a class="page-link" href=<%=urlll%> >previous</a></li> 
<%} %>
<li class="page-item"><a class="page-link " href='pagenation?page=1'>1</a></li>
<li class="page-item"><a class="page-link" href='pagenation?page=2'>2</a></li>
 <%//String idd=request.getParameter("page");
 int ida=idPage+1;
 String urll="pagenation?page="+ida;
 %>
<li class="page-item"><a class="page-link" href=<%=urll%> >Next</a></li> 
</ul>
</nav>
</div>

</div>
</div>
</div>
</div>
























<footer>

<section class="footer-Content">
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 col-mb-12">
<div class="widget">

<div class="textwidget">
<p><h3><span class="year">I propose</span> </h3>est une plate-forme de services entre 
particuliers. Vous �tes � la recherche d'une personne  apte � remplir une mission ponctuelle ou � plus long  terme dans n'importe quel domaine ? SERVLUX	vous 
propose une liste des annonces des services qui peuvent  compl�ter votre mission	.Que vous soyez � la recherche  d'un photographe afin d'immortaliser votre mariage, d'une 
 personne apte � faire vos courses ou pour vous aider � d�m�nager ,SERVLUX.com vous aide � trouver pour tous les services dont vous avez besoin.</p>
</div>
</div>
</div>

<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 col-mb-12">
<div class="widget">
<h3 class="block-title">Aide</h3>
<ul class="menu">
<li><a href="#">Accueil</a></li>
<li><a href="#">Categories</a></li>
<li><a href="#">contacter nous</a></li>
<li><a href="#">D�poser annonce</a></li>

</ul>
</div>
</div>
<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 col-mb-12">
<div class="widget">
<h3 class="block-title">Contacter nous</h3>

<ul class="footer-social">
<li><a class="facebook" href="#"><i class="lni-facebook-filled"></i></a></li>
<li><a class="twitter" href="#"><i class="lni-twitter-filled"></i></a></li>
<li><a class="linkedin" href="#"><i class="lni-linkedin-fill"></i></a></li>
<li><a class="google-plus" href="#"><i class="lni-google-plus"></i></a></li>
</ul>
</div>
</div>
</div>
</div>
</section>


<div id="copyright">
<div class="container">
<div class="row">
<div class="col-md-12">
<div class="site-info float-left">
<p>All copyrights reserved &copy; 2018 - Designed by <a href=" " rel="nofollow">UIdeck</a></p>
</div>
</div>
</div>
</div>
</div>

</footer>
 

<a href="#" class="back-to-top">
<i class="lni-chevron-up"></i>
</a>

<%-- <div id="preloader">
<div class="loader" id="loader-1"><%response.sendRedirect("category.jsp/pagenation?page=1"); %></div>
</div>
 --%>

<script src="assets/js/jquery-min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<script src="assets/js/jquery.counterup.min.js"></script>
<script src="assets/js/waypoints.min.js"></script>
<script src="assets/js/wow.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/nivo-lightbox.js"></script>
<script src="assets/js/jquery.slicknav.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/form-validator.min.js"></script>
<script src="assets/js/contact-form-script.min.js"></script>
<script src="assets/js/summernote.js"></script>
</body>

<!-- Mirrored from preview.uideck.com/items/classixer-template/category.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 03 Apr 2018 23:57:46 GMT -->
</html>
<%@page import="org.apache.catalina.ant.SessionsTask"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from preview.uideck.com/items/classixer-template/single-post.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 03 Apr 2018 23:59:21 GMT -->
<head>

<%@ page import="model.*" %>
<%@ page import="controle.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import= "java.io.PrintWriter" %>
<%@ page import= "javax.servlet.http.HttpServletResponse" %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SERVLUX</title>

<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="assets/fonts/line-icons.css">

<link rel="stylesheet" type="text/css" href="assets/css/slicknav.css">

<link rel="stylesheet" type="text/css" href="assets/css/color-switcher.css">

<link rel="stylesheet" type="text/css" href="assets/css/nivo-lightbox.css">

<link rel="stylesheet" type="text/css" href="assets/css/animate.css">

<link rel="stylesheet" type="text/css" href="assets/css/owl.carousel.css">

<link rel="stylesheet" type="text/css" href="assets/css/main.css">

<link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
<link rel="stylesheet" href="annonce.css">
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
<a href="index.jsp" class="navbar-brand"><img src="" alt=""></a>
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
<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="lni-user"></i>Mon compte</a>
<div class="dropdown-menu">
<%  if (session.getAttribute("id") != null ) {   %>
<a class="dropdown-item" href="GererAnnonce.jsp"><i class="lni-home"></i> Mon profil</a>
<a class="dropdown-item" href="Deconnexion"><i class="lni-close"></i> Déconnexion</a>
<%}else if(session.getAttribute("Client") != null ||session.getAttribute("idcc") != null){ %>
<a class="dropdown-item" href="Deconnexion"><i class="lni-lock"></i> Deconnexion</a>


<%}else if(session.getAttribute("id_Client") != null ||session.getAttribute("idcc") != null){%>
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
<a class="active" href="index.jsp">Home</a>
</li>
<li>
<a href="category.html">Categories</a>
</li>
<li>
<a href="#">
Listings
</a>
<ul class="dropdown">
<li><a href="adlistinggrid.html">Ad Grid</a></li>
<li><a href="adlistinglist.html">Ad Listing</a></li>
<li><a href="ads-details.html">Listing Detail</a></li>
</ul>
</li>
<li>
<a href="#">Pages</a>
<ul class="dropdown">
<li><a href="about.html">About Us</a></li>
<li><a href="services.html">Services</a></li>
<li><a href="ads-details.html">Ads Details</a></li>
<li><a href="post-ads.html">Ads Post</a></li>
<li><a href="pricing.html">Packages</a></li>
<li><a href="testimonial.html">Testimonial</a></li>
<li><a href="faq.html">FAQ</a></li>
<li><a href="404.html">404</a></li>
</ul>
</li>
<li>
<a href="#">Blog</a>
<ul class="dropdown">
<li><a href="blog.html">Blog - Right Sidebar</a></li>
<li><a href="blog-left-sidebar.html">Blog - Left Sidebar</a></li>
<li><a href="blog-grid-full-width.html"> Blog full width </a></li>
<li><a href="single-post.html">Blog Details</a></li>
</ul>
</li>
<li>
<a href="contact.html">Contact Us</a>
</li>
<li>
<a>My Account</a>
<ul class="dropdown">
<li><a href="account-profile-setting.html"><i class="lni-home"></i> Account Home</a></li>
<li><a href="account-myads.html"><i class="lni-wallet"></i> My Ads</a></li>
<li><a href="account-favourite-ads.html"><i class="lni-heart"></i> Favourite ads</a></li>
<li><a href="account-archived-ads.html"><i class="lni-folder"></i> Archived</a></li>
<li><a href="login.html"><i class="lni-lock"></i> Log In</a></li>
<li><a href="signup.html"><i class="lni-user"></i> Signup</a></li>
<li><a href="forgot-password.html"><i class="lni-reload"></i> Forgot Password</a></li>
<li><a href="account-close.html"><i class="lni-close"></i>Account close</a></li>
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
<h2 class="product-title">Detail Annonce</h2>
<ol class="breadcrumb">
<li><a href="#">Home /</a></li>
<li class="current">Detail Annonce</li>
</ol>
</div>
</div>
</div>
</div>
</div>


<div id="content" class="section-padding">
<div class="container">
<div class="row">
<div class="col-lg-8 col-md-12 col-xs-12">

<div class="blog-post single-post">

<div class="post-thumb">
<%
	String idr = request.getParameter("idd");
/* if(idr== null)  idr=(String)request.getSession().getAttribute("idcc");
System.out.println("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ"+idr); */
	Annonce a = new Annonce();
	a= Annonce.getAnnonce(Integer.parseInt(idr));
	ArrayList<Commentaire> com = Commentaire.getAllCommentaireById(Integer.parseInt(idr));
	int idOff = Annonce.getIdOff(Integer.parseInt(idr));
	String nom = Annonce.selectNom(idOff);
%>
<a href="#"><img class="img-fluid" src="img/<% out.println(a.getImage()); %>" alt=""></a>
<div class="hover-wrap">
</div>
</div>


<div class="post-content">
<h2 class="post-title"><a href=""><% out.println(a.getTitle()); %></a></h2>
<div class="meta">
<span class="meta-part"><a href="#"><i class="lni-user"></i><% out.println(nom); %></a></span>
<span class="meta-part"><a href="#"><i class="lni-alarm-clock"></i> <% out.println(a.getDatepub()); %></a></span>
<span class="meta-part"><a href="#"><i class="lni-comments-alt"></i><% out.println( " "+com.size()+" " ); %>Commentaire</a></span>
</div>
<div class="entry-summary">
<p><% out.println(a.getDescription()); %></p>
</div>
</div>
</div>


<div id="comments">
<div class="comment-box">
<h3>Comments</h3>
<ol class="comments-list">
						<% 
							
						client  cl= (client)request.getSession().getAttribute("Client");
	 						
	 						
			 				for(int i=0;i<com.size();i++)
						 {%>
						<li>
									<div class="media">
									<div class="thumb-left">
									<a href="#">
									<img class="img-fluid" src="img\avatar.jpg" alt="" height="80" width="80">
									</a>
									</div>
									<div class="info-body">
									<div class="media-heading">
									<h4 class="name"><%=Annonce.selectNomcli(com.get(i).getID_Client())%></h4>
									<span class="comment-date"><i class="lni-alarm-clock"></i><% out.println(com.get(i).getDate()); %></span>
									<!-- <a href="#" class="reply-link"><i class="lni-reply"></i> Reply</a> -->
									</div>
									<p><%= com.get(i).getText() %> </p>
									</div>
									</div>
						
						</li>
						<%
							}
			 			%>
			
</ol>

<div id="respond">
<h2 class="respond-title">Metter une commentaire</h2>
						
						<% 
						int id = 0;
						if(session.getAttribute("Client")!=null)
						{
							client  c= (client)request.getSession().getAttribute("Client");
							id = c.getId();
							
						}else if(session.getAttribute("idcc")!=null){
						%>
							<p></p><% id=(int)session.getAttribute("idcc");
						}
						 %>
					<div>
					<% 
										if(session.getAttribute("Client")!=null  ||session.getAttribute("idcc") != null)
										{
											%> <h3 style="color:green"> Vous pouvez commenter maintenant :) </h3> <%
											
										}else{%>
											<h5 style="color:red">Pour commenter, il faut d'abord authentifier, Si vous n'avais pas encore un compte essayer d'inscrire.</h5>
											<div class="text-center">
		 						
		  						
							 						<button class="btn btn-common" onclick="openCity(event, 'login')">login</button>
							 						<button class="btn btn-common" onclick="openCity(event, 'inscription')">Inscription</button>
		 						
											</div>
											
											<div id="login" class="tabcontent">
						<section class="login section-padding">
							<div class="container">
							<div class="row justify-content-center">
							<div class="col-lg-5 col-md-12 col-xs-12">
							<div class="login-form login-area">
							<h3>
							Login
							</h3>
							<form role="form" class="login-form"  action="LoginClient" method="post">
								<div class="form-group">
									<div class="input-icon">
										<i class="lni-user"></i>
										<input type="text" id="sender-email" class="form-control" name="email" placeholder="Username">
									</div>
								</div>
								<div class="form-group">
									<div class="input-icon">
										
										<input type="number" name="id" value="<%= idr %>" hidden=>
									</div>
								</div>
								<div class="form-group">
									<div class="input-icon">
										<i class="lni-lock"></i>
										<input type="password" class="form-control" name="password" placeholder="Password">
									</div>
									
								<div class="text-center">
									<button type="submit" class="btn btn-common log-btn">Submit</button>
								</div>	
								
							
							
							
							</form>
							</div>
							</div>
							</div>
							</div>
						</section>
					</div>
					
					<div id="inscription" class="tabcontent">
						<section class="register section-padding">
							<div class="container">
							<div class="row justify-content-center">
							<div class="col-lg-5 col-md-12 col-xs-12">
							<div class="register-form login-area">
							<h3>
							Inscription
							</h3>
							<form class="login-form" role="form" action="Traitement" method="post">
							<div class="form-group">
							<div class="input-icon">
							
							<input type="number" name="id" value="<%= idr %>" hidden>
							</div>
							</div>
							<div class="form-group">
							<div class="input-icon">
							<i class="lni-user"></i>
							<input type="text" id="Name" class="form-control" name="nom" placeholder="nom">
							</div>
							</div>
							<div class="form-group">
							<div class="input-icon">
							<i class="lni-user"></i>
							<input type="text" id="Name" class="form-control" name="prenom" placeholder="prenom">
							</div>
							</div>
							<div class="form-group">
							<div class="input-icon">
							<i class="lni-envelope"></i>
							<input type="text" name="email"  id="sender-email" class="form-control"  placeholder="Email Address">
							</div>
							</div>
							<div class="form-group">
							<div class="input-icon">
							<i class="lni-lock"></i>
							<input type="number" name="phone" placeholder="numero de telephone*" class="form-control" >
							</div>
							</div>
							<div class="form-group">
							<div class="input-icon">
							<i class="lni-lock"></i>
							<input type="password" name="password" class="form-control" placeholder="password">
							</div>
							</div>
							<div class="form-group">
							<div class="input-icon">
							<i class="lni-lock"></i>
							<input type="password" name="password2" class="form-control" placeholder="password">
							</div>
							</div>
							
							<div class="form-group">
							
										<input type="radio" value="Homme" name="genre" /><label><span>Homme</span></label>
										<input type="radio" value="Femme" name="genre" /><label><span>Femme</span></label>
							</div>
								<div class="text-center">
									<button type="submit" class="btn btn-common log-btn">Submit</button>
								</div>	
							</form>
							</div>
							</div>
							</div>
							</div>
						</section>
					</div>	
											
											<%
										}
							
							%>
							<form action="comentaire" method="get">
							<div class="row">
							<div class="col-lg-6 col-md-6 col-xs-12">
							<div class="form-group">
							<input class="form-control" type="number" name="id_client" size="30" value="<%=id %>" hidden>
							</div>
							</div>
							<div class="col-lg-6 col-md-6 col-xs-12">
							<div class="form-group">
							<input class="form-control" type="hidden" name="id_annone" size="30" value="<%= Integer.parseInt(idr) %>">
							</div>
							</div>
							
							
							</div>
							<div class="row">
							<div class="col-lg-12 col-md-12col-xs-12">
							<div class="form-group">
							<textarea class="form-control" name="text" cols="45" rows="8" placeholder="Votre commentairer..."></textarea>
							</div>
							</div>
							</div>
							
								<button class="btn btn-common" type="submit">Commenter</button>
							
							</form>
							<br>
							<div>
								
							
								
							</div>
							
							
					</div>
					
					
</div>

</div>
</div>

</div>

<aside id="sidebar" class="col-lg-4 col-md-12 col-xs-12 right-sidebar">



<div class="widget categories">
<h4 class="widget-title">All Categories</h4>
<ul class="categories-list">
		<% 
		
		ArrayList<Categorie> cat = Categorie.getAllCategorie1();
	 						
			 				for(int i=0;i<cat.size();i++)
		{
			 					ArrayList<Annonce> annonces = Categorie.getAnnonceOfCategorie(cat.get(i).getId());
		%>
		
			<li>
			<a href="detail_category.jsp?idd=<%= cat.get(i).getId() %>">
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
</div>
</div>


<footer>

<section class="footer-Content">
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 col-mb-12">
<div class="widget">
<h3 class="footer-logo"><img src="assets/img/logo.png" alt=""></h3>
<div class="textwidget">
<p>SERVLUX est une plate-forme de services entre 
particuliers. Vous êtes à la recherche d'une personne
 apte à remplir une mission ponctuelle ou à plus long 
 terme dans n'importe quel domaine ? SERVLUX	vous 
 propose une liste des annonces des services qui peuvent 
 compléter votre mission	.Que vous soyez à la recherche 
 d'un photographe afin d'immortaliser votre mariage, d'une 
 personne apte à faire vos courses ou pour vous aider à déménager
,SERVLUX.com vous aide à trouver pour tous les services dont vous avez besoin.</p>
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
<li><a href="#">Déposer annonce</a></li>

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
<p>All copyrights reserved &copy; 2018 - Designed by <a href="https://uideck.com/" rel="nofollow">UIdeck</a></p>
</div>
</div>
</div>
</div>
</div>

</footer>


<a href="#" class="back-to-top">
<i class="lni-chevron-up"></i>
</a>

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


<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
</body>

<!-- Mirrored from preview.uideck.com/items/classixer-template/single-post.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 03 Apr 2018 23:59:30 GMT -->
</html>
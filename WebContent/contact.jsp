<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<!-- Mirrored from preview.uideck.com/items/classixer-template/contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 03 Apr 2018 23:59:30 GMT -->
<head>

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
<li class="nav-item">
<a class="nav-link" href="index.jsp">
Accueil
</a>
</li>
<li class="nav-item">
<a class="nav-link" href="category.jsp">
Annonces
</a>
</li>

<li class="nav-item active">
<a class="nav-link" href="contact.jsp">
Contact
</a>
</li>
</ul>
<ul class="sign-in">
<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="lni-user"></i>Mon compte</a>
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
<a class="active" href="index-2.html">Home</a>
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
<h2 class="product-title">Contact</h2>
<ol class="breadcrumb">
<li><a href="index.jsp">Acceuil /</a></li>
<li class="current">Contact</li>
</ol>
</div>
</div>
</div>
</div>
</div>





<section id="content" class="section-padding">
<div class="container">
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-8 col-lg-9">
<h2 class="contact-title">
Envoyer un message
</h2>

<form action="Email" class="contact-form" data-toggle="validator" method="post" >
<div class="row">
<div class="col-md-12">
<div class="row">
<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
<div class="form-group">
<input type="text" class="form-control" name="name" placeholder="Name" required data-error="Please enter your name">
<div class="help-block with-errors"></div>
</div>
</div>
<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
<div class="form-group">
<input type="email" class="form-control" name="email" placeholder="Email" required data-error="Please enter your email">
<div class="help-block with-errors"></div>
</div>
</div>
<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
<div class="form-group">
<input type="text" class="form-control" name="subject" placeholder="Subject" required data-error="Please enter your subject">
<div class="help-block with-errors"></div>
</div>
</div>
</div>
</div>
<div class="col-sm-12 col-md-12 col-lg-12">
<div class="row">
<div class="col-md-12">
<div class="form-group">
<textarea class="form-control" placeholder="Massage" rows="10" name="message" data-error="Write your message" required></textarea>
<div class="help-block with-errors"></div>
</div>
</div>
</div>
</div>
<div class="col-md-12">
<button type="submit" class="btn btn-common">Envoyer</button>

<div class="clearfix"></div>
</div>
</div>
</form>
</div>
<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3">
<h2 class="contact-title">
Plus d'information
</h2>
<div class="information">
<p></p>
<div class="contact-datails">
<div class="icon">
<i class="lni-map-marker icon-radius"></i>
</div>
<div class="info">
<h3>Address email:</h3>
<span class="detail">hicham.dandan@gmail.com</span>
<span class="detail">Bendhi.Jamila@gmail.com</span>
<span class="detail">Tiguodern.Ayoub@gmail.com</span>
 </div>
</div>
<div class="contact-datails">


</div>
<div class="contact-datails">


</div>
<div class="contact-datails">
<div class="icon">
<i class="lni-phone icon-radius"></i>
</div>
<div class="info">
<h3>Telephone</h3>
<span class="detail">Bendhi Jamila  : +212 623 456 789</span>
<span class="detail">Dandan Hicham  : +212 623 456 789</span>
<span class="detail">Tiguodern Ayoub: +212 623 456 789</span>
</div>
</div>
</div>
</div>
</div>
</div>
</section>


<footer>

<section class="footer-Content">
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 col-mb-12">
<div class="widget">

<div class="textwidget">
<p><h1><span class="year">I propose</span></h1> est une plate-forme de services entre 
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
<li><a href="index.jsp">Accueil</a></li>
<li><a href="category.jsp">Categories</a></li>
<li><a href="contact.jsp">contacter nous</a></li>
<li><a href="loginO.jsp">Déposer annonce</a></li>

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
<p>Toutes droits réserver &copy; 2018 - Designed by <a href="https://uideck.com/" rel="nofollow">I Propose</a></p>
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
</body>

<!-- Mirrored from preview.uideck.com/items/classixer-template/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 03 Apr 2018 23:57:44 GMT -->
</html>

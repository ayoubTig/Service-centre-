<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inscreption Client</title>
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="assets/fonts/line-icons.css">

<link rel="stylesheet" type="text/css" href="assets/css/slicknav.css">

<link rel="stylesheet" type="text/css" href="assets/css/color-switcher.css">

<link rel="stylesheet" type="text/css" href="assets/css/nivo-lightbox.css">

<link rel="stylesheet" type="text/css" href="assets/css/animate.css">

<link rel="stylesheet" type="text/css" href="assets/css/owl.carousel.css">

<link rel="stylesheet" type="text/css" href="assets/css/main.css">

<link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
<style type="text/css">
input:focus:invalid {
  box-shadow: 0 0 5px #d45252;
  border-color: #b03535;
}

input:focus:valid {
  box-shadow: 0 0 5px #5cd053;
  border-color: #28921f;
}
h5
{
float: right;
margin-right: 30px;

}
h6
{
float: right;
margin-right: 80px;

font-size: 18px;

}
span
{
color:#d45252;
}
</style>
</head>

<%@ page import="model.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
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
<a href="index.jsp" class="navbar-brand"><img src="assets/img/logo.png" alt=""></a>
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
<a class="dropdown-item" href="Deconnexion"><i class="lni-close"></i> Déconnexion</a>
<%}else { %>
<a class="dropdown-item" href="loginO.jsp"><i class="lni-lock"></i> Se Connecter</a>
<a class="dropdown-item" href="offr.jsp"><i class="lni-user"></i> Inscreption</a>


<%} %>

</div>
</li>
</ul>
<a class="tg-btn" href="annonce.jsp">
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
<h2 class="product-title">Inscreption</h2>
<ol class="breadcrumb">
<li><a href="#">Acceuil/</a></li>
<li class="current">Inscreption</li>
</ol>
</div>
</div>
</div>
</div>
</div>


<section class="register section-padding">
<div class="container">
<div class="row justify-content-center">
<div class="col-lg-5 col-md-12 col-xs-12">
<div class="register-form login-area">
<p class="erreur">${result['ok']}</p>
<h3>Inscreption</h3>

<form class="login-form" role="form" action="Traitement" method="post">
<div class="form-group">
<div class="input-icon">
<i class="lni-user"></i>
<input type="text" id="Name" class="form-control" name="nom" placeholder="nom" required>
</div>
<span class="erreur">${erreurs['nom']}</span>
</div>
<div class="form-group">
<div class="input-icon">
<i class="lni-user"></i>
<input type="text" id="Name" class="form-control" name="prenom" placeholder="prenom" required>
</div>
<span class="erreur">${erreurs['nom']}</span>
</div>
<div class="form-group">
<div class="input-icon">
<i class="lni-envelope"></i>
<input type="text" name="email"  id="sender-email" class="form-control"  placeholder="Email Address" required>
</div>
<span class="erreur">${erreurs['email']}</span>
</div>
<div class="form-group">
<div class="input-icon">
<i class="lni-lock"></i>
<input type="number" name="phone" placeholder="numero de telephone*" class="form-control" required>
</div>
<span class="erreur">${erreurs['phone']}</span>
</div>
<div class="form-group">
<div class="input-icon">
<i class="lni-lock"></i>
<input type="password" name="password" class="form-control" placeholder="password" required>
</div>
<span class="erreur">${erreurs['password']}</span>
</div>
<div class="form-group">
<div class="input-icon">
<i class="lni-lock"></i>
<input type="password" name="password2" class="form-control" placeholder="password" required>
</div>
<span class="erreur">${erreurs['password']}</span>
</div>

<div class="form-group">

			<input type="radio" value="Homme" name="genre" required/><label><p>Homme</p></label>
			<input type="radio" value="Femme" name="genre" required /><label><p>Femme</p></label>
</div>
	

<div class="text-center">
<button class="btn btn-common log-btn">Register</button>
</div>
</form>
</div>
</div>
</div>
</div>
</section>
</body>
</html>
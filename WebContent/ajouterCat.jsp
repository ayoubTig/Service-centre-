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
<a href="index-2.html" class="navbar-brand"><img src="assets/img/logo.png" alt=""></a>
</div>
<div class="collapse navbar-collapse" id="main-navbar">
<ul class="navbar-nav mr-auto">
<li class="nav-item active">
<a class="nav-link" href="index-2.html">
Accueil
</a>
</li>
<li class="nav-item">
<a class="nav-link" href="category.jsp">
Annonces
</a>
</li>

<li class="nav-item">
<a class="nav-link" href="contact.html">
Contact
</a>
</li>
</ul>
<ul class="sign-in">
<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="lni-user"></i> Mon compte</a>
<div class="dropdown-menu">

<a class="dropdown-item" href="loginO.jsp"><i class="lni-lock"></i> Se Connecter</a>
<a class="dropdown-item" href="offr.jsp"><i class="lni-user"></i> Inscription</a>

</div>
</li>
</ul>
<a class="tg-btn" href="post-ads.html">
<i class="lni-pencil-alt"></i> D�poser Annonce
</a>
</div>
</div>

<ul class="mobile-menu">
<li>
<a class="active" href="index-2.html">Accueil</a>
</li>
<li>
<a href="category.html">Categories</a>
</li>

<li>
<a href="contact.html">Contact Us</a>
</li>
<li>
<a>My Account</a>
<ul class="dropdown">

<li><a href="loginO.jsp"><i class="lni-lock"></i> Log In</a></li>
<li><a href="offr.jsp"><i class="lni-user"></i> Signup</a></li>

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
<h2 class="product-title">Ajouter Categorie</h2>
<ol class="breadcrumb">
<li><a href="#">Home /</a></li>
<li class="current">Ajouter Categorie</li>
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
<a href="#"><img src="img/adm.PNG" alt="" width="80" height="80" ></a>
</figure>
<div class="usercontent">

<h4>Admin</h4>
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
<a  href="ClientAmdmin.jsp">
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
<a href="payments.html">
<i class="lni-wallet"></i>
<span>Annonces</span>
</a>
</li>
<li>
<a  href="ajouteradmin.jsp">
<i class="lni-heart"></i>
<span>Ajouter Admin</span>
</a>
</li>
<li>
<a href="loginO.jsp">
<i class="lni-enter"></i>
<span>D�connexion</span>
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
<h2 class="dashbord-title">Ajouter Categorie</h2>
</div><br><br>
<div class="dashboard-wrapper">
<form class="row" method="post" action="ajoutercategorie">

<div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
<div class="dashboardholder">
<div class="form-group">
<div class="input-icon">

<input  type="text" name="nom_categorie" class="form-control" placeholder="CATEGORIE"></input>
<br>
<input  type="text" name="class_BOOt" class="form-control" placeholder="class_bootsarp SVP"></input></div>
</div>
<button class="btn btn-common log-btn">Ajouter</button>
</div>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>
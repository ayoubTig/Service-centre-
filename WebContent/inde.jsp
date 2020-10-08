

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<a href="index.jsp" class="navbar-brand"><img src="" alt=""></a>
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
<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="lni-user"></i> Mon Compte</a>
<div class="dropdown-menu">
<a class="dropdown-item" href="GererAnnonce.jsp"><i class="lni-home"></i> Mon profil</a>
<a class="dropdown-item" href="Deconnexion"><i class="lni-close"></i> Déconnexion</a>

</div>
</li>
</ul>
<a class="tg-btn" href="post-ads.html">
<i class="lni-pencil-alt"></i> Déposer Annonce
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

<li><a href="login.html"><i class="lni-lock"></i> Log In</a></li>
<li><a href="signup.html"><i class="lni-user"></i> Signup</a></li>
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
<h2 class="product-title">Changer photo de profil </h2>
<ol class="breadcrumb">
<li><a href="#">Accueil /</a></li>
<li class="current">Changer  photo de profil</li>
</ol>
</div>
</div>
</div>
</div>
</div>

<%int idd=(Integer)request.getSession().getAttribute("id"); %>
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
int i;
Gerer_off o;
o=new Gerer_off();
offreur t=new offreur();
String user=request.getParameter("email");
//int id=Integer.parseInt(request.getParameter("ID_off"));
ArrayList<offreur> e= new ArrayList<>();
e=o.AllOffreur(); 
       
        
        	 for( i=0;i<e.size();i++){
        		if(idd==e.get(i).getId()){%>
<a href="#"><img src="img/<% out.println(e.get(i).getPhoto());%>" alt="" height="80" width="80"></a>
</figure>
<div class="usercontent">
<h3><% out.println(e.get(i).getNom());%></h3>
<h4><% out.println(e.get(i).getPrenom());%></h4>
</div>
</div>

<a href="changerphotoprofilr.jsp">Changer photo de profil</a>

<nav class="navdashboard">
<ul>
<li>
<a  href="GererAnnonce.jsp">
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
<h2 class="dashbord-title">Changer la photo de mon profil</h2>
</div>
<figure>
<a href="#"><img src="img/<% out.println(e.get(i).getPhoto());%>" alt="" height="80" width="80"></a>
<FORM ENCTYPE="multipart/form-data" ACTION="GererAnnonce" METHOD=POST>
<INPUT NAME="file" TYPE="file">
<input  name="ID_off" type="number" value="<%=idd%>" hidden=>
<% }}%>
<button class="btn btn-common log-btn">valider</button></td>

</FORM>
</figure>
</body>
</html>


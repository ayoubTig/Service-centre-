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
<body>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>


 <%@ page import="model.*" %>
	<% 
 		String id_p = request.getParameter("ID_off");
		String id2 = id_p;
        int i;
		int an=0;
		ArrayList<Annonce> annonces = new ArrayList<Annonce>();
	
		annonces = annonce_func.getAllAnnonce();
		String idx=request.getParameter("ID_annonce");
		int idf = annonce_func.getIdOff(idx);
        
	%>



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

<div id="hero-area">
<div class="overlay"></div>
<div class="container">
<div class="row">
<div class="col-md-12 col-sm-12 text-center">
 <div class="contents-ctg">
<div class="search-bar">
<div class="search-inner">
<form class="search-form">
<div class="form-group inputwithicon">
<i class="lni-tag"></i>
<input type="text" name="customword" class="form-control" placeholder="What are you looking for">
</div>
<div class="form-group inputwithicon">
<i class="lni-map-marker"></i>
<%ArrayList<String> ville = new ArrayList<String>(); 
ville=annonce_func.selctVille();
%>
<div class="select">
<select name="cherch_ville">
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
<%for(int ii=0;ii<cate.size();ii++){ %>
<option><% out.println(cate.get(ii));%></option><%} %>
</select>
</div>
</div>
<button class="btn btn-common" type="button"><i class="lni-search"></i> Search Now</button>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</header>


<div class="main-container section-padding">
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-12 col-xs-12 page-sidebar">
<aside>

<div class="widget_search">
<form role="search" id="search-form">
<input type="search" class="form-control" autocomplete="off" name="s" placeholder="Search..." id="search-input" value="">
<button type="submit" id="search-submit" class="search-btn"><i class="lni-search"></i></button>
</form>
</div>

<div class="widget categories">
<h4 class="widget-title">All Categories</h4>
<ul class="categories-list">
<%for(int ii=0;ii<cate.size();ii++){ %>
<li><% out.println(cate.get(ii));%><span class="category-counter">(<%out.println(ii); %>)</span></li><%} %>
 
</div>
<div class="widget">
<h4 class="widget-title">Advertisement</h4>
<div class="add-box">
<img class="img-fluid" src="assets/img/img1.jpg" alt="">
</div>
</div>
</aside>
</div>
<div class="col-lg-9 col-md-12 col-xs-12 page-content">

<div class="product-filter">
<div class="short-name">
<span>Showing (1 - 12 products of 7371 products)</span>
</div>
<div class="Show-item">
<span>Show Items</span>
<form class="woocommerce-ordering" method="post">
<label>
<select name="order" class="orderby">
<option selected="selected" value="menu-order">49 items</option>
<option value="popularity">popularity</option>
<option value="popularity">Average ration</option>
<option value="popularity">newness</option>
<option value="popularity">price</option>
</select>
</label>
</form>
</div>
<ul class="nav nav-tabs">
<li class="nav-item">
<a class="nav-link" data-toggle="tab" href="#grid-view"><i class="lni-grid"></i></a>
</li>
<li class="nav-item">
<a class="nav-link active" data-toggle="tab" href="#list-view"><i class="lni-list"></i></a>
</li>
</ul>
</div>





<div  class= "adds-wrapper" >

<div class="tab-content">
<div id="grid-view" class="tab-pane fade">
<div class="row">



 
<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
<div class="featured-box">
<figure>
<div class="icon">
<i class="lni-heart"></i>
</div>
<a href="#"><img class="img-fluid" src="assets/img/featured/img4.jpg" alt=""></a>
</figure>
<div class="feature-content">
<div class="product">
<a href="#">Vehicles</a>
</div>
<h4><a href="ads-details.html">BMW 5 Series GT Car</a></h4>
<span>Last Updated: 5 hours ago</span>
<ul class="address">
<li>
<a href="#"><i class="lni-map-marker"></i> Dallas, Washington</a>
</li>
<li>
<a href="#"><i class="lni-alarm-clock"></i> Dec 18, 2018</a>
</li>
<li>
<a href="#"><i class="lni-user"></i> Elon Musk</a>
</li>
<li>
<a href="#"><i class="lni-package"></i> N/A</a>
</li>
</ul>
<div class="listing-bottom">
<h3 class="price float-left">$300.00</h3>
<a href="account-myads.html" class="btn-verified float-right"><i class="lni-check-box"></i> Verified Ad</a>
</div>
</div>
</div>
</div>
</div>
</div>
<div id="list-view" class="tab-pane fade active show">
<div class="row">

<form method="get" action="pagenation">

<%
int id=Integer.parseInt( request.getParameter("page"));
for( int j=id+1;j<annonces.size();j++){  int k=0;%>






<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
<div class="featured-box">
<figure>
<div class="icon">
<i class="lni-heart"></i>
</div>
<!-- assets/img/featured/img5.jpg -->
<%String url=annonce_func.getImage(annonces.get(j).getImage()); %>
<a href="#"><img class="img-fluid" class="img-rounded" src="<%=url%>" alt="hhhhhhhhhhhh" width="640" height="420"/></a>
</figure>
<div class="feature-content">
<div class="product">
<a href="#">Apple</a>
</div>
<h4><a href="ads-details.html">ID annonce<% out.print( annonces.get(j).getId()); %></a></h4>
<span>Last Updated: <%out.print(annonces.get(j).getDatepub()); %></span>
<ul class="address">
<li>
 
<a href="#"><i class="lni-map-marker"></i><%out.print(annonce_func.selctVille(annonces.get(j).getId_off())); %></a>
</li>
<li>
<a href="#"><i class="lni-alarm-clock"></i> <%out.print(annonces.get(j).getDatepub()); %></a>
</li>
<li>
<a href="#"><i class="lni-user"></i> Will Ernest</a>
</li>
<li>
<a href="#"><i class="lni-package"></i> Brand New</a>
</li>
</ul>
<div class="listing-bottom">
<h3 class="price float-left">$450.00</h3>
<a href="account-myads.html" class="btn-verified float-right"><i class="lni-check-box"></i> Verified Ad</a>
</div>
</div>
</div>
</div>

<input type='text' readonly value="<%out.print(j);%>"  name="jhhhhhhhhj">
<%k++;if(k==2)%>
	
	
	<% break;} %>
	</form>

</div>
</div>
</div>
</div>
<div class="pagination-bar">
<nav>
<ul class="pagination">
 

 <% 
int l=(Integer)(annonces.size()/3);
 int m=Integer.parseInt(request.getParameter("jhhhhhhhhj"));
for( int d=0;d<l;d++){     %>  
<li class="page-item"><a class="page-link active" href="<%="pagenation.jsp?page="+m%>"><%out.print(d); %></a></li>  <%} %> 

<%-- <li class="page-item"><a class="page-link" href="<%="GererAnnonce.jsp?page="+j%>">2</a></li>
<li class="page-item"><a class="page-link" href="#">3</a></li> --%>
<li class="page-item"><a class="page-link" href="#">Next</a></li>
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
<h3 class="footer-logo"><img src="assets/img/logo.png" alt=""></h3>
<div class="textwidget">
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lobortis tincidunt est, et euismod purus suscipit quis. Etiam euismod ornare elementum. Sed ex est, consectetur eget facilisis sed, auctor ut purus.</p>
</div>
</div>
</div>
<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 col-mb-12">
<div class="widget">
<h3 class="block-title">Latest Ads</h3>
<ul class="media-content-list">
<li>
<div class="media-left">
<img class="img-fluid" src="assets/img/art/img1.jpg" alt="">
<div class="overlay">
<span class="price">$ 79</span>
</div>
</div>
<div class="media-body">
<h4 class="post-title"><a href="ads-details.html">Brand New Macbook Pro</a></h4>
<span class="date">12 Jan 2018</span>
</div>
</li>
<li>
<div class="media-left">
<img class="img-fluid" src="assets/img/art/img2.jpg" alt="">
<div class="overlay">
<span class="price">$ 49</span>
</div>
</div>
<div class="media-body">
<h4 class="post-title"><a href="ads-details.html">Canon Photography Camera</a></h4>
<span class="date">28 Mar 2018</span>
</div>
 </li>
</ul>
</div>
</div>
<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 col-mb-12">
<div class="widget">
<h3 class="block-title">Help & Support</h3>
<ul class="menu">
<li><a href="#">Live Chat</a></li>
<li><a href="#">Privacy Policy</a></li>
<li><a href="#">Purchase Protection</a></li>
<li><a href="#">Support</a></li>
<li><a href="#">Contact us</a></li>
</ul>
</div>
</div>
<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 col-mb-12">
<div class="widget">
<h3 class="block-title">Subscribe us</h3>
<p class="text-sub">We have over 5 years of experience Our suppoer avalable to help you 24 hours a day, seven days week</p>
<form method="post" id="subscribe-form" name="subscribe-form" class="validate">
<div class="form-group is-empty">
<input type="email" value="" name="Email" class="form-control" id="EMAIL" placeholder="Email address" required="">
<button type="submit" name="subscribe" id="subscribes" class="btn btn-common sub-btn"><i class="lni-check-box"></i></button>
<div class="clearfix"></div>
</div>
</form>
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
<div class="float-right">
<ul class="bottom-card">
<li>
<a href="#"><img src="assets/img/footer/card1.jpg" alt="card"></a>
</li>
<li>
<a href="#"><img src="assets/img/footer/card2.jpg" alt="card"></a>
</li>
<li>
<a href="#"><img src="assets/img/footer/card3.jpg" alt="card"></a>
</li>
<li>
<a href="#"><img src="assets/img/footer/card4.jpg" alt="card"></a>
</li>
</ul>
</div>
</div>
</div>
</div>
</div>

</footer>


<a href="#" class="back-to-top">
<i class="lni-chevron-up"></i>
</a>

<div id="preloader">
<div class="loader" id="loader-1"></div>
</div>


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
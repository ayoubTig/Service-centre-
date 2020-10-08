<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="lni-user"></i> Mon Compte</a>
<div class="dropdown-menu">

<a class="dropdown-item" href="GererAnnonce.jsp"><i class="lni-home"></i> Mon profil</a>
<a class="dropdown-item" href="Deconnexion"><i class="lni-close"></i> Déconnexion</a>

</div>
</li>
</ul>
<a class="tg-btn" href="annoncee.jsp">
<i class="lni-pencil-alt"></i> Déposer annonce
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
<a>Mon Compte</a>
<ul class="dropdown">

<li><a href="login.html"><i class="lni-lock"></i> Se Connecter</a></li>
<li><a href="signup.html"><i class="lni-user"></i> Inscription</a></li>

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
<h2 class="product-title">Ajouter Annonce </h2>
<ol class="breadcrumb">
<li><a href="#">Accueil /</a></li>
<li class="current">Ajouter Annonce</li>
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
<%@ page import="java.util.List" %>
	<%@ page import="model.*" %>
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
<h4><% out.println(e.get(i).getPrenom()+"__"+idd);}}%></h4>
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
<a class="active" href="annoncee.jsp">
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
<h2 class="dashbord-title">Ajouter Annonce</h2>
</div>
<form action="FileUploadServlet" method="post" enctype="multipart/form-data">
 <%ArrayList<String> cate = new ArrayList<String>(); 
cate=annonce_func.selctCa();
%>
 <div class="form-group mb-3">
<select class="form-control input-md" name="cherch_categorie">
<%for(int ii=0;ii<cate.size();ii++){ %>
<option><% out.println(cate.get(ii));%></option><%} %>
</select></div>
 <div class="form-group mb-3">
<textarea class="form-control input-md" rows="5" cols="30" name="description"  ></textarea>
</div>
<div class="form-group mb-3">
<input type="text" name="title" placeholder="title" class="form-control input-md"></div>
<div class="form-group mb-3">
<select class="form-control input-md" name="type">
<option>Je me propose</option>
<option>Je cherche</option>
</select>
</div>
<div class="form-group mb-3">
<input type="number" name="price" placeholder="price" class="form-control input-md"></div>
<div class="form-group mb-3">
<input  value="<%=idd%>" type="number" name="ID_off" placeholder="idoff" class="form-control input-md" hidden ></div>
<div class="form-group mb-3">
<input type="file" name="some" ></div>
<div class="form-group mb-3">
<button class="btn btn-common log-btn">ajouter</button></td>

</form>
</div></div>
</body>
</html>
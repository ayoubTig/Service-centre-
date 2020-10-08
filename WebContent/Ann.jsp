<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<body>
 <script type="text/javascript">
 
 function autoSubmit() {
	    var formObject = document.forms['myForm'];
	    formObject.submit();
	}
 
 </script>
 <%@ page import="model.annonce_func" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.SQLException" %>
  <%	PrintWriter out1 = response.getWriter();
  String star[]=new String[6];
	 int cfg_min_stars=1;
	
 
		int ido=Integer.parseInt(request.getParameter("id_off"));	
	 if(session.getAttribute("Client")!=null){session.setAttribute("id_Client", session.getAttribute("Client") ); }else if(request.getSession().getAttribute("idcc")!=null){session.setAttribute("id_Client", session.getAttribute("idcc") );} 
			 
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
<a class="dropdown-item" href="Deconnexion"><i class="lni-close"></i> 1Déconnexion</a>
<%-- <%}else if(session.getAttribute("Client") != null){ %>
<a class="dropdown-item" href="Deconnexion"><i class="lni-lock"></i> 5Deconnexion</a> --%>


<%}else if(session.getAttribute("id_Client") != null){%>
	<a class="dropdown-item" href="Deconnexion"><i class="lni-lock"></i>Deconnexion</a>
	<%-- <% }else if(session.getAttribute("idcc") != null){%>
	<a class="dropdown-item" href="Deconnexion"><i class="lni-lock"></i> 3Deconnexion</a> --%>
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
<h2 class="product-title">Annonceur</h2>
<ol class="breadcrumb">
<li><a href="#"></a></li>
<li class="current"></li>
</ol>
</div>
</div>
</div>
</div>
</div>
<body>

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
ArrayList<offreur> e= new ArrayList<offreur>();
e=o.AllOffreur(); 
       
        
        	 for( i=0;i<e.size();i++){
        		if(ido==e.get(i).getId()){%>
<a href="#"><img src="img/<% out.println(e.get(i).getPhoto());%>" alt="" height="80" width="80"></a>
</figure>
<div class="usercontent">
<h3><% out.println(e.get(i).getNom());%></h3>
<h4><% out.println(e.get(i).getPrenom());%></h4>
</div>
</div>



<nav class="navdashboard">
<ul>

<li>Avis :
<img alt="" src="<%=star[1]%>" width="30">
<img alt="" src="<%=star[2]%>" width="30">
<img alt="" src="<%=star[3]%>" width="30">
 <img alt="" src="<%=star[4]%>" width="30">  
<img alt="" src="<%=star[5]%>" width="30">

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

<% int idc=0;
if(request.getSession().getAttribute("id_Client")!=null ){
	try {
idc = (Integer)request.getSession().getAttribute("id_Client"); } catch(Exception ea){}
	/*if(idc==0){ idc=(Integer)request.getSession().getAttribute("idcc"); } else if(idc==0){ idc=(Integer)request.getSession().getAttribute("Client"); }  */ %>
<form method="get" action="ratingStar" id="myForm">
 <input hidden type=number name="id_off" value="<%=request.getParameter("id_off")%>">
   
    <input  hidden type="number" name="id_client" value="<%= idc %>"> 
    
    

 
     Donner un avis:<br>
    <fieldset class="rating">
 
    <input type="radio" id="star5" name="rating" value="5.0" onChange="autoSubmit();" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
    <input type="radio" id="star4half" name="rating" value="4.5"  onChange="autoSubmit();"/><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
    <input type="radio" id="star4" name="rating" value="4.0"   onChange="autoSubmit();"/><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    <input type="radio" id="star3half" name="rating" value="3.5"  onChange="autoSubmit();" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
    <input type="radio" id="star3" name="rating" value="3.0"   onChange="autoSubmit();"/><label class = "full" for="star3" title="Meh - 3 stars"></label>
    <input type="radio" id="star2half" name="rating" value="2.5"  onChange="autoSubmit();"/><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
    <input type="radio" id="star2" name="rating" value="2.0"   onChange="autoSubmit();" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
    <input type="radio" id="star1half" name="rating" value="1.5"   onChange="autoSubmit();"/><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
    <input type="radio" id="star1" name="rating" value="1.0"   onChange="autoSubmit();"/><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
    <input type="radio" id="starhalf" name="rating" value="0.5"  onChange="autoSubmit();"/><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
    
    
  
</fieldset> 
<!--   <input type="submit" name="submit" value="submit">  -->
   
  </form>
</div><%}else {%><p><% /* request.getSession().setAttribute("id_off",request.getParameter("id_off")); */ %>Pour evaluer l'annonceur il faut se connecter ou s'inscrire si vous n'avez pas de compte

<%String url="loginO1.jsp?id_off="+request.getParameter("id_off"); %><br>
<a href=<%=url %>> faire l'iscription ou l'authentification ici</a>
<%}%>
		<br><br>
<table class="table table-responsive dashboardtable tablemyads">
<tr><td>
Sexe:</td><td><%out.println(e.get(i).getGenre());%></td></tr>


<tr><td>
numéro de telephone</td><td><%out.println(e.get(i).getPhone());%></td></tr>
<tr><td>
E-mail</td><td><%out.println(e.get(i).getEmail());%></td></tr>

<tr><td>
Ville:</td><td><%out.println(e.get(i).getVille());%></td></tr>

<tr><td>
Categorie:</td><td><%out.println(e.get(i).getService());%></td></tr>
<tr><td>
Descreption:</td><td><%out.println(e.get(i).getDescreption());}}%></td></tr>

</table>         


</body>
</html>
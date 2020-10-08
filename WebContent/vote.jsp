<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

    <style>
 @import "./assets/font-awesome-4.7.0/css/font-awesome.css";


fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; }
h1 { font-size: 1.5em; margin: 10px; }

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
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
 <script type="text/javascript">
 
 function autoSubmit() {
	    var formObject = document.forms['myForm'];
	    formObject.submit();
	}
 
 </script>
  
<%@ page import="model.annonce_func" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.SQLException" %>

<form method="get" action="ratingStar" id="myForm">
  <label>id offreur:</label><input type=text name="id_off" value="">
   <label>id client:</label>
    <input type="text" name="id_client" value=""> 
    
    

 
     
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

    <%	PrintWriter out1 = response.getWriter();
	
	 int cfg_min_stars=1;
			int idoff=0;
			
					if(request.getParameter("id_off")==null){
						
						idoff=18;
						
					}else{
						idoff=Integer.parseInt(request.getParameter("id_off"));	
						
					}
			 
	 int cfg_max_stars=5;
		 
	 double temp_stars=0;
	try {
		
		temp_stars = annonce_func.selction_moyene(idoff);
			//	selction_moyene(idoff);
		System.out.println("nnnnnnnnnnnnn"+temp_stars);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 for(int i=cfg_min_stars; i<=cfg_max_stars; i++) {
		 
		 
		 if ( temp_stars >= 1) { // it going to check if your average rating is greater than equal to 1 or not if it is then it give you full star.
		    out1.println("<img src='./img/Star (Full).png' width='40'/>");
		      temp_stars--; //after getting full star it decremnt the value and contiune the loop.
		    }else {
		      if ( temp_stars >= 0.5 ) { // if user select 3.5 rating, so in above condition at last it remain 0.5 rating will get left. then it came to this condition and give you the half star.
		    	  out1.println("<img src='./img/Star (Half Full).png' width='40'/>");
		         temp_stars -= 0.5;
		      }else { // at last but not the least when value gets zero then it return empty star.
		    	  out1.println("<img src='./img/Star (Empty).png' width='40'/>");
		      }
		    }
		 
	 } %>
  
</body>
</html>
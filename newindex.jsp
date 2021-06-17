<%@ page contentType="text/html"  pageEncoding="UTF-8" %>
        
<%@ page import = "java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
 <head>
 	<title>fitness website</title>
 	<script>
function setCookie(cname,cvalue,exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  var expires = "expires=" + d.toGMTString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

function checkCookie() {
  var user=getCookie("username");
  if (user != "") {
    alert("Welcome again " + user + " to our website");
  } else {
     user = prompt("Please enter your name:","");
     if (user != "" && user != null) {
       setCookie("username", user, 30);
     }
  }
}
</script>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: red;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}
body {
	background-color:darkgray;
}
.div1 {
  background-color: lightgrey;
  width: 300px;
  border: 15px solid red;
  padding: 50px;
  margin: 20px;
}
* {box-sizing: border-box;}

.container {
  position: relative;
  width: 50%;
  max-width: 300px;
}

.image {
  display: block;
  width: 100%;
  height: auto;
}

.overlay {
  position: absolute; 
  bottom: 0; 
  background: rgb(0, 0, 0);
  background: rgba(0, 0, 0, 0.5); /* Black see-through */
  color: #f1f1f1; 
  width: 100%;
  transition: .5s ease;
  opacity:0;
  color: white;
  font-size: 20px;
  padding: 20px;
  text-align: center;
}

.container:hover .overlay {
  opacity: 1;
}
h1 {
  color: white;
  text-shadow: 1px 1px 2px black, 0 0 25px red, 0 0 5px darkred;
}
</style>
   </head>

<body  border = "1"  text="black" onload="checkCookie()">
<script> 
			if(session.getAttribute("counted")== null)
	 			session.setAttribute("counted", "none");
	 		System.out.println(session.getAttribute("counted"));
	 		if(application.getAttribute("siteCounter")==null)
	 			application.setAttribute("siteCounter", 0);
	 		System.out.println(application.getAttribute("siteCounter"));

	 		if(session.getAttribute("counted")!= null && session.getAttribute("counted")== "none")
	 			{
	 				Integer siteCounter =(Integer)
	 			application.getAttribute("siteCounter");
	 				siteCounter+=1;
	 				application.setAttribute("siteCounter", siteCounter);
	 				session.setAttribute("counted", "exist");
	 			}
</script>

<div align="right">
<p id="demo"></p>
<script>
var myVar = setInterval(myTimer ,1000);
function myTimer() {
  var d = new Date();
  document.getElementById("demo").innerHTML = d.toLocaleTimeString();
}
</script>
</div>
  		 <table>
  		 	<tr>
  		 		<td>מספר המבקרים באתר:<%=(Integer)application.getAttribute("siteCounter") %></td>
  		 	</tr>
  		
  		 </table>
  	     <div align="center">
  		 <img src="maorfitness.png" style="width:250px;height:250px;" />
  		  </div>
  		  <center>
<div align="center">
<% 

System.out.println(session.getAttribute("gender"));

if (session.getAttribute("Status") != null) 
{
	if (session.getAttribute("gender").equals ("male"))
    out.print("<b><h1>welcome Mr.  " +session.getAttribute("Name")+",to fitness site</h1></b>"); 
	else
		out.print("<b><h1>welcome Mrs.  " +session.getAttribute("Name")+" ,to fitness site</h1></b>"); 
	
}
else
	out.print("<b><h1>welcome to fitness site </h1></b>");
 out.print("<br />");
 %>

<table>
	<form
	action="logOut.jsp">
<tr>
    		<td><input type="submit" value="LogOut" /></td>
  	      </tr>
	</form>
</table>
</center>
<br/>
<center>
<ul>
<li><a href="newindex.jsp">Home page</a></li>
<li><a href="form11.html">Register</a></li>
<li><a href="form02.html">connecting</a></li>
</ul>
<br></br>
<% 
if (session.getAttribute("Status")!= null &&  session.getAttribute("Status") == "admin")
{
	   	
	response.sendRedirect("newindex13.jsp");
} 
%>
<% 
if (session.getAttribute("Status")!= null &&  session.getAttribute("Status") == "user")
{
	
	response.sendRedirect("newindex14.jsp");
}
%>
<div class="div1" align="center">
 <h2>קצת עלינו</h2>
 <h3>אתר זה נועד לעזור לאנשים אשר רוצים להגיע ליעד מסוים הן בירידה במשקל והן בעלייה במסת השריר </h3>

<%
if (session.getAttribute("Status")== null)
{

	out.print("</div>");
out.print("<br></br>");
	out.print("<h1>סוגי מנויים</h1>");
	out.print("<br></br>");
	out.print("<table align='center'>");
	out.print("<tr>");
	out.print("<td>");
	out.print("<div class='container'>");
	out.print("<img src='mj.jpg' alt='Avatar' class='image'>");
	  out.print("<div class='overlay'>מנוי שנתי 2400 שקלים</div>");
	  out.print("</div>");
	out.print("</td>");
	out.print("<td>");
	out.print("<div class='container'>");
	out.print("<img src='mj.jpg' alt='Avatar' class='image'>");
	  out.print("<div class='overlay'>מנוי קיץ 1600 שקלים</div>");
	  out.print("</div>");
	out.print("</td>");
	out.print("<td>");
	out.print("<div class='container'>");
	out.print("<img src='mj.jpg' alt='Avatar' class='image'>");
	  out.print("<div class='overlay'>מנוי חודשי 180 שקלים</div>");
	  out.print("</div>");
	  out.print("</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<td>מנוי שנתי</td>");
	out.print("<td>מנוי קיץ</td>");
	out.print("<td>מנוי חודשי</td>");
	out.print("</tr>");
	out.print("</table>");
}
	 %>
 

</center>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</div>
</body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*"%>
<%    
		      session.setAttribute("Status", null);						  	
			  session.setAttribute("Name",null);
	 		  session.setAttribute("e_mail", null);
	 		  session.setAttribute("fname" , null );
			  session.setAttribute("year" , null);
			  session.setAttribute("gender", null);
		 	  session.setAttribute("counted", "none");
		 	  response.sendRedirect("form02.html");
%> 
		
	
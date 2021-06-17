<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import = "java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="rtl">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>Insert title here</title>
	</head>
	<body bgcolor="darkgray" text="black">
	
	<% 
	System.out.println(session.getAttribute("Status"));
	session.setAttribute("Status", "admin");
	if (session.getAttribute("Status")!= "admin") 
	                response.sendRedirect("form.html");
    %>	

<% 
//בכדי שיראו עיברית
	request.setCharacterEncoding("windows-1255");
	response.setCharacterEncoding("windows-1255");
//בכדי שיראו עיברית
%>

    	<div align="center">
      		<font size="5">
       		הצגת כל מסד הנתונים    
      		</font>
      		<hr width="60%"/>      
<%		 	 
		 													// the first time the page is sent to the user
		 													// the SUBMIT button was not pressed yet.		 												
			if(request.getParameter("submit2") == null )	//it means that the form is seen the first time
		 	{
				  System.out.println("form" + request.getParameter("submit2"));
 %>
      		<form name="detailsForm" 
           		  action="page6-VieAllMembersReverse.jsp"
                  method="get">  
        		<br />
        		<input type="submit" value="לחץ להצגת כל הרשומים" name="submit2"/>
      		</form>
 <%
		 	}
			else  // connect to db
			{
				String  result [][]= null;
				try 
		  		{
					System.out.println("form" + request.getParameter("try"));
		  			// שלב א: טעינת המתפעל - דרייבר
					Class.forName("com.mysql.jdbc.Driver").newInstance();	
		  		
		  		
					//שלב ב:חיבור למסד הנתונים
					Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dt1","root","");
					
		  		
					//שלב ג: יצירת עצם הסטיטמנט "שידבר" עם מסד הנתונים, כמו מזכירה של בוס
					Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
			                						   ResultSet.CONCUR_UPDATABLE);
					
					// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרזלטסט
					
					
					//שלב ד: יצירת שאילתה עבור מסד הנתונים
					String mySQL = "SELECT * FROM tbdb6 " ;
			  		
					
					//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים
			  		ResultSet oRS = st.executeQuery(mySQL);				
					
			  		//=====================סוף ההתחברות למסד הנתונים======================
			  		
			  		int numColumns = oRS.getMetaData().getColumnCount();
	 	
	 				oRS.last();				
	 				int numRows = oRS.getRow();
	 	
	 				result = new String[numRows][numColumns];	
	 		
	 				oRS.beforeFirst();
	 				int i = 0;
	 				while (oRS.next())
	 				{
	 					for(int j = 0; j < numColumns; j++ )
	 						result[i][j]=oRS.getString(j+1);				
	 					i++;
	 				}		
	 		
	 				oRS.close();	
	 				st.close();	
	 		
	 			} 
	 	 		catch (Exception e) 
	 			{	  			
	 				//e.printStackTrace();
	 				System.out.println("1- Error in connecting");
	 	
	 			} //======================= the connection is closed

	 			if(result.length==0)
		     	{	
		     		out.print("<center><h3>");
		    	 	out.print("מסד הנתונים ריק ");		    	 		     		
		     		out.print("</center>");
		     	}
	 			else
	 			{
	 				
	 				out.print( "<br /><br /><h3>" );
	 				out.print( "מספר הרשומים במסד הנתונים הוא " + result.length );
	 				out.print( "</h3><br />" );
	 				out.print( "<table border='1' cellpadding='4'>");
	 					out.print("<tr bgcolor='red'>");
	 						out.print("<td>"); 							
	 						    out.print("שם פרטי");
 							out.print("</td>");
	 						out.print("<td>");
	 		   		       		out.print("שם משפחה");
	 		   		    	out.print("</td>");
	 		   		    	out.print("<td>");
		   		    			out.print("מייל");
		   		    		out.print("</td>");
	 		   		    	out.print("<td>");
	 		   		    		out.print("יום");
	 		   		    	out.print("</td>");
	 		   		        out.print("<td>");
		   		    	    	out.print("חודש");
		   		    	    out.print("</td>");
		   		    	    out.print("<td>");
		   		    	    	out.print("שנה");
		   		    	     out.print("</td>");
 		   		    		out.print("<td>");
	   		    				out.print("מין");
	   		    			out.print("</td>");
	   		    			out.print("<td>");
	   		    			    out.print("סיסמה");
	   		    			out.print("</td>");
	   		    			out.print("<td>");
	   		    			    out.print("שנים שאתה מתאמן");
	   		    			out.print("</td>");
	   		    			out.print("<td>");
	   		    			    out.print("האם מנהל?");
	   		    			out.print("</td>");
	 		   		    out.print("</tr>");
	 		   		for(int row = result.length-1; row >= 0 ; row--)
	  				{
	     				out.println("<tr>");
	     				
	     				for (int col=0; col<result[row].length; col++)
	     				{
		 					out.print("<td>"+result[row][col]+"</td>");
	     				}
	     				
	     				//out.print("<td>"+result[row][1]+"</td>");	// fname
	     				//out.print("<td>"+result[row][2]+"</td>");	// lname
	     				//out.print("<td>"+result[row][4]+"</td>");	// bYeear
	     				//out.print("<td>"+result[row][3]+"</td>");	// email
	     				
	     				out.println("</tr>");
	  				}// end for
	  				
	  	 			out.print("</table>");
	  	 			
	 			}// end else
			}// end connect to db
 %>     		
      		
      		
    	</div>
    	
    	
  </body>
</html>

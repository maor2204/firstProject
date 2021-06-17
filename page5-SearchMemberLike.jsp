<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import = "java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="rtl">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>Insert title here</title>
	</head>
	<body bgcolor="darkgray" text-color="red">	
<%  if (session.getAttribute("Status")!= "admin") 
	response.sendRedirect("newindex.jsp");
%>
<% 
//בכדי שיראו עיברית
	request.setCharacterEncoding("windows-1255");
	response.setCharacterEncoding("windows-1255");
//בכדי שיראו עיברית
%>
    	<div align="center">
      		<font size="5">
       		 חיפוש רשומים במסד הנתונים לפי שם משפחה מלא או חלקי 
      		</font>
      		<hr width="60%"/>      
<%		 	 
		 														 												
			if(request.getParameter("submit1") == null )	
		 	{
 %>
      		<form name="detailsForm" 
           		  action="page5-SearchMemberLike.jsp"
                  method="post">
       		 שם משפחה או חלק ממנו	:
        		<input type="text" name="lname" />
        		<br />
        		<input type="submit" value="חפש" name="submit1"/>
      		</form>
 <%
		 	}
			else  // connect to db
			{
				String  result [][]= null;
				try 
		  		{
		  			// שלב א: טעינת המתפעל - דרייבר
					Class.forName("com.mysql.jdbc.Driver").newInstance();	
		  		
		  		
					//שלב ב:חיבור למסד הנתונים
					Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dt1","root","");
					
		  		
					//שלב ג: יצירת עצם הסטיטמנט "שידבר" עם מסד הנתונים, כמו מזכירה של בוס
					Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
			                						   ResultSet.CONCUR_UPDATABLE);
					
					// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרזלטסט
					
					
					//שלב ד: יצירת שאילתה עבור מסד הנתונים
					String mySQL = "SELECT * FROM tbdb6  WHERE lname LIKE '%" + request.getParameter("lname") +"%'";
			  		System.out.println("mySQL ="+ mySQL);
					
			  		
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
	 				System.out.println("1- Error in connecting");
	 	
	 			} //======================= the connection is closed

	 			if(result.length==0)
		     	{	
		     		out.print("<center><h3>");
		    	 	out.print("לא נמצא משתמש עם שם זה ");
		    	 	out.print("</h3><br />");
		     		out.print("<a href='page5-SearchMemberLike.jsp'>חפש שוב</a> ");
		     		out.print("</center>");
		     	}
	 			else
	 			{
	 				out.print( "להלן תוצאות החיפוש");
	 				out.print( "<br />" );

	 				out.print( "<table border='1' cellpadding='4'>");
	 					out.print("<tr bgcolor='red'>");
	 						out.print("<td>");
	 							out.print("שם משפחה");
	 						out.print("</td>");
	 						out.print("<td>");
	 		   		       		out.print("מייל");
	 		   		    	out.print("</td>");
	 		   		    	out.print("<td>");
	 		   		    		out.print(" מגדר");
	 		   		    	out.print("</td>");
	 		   		    	out.print("<td>");
	 		   		    		out.print("שנת לידה");
	 		   		    	out.print("</td>");
	 		   		    out.print("</tr>");
	 		   		for(int row=0;row<result.length;row++)
	  				{
	     				out.println("<tr>");
	     				
	     				//for (int col=0; col<result[row].length; col++)
	     				//{
		 				//	out.print("<td>"+result[row][col]+"</td>");
	     				//}
	     				
	     				out.print("<td>"+result[row][1]+"</td>");	// lname
	     				out.print("<td>"+result[row][2]+"</td>");	//email
	     				out.print("<td>"+result[row][6]+"</td>");	// bYeear
	     				out.print("<td>"+result[row][5]+"</td>");	// gende
	     				out.println("</tr>");
	  				}// end for
	  	 			out.print("</table>");
	  	 			out.print("<br /><br />");
	  	 			out.print("<br />");
	 				
	  	 			out.print("<a href='page5-SearchMemberLike.jsp'>חיפוש נוסף</a> ");
	 			}// end else some one was found
			}// end connect to db
 %>     		
      	<br />	
      	<h3><a href="page6-VieAllMembersReverse.jsp">Next</a></h3>	
    	</div>
    	
    	
  </body>
</html>

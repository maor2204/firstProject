<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>הצג את כל החברים במסד הנתונים</title>
		
		<style>
input[type=text], select {
  width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=password], select {
  width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 50%;
  background-color: red;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: black;
}

input[type=reset]:hover {
  background-color:black;
}

input[type=reset] {
  width: 50%;
  background-color: red;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

div {
  border-radius: 5px;
  background-color:darkgray;
  padding: 12px;
}

</style>
	</head>
	<body bgcolor="darkgray">
//     session   אישור כניסה לדף זה ניתן למנהל בלבד, אנו נעזרים בעצם  	
<%  if (session.getAttribute("Status")!= "admin") 
	response.sendRedirect("newindex.jsp");
%>
		
		
		<center>
			<h1><font color='black'>?לפניך רשימת החברים באתר, את מי תרצה לעדכן </font></h1>
                            //***בבניית כותרות הטבלה, יש לשנות את הכותרות לפי מסד הנתונים שלכם
     <%            
	 			
	 				
	 					out.print( "<br /><br /><h3>" );
	 					out.print( " " );
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
		   		    	out.print(" מין");
		   		    	out.print("</td>");
		   		    	out.print("<td>");
	 		   			out.print("סיסמא ");
	 		   			out.print("</td>");
	 		   		    out.print("<td>");
		   		    	out.print("שנים שתאמן");
		   		    	out.print("</td>");
		   		    	out.print("<td>");
 		   		    	out.print("האם מנהל ?");
 		   		    	out.print("</td>");
	 		   		out.print("</tr>");
	%> 		   		
//*****************************************************התחברות למסד הנתונים****************
    	     
	<%
		  		try 
	  		{
	  			// שלב א: טעינת המתפעל - דרייבר
				Class.forName("com.mysql.jdbc.Driver").newInstance();	
	  		
	  		
				 //   שלב ב:חיבור למסד הנתונים
                                                     //    בשם מסד הנתונים שלכם koren חייבים להחליף את המילה      
                                                     Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dt1","root","");
					  		
				//שלב ג: יצירת עצם הסטיטמנט "שידבר" עם מסד הנתונים, כמו מזכירה של בוס
				Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		                						   ResultSet.CONCUR_UPDATABLE);
				
				// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרזלטסט
				
				
				//שלב ד: יצירת שאילתה עבור מסד הנתונים
				String mySQL = "SELECT * FROM tbdb6";
		  		
				
				//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים
		  		ResultSet oRS = st.executeQuery(mySQL);				
				
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  		//numColumns  שמירת מספר העמודות שהתקבלו מהשאילתא למשתנה  
		  		//oRS.getString(i)  לולאת הכל עוד בונה לנו טבלה שערכיה  הם   ערכי מסד הנתונים  ההוראה לשלופת הנתונים היא 
                                                    int numColumns = oRS.getMetaData().getColumnCount();
		  		oRS.beforeFirst();
				while (oRS.next() )
					{
					    out.print("<tr>");
				 	    for (int i = 1; i <= numColumns; i++ )
				 	    {
					         out.print( "<td>"+oRS.getString(i)+"</td>");
				 	    }	
				 	   out.print("</tr>");
					}	
				
				oRS.close();
				st.close();
				
			} 
	  		catch (Exception e) 
	  		{
	  			
				System.out.println("Error in connecting-1");
				
			} // the connection is closed	  		
		%>
			</table>
			<br /><br />
			<form method="get" action="page2-connect-to-DB-FindUser-create-Session.jsp">
				<h3><font color='red'> 
            	                                               הקלד דוא"ל של משתמש אותו תרצה לעדכן
				</font></h3>
				<input type="text" name="e_mail" size="20" />
				<br /><br />
                          	             <input type="submit" value="עדכן" name="Usend"/>            
        	                          </form>	
        	
        	<form method="get" action="page4-doDelete.jsp">
				<h3><font color='red'> 
            	 הקלד דוא"ל של משתמש אותו תרצה למחוק
				</font></h3>
				<input type="text" name="deleteEmail" size="20" />
				<br /><br />
            	<input type="submit" value="מחק" name="Dsend"/>            
        	</form>	
		</center>
<script>
 else 
{
	out.print(alret("לא ניתן לגשת לדף")); 
	
}
</script> 
 <script>
 response.sendRedirect("page2-connect-to-DB-FindUser-create-Session.jsp");
 </script>
		
	</body>
</html>

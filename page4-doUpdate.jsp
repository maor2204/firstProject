<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>		
		<title>Insert title here</title>
	</head>
	<body bgcolor="LightBlue">
<%
// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
// בכדי שיראו עיברית

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
				System.out.println(request.getParameter("e_mail")+   ")555555555)) " +request.getParameter("e_mail") );
				
				//שלב ד: יצירת שאילתה עבור מסד הנתונים
				//String mySQL = "UPDATE TBsolomon SET fname='" + request.getParameter("fname") + "', lname='"+ request.getParameter("lname") + "'  WHERE email ='" + request.getParameter("e_mail")  + "'";
																																						
		     	String mySQL = "UPDATE tbdb6 SET fname='" + request.getParameter("fname") + "', lname='"+ request.getParameter("lname") + "', year='"+ request.getParameter("year") + "'  WHERE e_mail ='" + request.getParameter("e_mail") +"';" ;
		//		String mySQL = "UPDATE tUsers SET fldName='" + request.getParameter("fName") + "', fldLastName='"+ request.getParameter("lName") + "', fldGender='"+ request.getParameter("gender") + "', fldAge='" + request.getParameter("age") + "', fldAdmin='" + request.getParameter("admin") + "'    WHERE ID =" + request.getParameter("id");				
				System.out.println("mySQL=" + mySQL);
				System.out.println("year=" + request.getParameter("year"));
				
				//שלב ה: עדכון מסד הנתונים
		  		int n = st.executeUpdate(mySQL);	// מכיל את מספר הרשומות שהושפעו מהפעלת השאילתה n המשתנה  				
				
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  				  						
				//oRS.close();	- במקרה זה לא יוצרים רזלטסט
				st.close();
				con.close();
				
			} 
	  		catch (Exception e) 
	  		{
	  			
				//e.printStackTrace();
				System.out.println("page4-Error in connecting");
				
			} // the connection is closed	  		
	  		
	  		
			
			response.sendRedirect("page1-View-AllMembers-Choose-to-Update.jsp");
	  	%>
    	
    </body>
</html>






<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>update</title>
	</head>
	<body bgcolor="LightSteelBlue" text="Teal">
<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
		// 
		  if (session.getAttribute("Status")!= "admin") 
				response.sendRedirect("newindex.jsp");
%>	
		<center>
			<br /><br />
		<%
            boolean userFound = false;	// איתחול המשתנה הבוליאני
		
            if (request.getParameter("Usend") != null)
            {
                String e_mail = request.getParameter("e_mail");
                System.out.println(e_mail);
                
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
    				String mySQL = "SELECT * FROM tbdb6 WHERE e_mail ='" + e_mail + "'";
    		  		
    				
    				//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים
    		  		ResultSet oRS = st.executeQuery(mySQL);				
    				
    		  		//=====================סוף ההתחברות למסד הנתונים======================
    		  		
                	oRS.last();		// המצביע מצביע על הרשומה האחרונה שעונה על הדרישה		
									// יתכן ויהיו כמה אנשים עם דואר אלקטרוני זהה ופעולת העידכון תעדכן את כולם
    		  		
					int numRows = oRS.getRow();
    		  		
					System.out.println("numRows = " + numRows);
				
					if (numRows > 0)	// במידה ומספר השורות גדול מ - 1 סימן שיש משתמש רשום שנרצה לעדכן. ייתכן ויש יותר מאחד
						{
							userFound = true;
						}
    		  		
    		  		//====================================================================
                	
    		  		//   השורות הבאות בודקות גם כן האם קיימות רשומות בריזלטסט, כלומר יש משתמש או משתמשים
    		  		//  oRS.next():כאן בודקים האם ניתן לעבור לשורה הבאה על ידי הפעולה  
    		  		//  פעולה זו אפשרית אך ורק אם הריזלטסט איננו ריק
    		  		
    		  		//if (oRS != null && oRS.next()) 
    		  	      //{   
                        // userFound = true;
                  	  //}
    		  		//====================================================================
    		  			
    		  		System.out.println("yyyyyyyyyy"  + userFound );
    		  		if (userFound) 
    		  		{
    		  			
                      	 session.setAttribute( "fname"    , oRS.getString("fname"));
               			 session.setAttribute( "lname"    , oRS.getString("lname") );
                         session.setAttribute( "e_mail"    , oRS.getString("e_mail") );
                         session.setAttribute( "day"   , oRS.getString("day") );
                         session.setAttribute( "month"   , oRS.getString("month") );
                         session.setAttribute( "year"   , oRS.getString("year") );
                         session.setAttribute( "gender"   , oRS.getString("gender") );                                                                          
                         session.setAttribute( "password", oRS.getString("password") );
                         session.setAttribute( "yot", oRS.getString("yot") );
                         System.out.println("session(lname)=" + session.getAttribute("lname"));
                         System.out.println("session(fname)=" + session.getAttribute("fname"));
                         System.out.println("session(email)=" + session.getAttribute("e_mail"));
                         System.out.println("session(gender)=" + session.getAttribute("gender"));
                         
                       	
                    }
                  	else 
                  	{
                  	  
                	  out.print("<h2>");
                      out.print("User was not found") ;
                      out.print("</h2>");
                  	}
                 	st.close();
                  	con.close();
              	}
             	catch (SQLException ex) 
             	{
              		System.out.println("SQLException: " + ex.getMessage());              		
                    System.out.println("SQLState: " + ex.getSQLState());
          		}
        	} 
            System.out.println("jfgjy");
            response.sendRedirect("page3-view-In-Form-and-Update3.jsp");
          // response.sendRedirect("newindex.jsp");
        	
      	%>     
        <br /> <br />
		<a href="page1-View-AllMembers-Choose-to-Update.jsp">Return to view all Members</a>
		</center> 
    </body>
</html>
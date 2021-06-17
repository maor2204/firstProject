<%@ page contentType="text/html"  pageEncoding="UTF-8" %>
        
<%@ page import = "java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%    System.out.print("ilan1");
       	String e_mail = request.getParameter("email1");
	  	String password  = request.getParameter("password1");	  		
	  	System.out.println(e_mail + "*********   " + password);
	// 	if ((e_mail != null)&&(password != null))
	  //	   {
             try 
	  	      {
	  	       // שלב א: טעינת המתפעל - דרייבר
		      Class.forName("com.mysql.jdbc.Driver").newInstance();	
		      //שלב ב:חיבור למסד הנתונים
		      Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dt1","root","");
		      //שלב ב:חיבור למסד הנתונים
		      Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		      // Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרקורדסט
		      //שלב ד: יצירת שאילתה עבור מסד הנתונים
		     String mySQL = "SELECT * FROM tbdb6 WHERE e_mail = '" + e_mail + "' AND password ='" + password + "';" ;
             		     // mySQL = "SELECT * FROM TBsolomon WHERE e_mail = 'edna@ronen.com' AND Pwd ='333333'" ;
		     //שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים
		     System.out.println(mySQL);
		     ResultSet oRS = st.executeQuery(mySQL);				
				
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  		
		  		
		      session.setAttribute("Status", "Notuser");			
		      oRS.last();				
		      int numRows = oRS.getRow();
		      System.out.println("numRows = " + numRows + "   "  + oRS.getString("admin"));
		      if (numRows > 0)
				{
				  oRS.beforeFirst();
                  oRS.next();		  		  		
				  
				  System.out.println("no. = "+ oRS.getRow()+  "   e_mail = " + oRS.getString("e_mail")+ "    password= "+ oRS.getString("password"));
				  session.setAttribute("Status", "user");
				  	
				  session.setAttribute("Name", oRS.getString("fname") + " " + oRS.getString("lname"));
	 			  session.setAttribute("mail", e_mail);
	 			  session.setAttribute("fName" , oRS.getString("fname") );
				  session.setAttribute("year" , oRS.getString("year"));
			      session.setAttribute("gender", oRS.getString("gender"));
		 			session.setAttribute("counted", "none");

				}
						
									
	 //  oRS.last();
       session.setAttribute("ADMIN", "NotOk");			
	   String ans="YES";
	   if ( ans.equals(oRS.getString("admin")))
	      {

		   
		    session.setAttribute("Status", "admin");
	     	System.out.print(session.getAttribute("Status")+ "in the if admin");
	       }
	   else
	 	   System.out.print(session.getAttribute("Status")+ "out off the if admin");
				
	   oRS.close();
	   st.close();
	  }
	   catch (Exception e) 
	  		{
	  		    System.out.print	("error in connection");
				e.printStackTrace();
				
			} // the connection is closed	  		
			
	  		
System.out.println("  "  + session.getAttribute("Status"));			
if (session.getAttribute("Status")==("admin"))
		
  //  if ( session.getAttribute("Status").equals("admin") ) 
 	 // System.out.print("admin *********");
 		response.sendRedirect ("newindex.jsp");
 	else 
 		if (session.getAttribute("Status")==("user"))

          // if (session.getAttribute("Status").equals("user"))
        	  // System.out.print("user *********");
                   	response.sendRedirect ("newindex.jsp");
	       else
	             response.sendRedirect ("form2.html");
	    	     //   System.out.print("not a user ******");
    
	  		
			
	%> 
		
	
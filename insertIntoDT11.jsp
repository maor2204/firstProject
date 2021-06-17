<%@ page contentType="text/html"  pageEncoding="UTF-8" %>
        
<%@ page import = "java.sql.*" %>

<%
	String fname = request.getParameter("fname");
	System.out.println(fname);
	String lname = request.getParameter("lname");
	System.out.println(lname);
	String e_mail = request.getParameter("e_mail");
	System.out.println(e_mail);
	String day = request.getParameter("day");
	System.out.println(day);
	String month = request.getParameter("month");
	System.out.println(month);
	String year = request.getParameter("year");
	System.out.println(year);
      String gender = request.getParameter("gender");
	System.out.println(gender);
      String password = request.getParameter("password");
	System.out.println(password);
      String yot = request.getParameter("yot");
	System.out.println(yot);




	boolean member_added = false;

	try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			 Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dt1","root",""); 
			 Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			System.out.println("first" +fname + "  " +lname + "   " + e_mail + "   " + day +  "  " +month  + " " +  "  " +year + "   " + "  " +gender+ "  " +password+ "  " + "  " +yot);
			String SelectUser = "SELECT * FROM tbdb6 WHERE e_mail = '" + e_mail + "'";
       			System.out.println(SelectUser);
			ResultSet oRS = st.executeQuery(SelectUser);
 			System.out.println("second" +fname + "  " +lname + "   " + e_mail + "   " + day +  "  " +month  + " " +  "  " +year + "    " + "  " +gender+ "  " +password+ "  " + "  " +yot);
 			oRS.beforeFirst();
			if (oRS.next())
				System.out.println("there is a user like that");
 			else 
 			    {
 				String insert1 = "insert into tbdb6 VALUES('" + fname  + "','" + lname + "','" +e_mail + "'," +day + "," +month + "," +year + ",'" +gender+ "','" +password+ "','" +yot+"','NO');";
 				System.out.println(fname + " *****" + insert1);
 				int inserts = st.executeUpdate(insert1);
 				
 		     
 	    		if(inserts == 1) 
 		       		{ // log in the new user
 						member_added = true;
 						session.setAttribute("Status", "user");
 						session.setAttribute("Name", fname + " " +lname);
 						session.setAttribute("email", e_mail);
 						session.setAttribute("fname",fname);
 						session.setAttribute("lname",lname);
 						//session.setAttribute("fname" , oRS.getString("fname") );
 						//session.setAttribute("lname" , oRS.getString("lname") );
						session.setAttribute("gender", gender);
						session.setAttribute("year", year);
 			
 	       		    }
 			    }
		
		oRS.close();
		st.close();
		con.close();
		
	}
	catch (Exception e) {
 		e.printStackTrace();
		System.out.println("error");
		System.out.println("catch" +fname + "  " +lname + "   " + e_mail + "   " + day +  "  " +month  + " " +  "  " +year + "    " + "  " +gender+ "  " +password+ "  " + "  " +yot+",'No'");
 	} 
	response.sendRedirect("newindex.jsp");

%>

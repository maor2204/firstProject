<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
    <%@ page import = "java.time.YearMonth"%>
    
<%@ page import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		
		
		<style>
	   		span {color:yellow;
		 	font-size:16pt;}
     	</style>
     	<title>onsubmit() onreset()</title>     

     	<script language="javascript">
    
       		function valid(Ufrm)
         	{  
				if (Ufrm.fname.value == "")                 	{
	     			alert("Type in the first name");
	     			Ufrm.fname.focus();
	     			return false; 
				}
				if (Ufrm.lname.value == "")   
                  {
	     			alert("Type in the last name");
	     			Ufrm.lname.focus();
	     			return false; 
	 			  }

	 			  
	 			 
				  if (theForm.e_mail.value == "")   
                   {
	     		  	alert("Type in the e-mail");
	     		   	Ufrm.e_mail.focus();
	     		   	return false; 
				   }

	 			 
				

		         


	       		if ( (Ufrm.password.value=="") || (Ufrm.password.value.length !=6))
	          	   {
					alert("Your password should have 6 characters!");
                	Ufrm.password.value="";          
					Ufrm.password.focus();		
					return false;
               	   }
	       		if  (Ufrm.password.value != Ufrm.repeat_password.value )
	         	  {
					alert("The passwords do not match!");
					Ufrm.password.value="";            
					Ufrm.repeat_password.value="";    
					Ufrm.password.focus();		
					return false;
	         	  }	
	         		  
	       		alert ("Your Form is O.K!");
           		return true;
         	} // end valid(theForm)

       </script>
    	<style>
	input[type=text], select {
  width: 50%;
  padding: 6px 12px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=password], select {
  width: 50%;
  padding: 6px 20px;
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
  padding: 20px;
}
	</style>  
	</head>
	<body bgcolor="darkgray">
<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
		// 
if (session.getAttribute("Status")!= "admin") 
	response.sendRedirect("newindex.jsp");
%>	
      <center>
	 
        <h2>עדכן את פרטי המשתמש ושלח לעדכון במסד הנתונים </h2>
		fields with  <b><span>*</span></b> are mandatory<br />
		System.out.println(+session.getAttribute("gender"));
		<form 	name="Ufrm"  
			onsubmit="return valid(this)"   
			onreset="return confirm('All data will be lost')"   
			action = "page4-doUpdate.jsp"   
			method="post">
			
     <table border="1">
	   <tr>
		<td><span>*</span> first name</td>		
		<td><input type="text" name="fname" value=<%= session.getAttribute("fname") %>></td>		
	   </tr>
	   <tr>
		<td><span>*</span> last name</td>		
		<td><input type="text" name="lname" value=<%=session.getAttribute("lname") %>></td>		
	   </tr>
	   
	   <tr>
		<td><span>*</span> e_mail</td>		
		<td><input type="text" name="e_mail"  value=<%=session.getAttribute("e_mail") %>></td>		
	   </tr>
	   <!--לא טוב להשתמש בהוראה זו מכיון שאז הערך לא נשלח disabled  -->		
	   <tr>
		<td>birth year</td>		
		<td>
			<select name="year">
		  	<script language="javascript">
		     for (var i=new Date().getFullYear();i>=(new Date().getFullYear())-120;i--)
		    	 {
		    	 if (i==2000)
					  document.write("<option  value='"+i+"' selected >"+i+"</option>");
		    	 else
		   			  document.write("<option  value='"+i+"' >"+i+"</option>");
		    	 }
		    	</script>       
		    </select>
		    </td>		
	   </tr>
	   <tr>
		<td>Male</td>		
		<td><input type="radio" name="gender"   disabled   value="m" ></td>		
	   </tr>
	   <tr>
		<td>Female</td>		
		<td><input type="radio" name="gender"   disabled   value="f" ></td>		
	   </tr>
           	  
		
	   <tr>
		<td><span>*</span> Password</td>	
		<td><input type="password" name="password"  readonly size = "10" maxlength="6" value=<%=session.getAttribute("password") %>></td>
	   </tr>	
	   <tr>
		<td><span>*</span> Repeat Password</td>	
		<td><input type="password" name="repeat_password" readonly size = "10" maxlength="6" value=<%=session.getAttribute("password") %>></td>		
	   </tr>
	   <tr>
		<td align="center"><input type="Reset" value="Reset"  ></td>		
		<td><input type="submit" value="Update" ></td>		
	   </tr>
      </table>		
    </form>
		
    </center>

  </body>
</html>

   
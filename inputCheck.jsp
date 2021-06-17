<%@ page contentType="text/html" pageEncoding="UTF-8" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>דף הרשמה</title>
		
		<script language="JavaScript">
		
     	    var formErrors ;

     	    function check()
	        {
				formErrors = '' ;
				check_fname() ;
				check_lname() ;
				check_em() ;
				check_pass();
				
				if (formErrors.length == 0)  
					{
					alert("המשתמש נרשם בהצלחה!");
					return true;
					}
				else
					{
					alert(formErrors) ;
					window.document.frm.firstName.focus() ;
					return false;
					}
     	    } // end of function check()
			

			function check_fname() 
	        {
      	        var fname2check ;
      	        fname2check = window.document.frm.firstName.value ;
      	        
      	        var ageLetters="1234567890";
      	        var cou=0;
				for (var i=0; i<document.frm.firstName.value.length; i++)
				{
					var letter=document.frm.firstName.value.charAt(i);
					if (ageLetters.indexOf(letter)!=-1)
					{
					cou++;
					}
				}
				if (cou>0)
				{
				formErrors += 'שגיאה: בשם הפרטי אסור להיות מספרים' + '\n' ;
				}
    	        
      	        if (fname2check.length < 2) 
					{ 		     
					formErrors += 'שגיאה: שם פרטי קצר מידי' + '\n' ;	
					}
      	        if (fname2check.length > 20) 
      	        	{
      	        	formErrors += 'שגיאה: שם פרטי ארוך מידי' + '\n' ;
      	        	}
    	    }


		/*	function check_pass() 
	        {
      	        var pass2check ;
      	        pass2check = window.document.frm.password.value ;
      	        if (pass2check.length < 6) 
					{ 		     
					formErrors += 'שגיאה: סיסמא קצרה מידי' + '\n' ;	
					}
      	        if (pass2check.length > 20) 
      	        	{
      	        	formErrors += 'שגיאה: סיסמא ארוכה מידי' + '\n' ;
      	        	}
      	        if( pass2check.equals( window.document.frm.rPassword.value ))
      	        	{}
      	        else
      	        	formErrors += 'שגיאה: הסיסמא לא שווה לסיסמא החוזרת' + '\n' ;
      	        	
    	    }
			*/
			
			function check_lname() 
	        {
      	        var lname2check ;
      	        lname2check = window.document.frm.lastName.value ;

      	        var ageLetters="1234567890";
    	        var cou=0;
				for (var i=0; i<document.frm.lastName.value.length; i++)
				{
					var letter=document.frm.lastName.value.charAt(i);
					if (ageLetters.indexOf(letter)!=-1)
					{
					cou++;
					}
				}
				if (cou>0)
				{
				formErrors += 'שגיאה: בשם המשפחה אסור להיות מספרים' + '\n' ;
				}
      	        
      	        if (lname2check.length < 2) 
					{ 		     
					formErrors += 'שגיאה: שם משפחה קצר מידי' + '\n' ;
					}	
      	        if (lname2check.length > 20) 
		 	    	{ 		     
			     	formErrors += 'שגיאה: שם משפחה ארוך מידי' + '\n' ;
				    }
    	    }
			
			
     	    function check_em() 
	        {
      	        var eMail2check;
      	        email2check = window.document.frm.email.value ;
      	        if (email2check.length > 0) 
				{
      	        	  var shtrudel=email2check.indexOf("@",1);    // the function looks for a '@' in the string
      	  		      if(shtrudel==-1)
      	  		      {
      	  		          formErrors += 'שגיאה: ה-@ לא במקום או חסר' + '\n' ;
      	  		      }
      	  		      else if(email2check.split("@").length>2)    // the function splits the string to 2 arrays, if it found more than 1 '@"  it will alert.
      	  		      {
      	  		          formErrors += 'שגיאה: יש יותר מ-@ אחד' + '\n' ;
      	  		      }
				}
				else
				{
					  formErrors += 'שגיאה: הכנס דואר אלקטרוני' + '\n' ;
				}
      	        var dot=email2check.indexOf(".");
      	    	if(dot != -1 && dot > shtrudel+3 && dot < email2check.length-2)   
      			{}
      		    else
      		    {
      		    	formErrors += 'שגיאה: הנקודה באימייל לא במקום או חסרה' + '\n' ;
      		    }

      	     }
			

    	</script>
		
    	<link rel="stylesheet" type="text/css" href="myStyle.css"/>
 	</head>
 	<body bgcolor="#ebebeb"  vlink="blue" alink="yellow" onload="setInterval('clock1()',1000)">
<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
		// בכדי שיראו עיברית
 %>	
 		<table style="width:100%; height:100%; border:2px solid blue; border-collapse:collapse;";>        
        	<tr style="height: 110px; vertical-align: middle; text-align:center "  >
            	<td colspan="2" style="height: 89px; border:2px solid blue;" dir="rtl">
            	
					<jsp:include page="title.jsp"></jsp:include>
			
				</td>
        	</tr>	
		
			<tr style="height:500px">            
            	<td  id="main"  style="width: 88%; border:2px solid blue;" dir="rtl">
                	<center>
                	<font color="red"> 
                	<h3> יש לרשום רק באנגלית</h3>
                    </font> 	
                	                 		
       <form name="frm"
             method="get"   
             action="registerIN.jsp" 
             onsubmit="return check();"> 
             
	   <table  border="3" bordercolor="blue">  
  	      <tr>
    		<td>First name</td>
    		<td><input  type="text" name="fname" /></td>
	      </tr>
  	      <tr>
    		<td>Last name</td>
    		<td><input type="text" name="lname" /></td>
	      </tr>
	      <tr>
    		<td>e-mail</td>
    		<td><input  type="text" name="email" /></td>
	      </tr>
  	      <tr>
    		<td>password</td>
    		<td><input type="password" name="password" /></td>
	      </tr>
  	      <tr>
    		<td>born year</td>
    		<td>
		     <select name="year"> 
	         <script language=javascript>
		     for (var i=1933;i<=2010;i++)
		    	 if (i==2000)
			 document.write("<option  value='"+i+"' selected >"+i+"</option>");
		    	 else
		     document.write("<option  value='"+i+"' >"+i+"</option>");
            </script>
		     </select>
		     <select name="month"> 
	         <script language=javascript>
		     for (var i=1;i<=12;i++)
			 document.write("<option  value='"+i+"' >"+i+"</option>");
            </script>
		     </select>
		     <select name="day"> 
	         <script language=javascript>
		     for (var i=1;i<=31;i++)
			 document.write("<option  value='"+i+"' >"+i+"</option>");
            </script>
		     </select>
	        </td>
	      </tr>
  	      <tr>
    		<td>Male</td>
    		<td><input type="radio" value="male" name="gender" checked /></td>
	      </tr>
  	      <tr>
    		<td>Female</td>
    		<td><input type="radio" value="female" name="gender" /></td>
	      </tr>
  	      <tr>
    		<td>&nbsp;</td>
    		<td><b>Your surf type</b></td>
	      </tr>
  	      <tr>
    		<td>ski</td>
    		<td><input type="radio" value="ski" name="surf" checked /></td>
	      </tr>
  	      <tr>
    		<td>Snowboard</td>
    		<td><input type="radio" value="snowboard" name="surf" /></td>
	      </tr>
  	      <tr>
    		<td><input type="reset" value="לאיפוס" /></td>
    		<td><input type="submit" name="submit" value="להרשמה" /></td>
  	      </tr>

	 </table>
       </form>
                  		                 	 	                
                	</center>
                	
         		</td>
				<td  id ="menu" style="width: 110px; height:535px; border:2px solid blue;" dir="rtl">
		
					<jsp:include page="menu.jsp"></jsp:include>
					
				</td>
        	</tr>
    	</table>
	</body>
</html>
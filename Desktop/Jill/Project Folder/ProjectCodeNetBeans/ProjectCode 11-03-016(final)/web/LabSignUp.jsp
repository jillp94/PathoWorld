<%-- 
    Document   : signUp
    Created on : 9 Jan, 2016, 11:14:03 AM
    Author     : Sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PathoWorld</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       

        <!-- CSS -->
        <link href="css/fonts1.css" rel="stylesheet" type="text/css"/>
        <link href="css/fonts2.css" rel="stylesheet" type="text/css"/>
              <link href="ForLoginPage/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="ForLoginPage/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="ForLoginPage/assets/css/style.css" rel="stylesheet" >
        <link href="ForLoginPage/assets/css/form-elements.css" rel="stylesheet" >
        
        <!-- Favicon and touch icons -->
   
        <link rel="shortcut icon" href="ForLoginPage/assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ForLoginPage/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ForLoginPage/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ForLoginPage/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="ForLoginPage/assets/ico/apple-touch-icon-57-precomposed.png">
		<style type="text/css">
		.center_div{
    margin: 0 auto;
    width:80% /* value of your choice which suits your alignment */

}
body{
    background-image: url("ForLoginPage/assets/img/backgrounds/1.jpg");
    -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
.style3 {font-size: 9px}
        .style4 {
	font-size: 36px;
	font-family: 'Glyphicons Halflings';
	color: #330066;}

        </style>
        <script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip(); 
   
});
  
</script>
   </head>
   <body>
 <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container center_div">
                	
                    <div class="row">
						<h1 align="center"><img src="assets/img/logo.png" alt="not " height="90%"/><h1>
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1 align="center"><strong>Patho</strong><strong>World</strong></h1>
                        </div>
                    
                    </div>
                    	<div class="col-lg-2 col-sm-2"></div>
                        <div class="col-sm-8 col-lg-8">
                        	
                        	<div class="form-box">
	                        	<div class="form-top">
	                        		<div class="form-top-left">
	                        		<h3>Register now to our website</h3>
	                            		<p>Fill Up the Given Form &amp Get Registered</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        		<i class="fa fa-registered"></i>
	                        		</div>
	                            </div>
	                            <div class="form-bottom">
                                        <form role="form" action="LabSignUpServlet" method="post" class="login-form" >
                                            <div class="form-group">
                                                 <font size="+1" color="#FFFFFF" face="Times New Roman, Times, serif">Notes:</br>
                                                1.According to the data you mention, your Unique LabId will be generated.</br>
                                                2.Your Email-Id will be your UserName.</br>
                                                3.Note that this is just a registration form.You will need to fill up your "Lab Profile Page" after successfully Registering 
                                                your Lab on this portal.
                                                </br> 4.Please give all the details correct as these details are to be seen by Patients
                                                </font>
                                            </div>
                                            
                                            <div class="form-group">
                                               
        <input type="text" name="lname" placeholder="Enter Your Lab Name" class="form-username form-control"  required="true">
                                             </div>
                                                        <div class="form-group">
                                                            
                                                            <input type="text" name="ladmin" placeholder="Enter Your Name" data-toggle="tooltip" data-placement="right" title="Date should be in dd/mm/yyy format" class="form-username form-control ">
                                                            </div>
				                        <div class="form-group">	
                                                            <input type="text" name="lcontact1" placeholder="Enter Mobile No." class="form-control" maxlength="10" required="true"></div>
                                            <div class="form-group">
                                                            
<input type="text" name="lcontact2" placeholder="Enter Mobile No." class=" form-control" maxlength="10" id="form-password">
				                        </div>
				         
                                          <div class="form-group">
                                                            <input type="text" name="lemail" placeholder="Enter Your Email" data-toggle="tooltip" data-placement="right" title="Use this E-mail Id as your UserName when LogIn" class="form-username form-control"  required="true">
				                        </div>
                                           
                                           <div class="form-group">
                                           <input type="password" name="lpassword" placeholder="Enter Password" class="form-password form-control"  required="true">
				           </div>
          
                                                        
				                        
                                                        
				                        <button type="submit" class="btn">Register</button>
				                    </form>
			                    </div>
		                    </div>
		                
		                	
	                        
                        </div>
                        
                        
                    
                </div>
            </div>
            
        </div>


 <jsp:include page="footer.jsp"></jsp:include>
 <script src="ForLoginPage/assets/js/jquery-1.11.1.js" type="text/javascript"></script>
 <script src="ForLoginPage/assets/bootstrap/js/bootstrap.js" type="text/javascript"></script>
 <script src="ForLoginPage/assets/js/scripts.js" type="text/javascript"></script>       
           
       

    </body>
</html>

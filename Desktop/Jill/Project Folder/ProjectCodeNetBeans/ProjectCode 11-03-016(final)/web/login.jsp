<%-- 
    Document   : login
    Created on : 9 Jan, 2016, 10:21:17 AM
    Author     : Sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>PathoWorld</title>

        <!-- CSS -->
        <link href="css/fonts2.css" rel="stylesheet" type="text/css"/>
        <link href="css/fonts1.css" rel="stylesheet" type="text/css"/>
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
	color: #330066;
}
h1,h2,h3,h4,h5,p{
    font-family: "Times New Roman, Times, serif";
}
        </style>
    </head>
  
    <body>
                                 <%
                                 session.setAttribute("uri", "login");%>
                                                           
 <div class="top-content">
        	
     <div class="inner-bg">
       <div class="container">
                	
        <div class="row">
                        <h1 align="center"><img src="assets/img/logo.png" alt="not " height="100%"/><h1>
                        <div class="col-sm-8 col-sm-offset-2 text">
                        <h1 align="center"><strong>Patho</strong><strong>World</strong></h1>
                        <% try
                                {
                                    if(request.getParameter("er").equals("2")){%>
                                    <div class="description">
                                        <font size="+3" color="#4cae4c;" face="Times New Roman, Times, serif"><h3>
                                            <strong>Congratulations!!!!</strong>You have successfully <strong>Registered</strong>
                                            to our website.</br>
                                            Thank You for your Registration!!
                                        </h3></font>
                            </div>
 
			
                                       <% }}
                                catch(NullPointerException ne){}
                            %>
                           <% try
                                {
                                    if(request.getParameter("er").equals("8")){%>
                                    <div class="description">
                                        <font size="+3" color="#4cae4c;" face="Times New Roman, Times, serif"><h3>
                                            <strong>Congratulations!!!!</strong>You have successfully <strong>Registered</strong>
                                            to our website and your Lab profile Page has been uploaded to the portal.</br>
                                            Thank You for your Registration!!
                                        </h3></font>
                            </div>
 
			
                                       <% }}
                                catch(NullPointerException ne){}
                            %>
  
                        </div>
                    
                    </div>
                    	
                          <div class="row">
                        <div class="col-sm-5">
                        	<div class="form-box">
	                        	<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>Login to our site</h3>
	                            		<p>Enter username and password to log on:</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-lock"></i>
	                        		</div>
                                     </div>
	                            <div class="form-bottom">
				     <form role="form" action="LoginServlet" method="post" class="login-form">
                                          <% try
                                {
                                    if(request.getParameter("er").equals("1")){%>
                               <div class="form-group">
				                    		
                               <font size="+2" color="red" face="Times New Roman, Times, serif">
                                 Wrong UserName or Password!!!  
                               </font>
                    
                        </div>
			
                                       <% }}
                                catch(NullPointerException ne){}
                            %>
                            
                            <% try
                                {
                                    if(request.getParameter("er").equals("4")){%>
                                    <div class="description">
                                        <font size="+3" color="#4cae4c;" face="Times New Roman, Times, serif"><h3>
                                            <strong>Great!!!!</strong>You have successfully <strong>updated</strong>
                                            your account.
                                            Please login again.
                                        </h3></font>
                                    </div>
 
			
                                       <% }}
                                catch(NullPointerException ne){}
                            %>
                            
                            <% try
                                {
                                    if(request.getParameter("er").equals("5")){%>
                                    <div class="description">
                                        <font size="+3" color="#4cae4c;" face="Times New Roman, Times, serif"><h3>
                                            <strong>Great!!!!</strong>Your password has been <strong>Reset</strong>
                                            successfully.</br>
                                            Please login again with your new Password.
                                        </h3></font>
                                    </div>
 
			
                                       <% }}
                                catch(NullPointerException ne){}
                            %>


			<div class="form-group">
				                    		
                        <font size="+1" color="#FFFFFF" face="Times New Roman, Times, serif"><input type="radio" name="person" value="Patient" checked="checked" />I'm a Patient
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="person" value="Lab" />I'm a Lab Admin</font>
                    
                        </div>
				                      
									
				                    	<div class="form-group">
				             <input type="text" name="username" placeholder="Username" required="true" class="form-username form-control" id="form-username">
				                        </div>
				                        <div class="form-group">
				                        	
				                        	<input type="password" name="password" required="true" placeholder="Password" class="form-password form-control" id="form-password">
				                        </div>
				                        <button type="submit" class="btn">LogIn</button>
                                                        <a href="emailfrom.jsp">
                                                       <font size="+1" color="#FFFFFF" face="Times New Roman, Times, serif">
                                                          Forgot password??</a>
				                    </form>
                                    </div>
                                           </div>
		                    </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-1"></div>
                        	
                        <div class="col-sm-5">
                       

 <div class="form-box">
     <div class="form-top">
	<div class="form-top-left">
	  <h3>Don't have Account?</h3>
	 <p>Register yourself now!!</p>
	</div>
	<div class="form-top-right">
	<i class="fa fa-pencil"></i>
	</div>
       </div>
<div class="form-bottom">
 <form role="form" action="signUp.jsp" method="post" class="login-form">
 <div class="form-group">
 <button type="submit" class="btn">I'm a Patient</button>			                    		
 </div>
 </form>				                      
<form role="form" action="LabSignUp.jsp" method="post" class="login-form">
 <div class="form-group">
 <button type="submit" class="btn">I'm a Lab Admin</button>			                    		
 </div>
 </form>				                      
									
				                    	
 </div>
 </div>
                        </div>
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

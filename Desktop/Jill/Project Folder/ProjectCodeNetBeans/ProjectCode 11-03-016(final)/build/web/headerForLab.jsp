<%-- 
    Document   : header
    Created on : 5 Mar, 2016, 11:21:01 PM
    Author     : Sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PathoWorld</title>
         <link rel="shortcut icon" href="assets/ico/favicon.ico">

			<title>AppBay - Responsive App Landing Page Template</title>

			<!-- Bootstrap core CSS -->
			<link href="css/bootstrap.min.css" rel="stylesheet">

			<!-- Custom styles for this template -->
			<link href="css/custom.css" rel="stylesheet">
                       <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
                        <link href="css/fonts1.css" rel="stylesheet" type="text/css"/>
                        <link href="css/fonts2.css" rel="stylesheet" type="text/css"/>
			
                        
                        <style>
                            .container-fluid{
                                padding-top: -10px;
                                margin-top: -10px;
                                
                            }
                             .container{
                                padding-top: 0px;
                                margin-top: 0px;
                                
                            }
                           
                        </style>


    </head>
    <body>
       
       <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
           
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#topWrap">
							<span class="fa-stack fa-lg">
                                                            <img class="img-responsive"src="images/logo.png" alt=""/>
                                                        </span>
							Patho<span class="title">World</span>
						</a>
                                            
                                            
					</div>
                                </div>
                                    
                                        <div class="container">
                                        <div class="navbar-header">
                                       <div class="collapse navbar-collapse appiNav">
                                            	
						<ul class="nav navbar-nav">
             <li><a href="LabHomePage.jsp"><span class="glyphicon glyphicon-home">Home</span></a></li>
             
              <li><a href="UpdateLabProfile.jsp"><span class="glyphicon glyphicon-edit">UpdateProfile</span></a>
             </li>
                    
   
    <li><a href="viewlabprofile.jsp"><span class="glyphicon glyphicon-user">MyProfile</span></a></li>
    <li><a href="updateLabEmailPwd.jsp"><span class="glyphicon glyphicon-user">MyAccount</span></a></li>
    <li><a href="appointment.jsp"><span class="glyphicon glyphicon-calendar">Appointments</span></a></li>
     <li><a href="report.jsp">
                                                           
          <span class="glyphicon glyphicon-list">Reports</span>
         </a><li>
 <li><a><form action="logoutServlet" method="post"> 
 <button class="btn btn-primary btn-lg" style=" font-family:Times New Roman; width:100%; margin-left: 100px; margin-right: 0px; margin-bottom:0px;">LogOut</button>
</form> </a></li>
                                                </ul>
	  
         </div>
        
						
					</div><!--/.nav-collapse -->
				</div>
			</div>
       </div></div>
        

         <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js" type="text/javascript"></script>
	

    </body>
    
</html>

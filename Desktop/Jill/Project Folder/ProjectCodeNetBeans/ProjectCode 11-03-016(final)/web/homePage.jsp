<%-- 
    Document   : homePage
    Created on : 9 Jan, 2016, 10:12:23 AM
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
                        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
			<!-- Bootstrap core CSS -->
			
			
			<script src="js/jquery.min.js" type="text/javascript"></script>
                        <script src="js/bootstrap.min.js" type="text/javascript"></script>

                         <style>
 .carousel-inner img {
    -webkit-filter: grayscale(10%);
    filter: grayscale(10%); /* make all photos black and white */ 
    width: 100%; /* Set width to 100% */
    margin: auto;
}

.carousel-caption h3 {
    color: #fff !important;
}

@media (max-width: 600px) {
    .carousel-caption {
        display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
}
  </style>

         </head>
         
    <body>
         <jsp:include page="header.jsp" flush="true"></jsp:include>

               <% try {
                if (session.getAttribute("status").equals("true")) {
                    String PName = session.getAttribute("PatientName").toString();%>
                      
             <br></br>
             <br><br></br>
             <br>


             <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/c3.jpg" alt="New York">
      <div class="carousel-caption">
      
      </div> 
    </div>

  <div class="item">
     
      <img src="images/c1.jpg" alt=""/>
      <div class="carousel-caption">
       
      </div> 
    </div>

  </div>
  </div>
             <jsp:include page="footer.jsp"></jsp:include>    
       
        
        <%}
        } catch (Exception e) {
        %>
        <h3 align="right">Hello User</h3>
        <a href="login.jsp">Login  </a></br>
        <a href="signUp.jsp"> signUp</a></br>
        <a href="search.jsp">Search </a></br>
        <a href="PathoTests.jsp">Pathotest</a></br>
        <a href="bookAppointment.jsp">Book Appointment</a></br>
        <a href="patientHistory.jsp">My History </a></br>
         <a href="feedback.jsp">feedback</a></br>
        <%}%>
               
        
    </body>
</html>

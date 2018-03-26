<%-- 
    Document   : LabHomePage
    Created on : 13 Jan, 2016, 10:19:37 AM
    Author     : Sony
--%>
<jsp:include page="headerForLab.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PathoWorld</title>
               <link rel="shortcut icon" href="assets/ico/favicon.ico">

			
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
        </br></br></br></br></br>
        <%try {
                if (session.getAttribute("status").equals("true")) {
                    String LabAdminName = session.getAttribute("LabAdmin").toString();%>
           
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
    
        <%}
        } catch (Exception e) {%>

        <h3 align="right">Hello User</h3>
        <a href="LabProfilePage.jsp">Fill Profile</a></br>
        <a href="viewlabprofile.jsp">My profile Page</a></br>
        <a href="viewPatientDetail.jsp">View history</a></br>
        <a href="LabSignUp.jsp">Sign Up</a></br>
        <a href="UpdateLabProfile.jsp">Update Profile</a></br>
        <a href="login.jsp">Login page</a></br>
        <a href="appointment.jsp">Appointments</a></br>
        <a href="report.jsp">Reports</a></br>
         <a href="feedbacksforLab.jsp">Feedbacks</a>


        <% }
        %>
          </body>
</html>
 <jsp:include page="footer.jsp"></jsp:include>
 

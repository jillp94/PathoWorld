<%-- 
    Document   : features
    Created on : 6 Apr, 2016, 1:03:48 AM
    Author     : Sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PathoWorld</title>
        <jsp:include page="header.jsp"></jsp:include>
          <style>
    p,h4{
                font-family:"Times New Roman, Times, serif";
                color:#003399;
                font-size: 20px;

            }
           
            .panel {
                border: 1px solid #1b6d85; 
                border-radius:0;
                transition: box-shadow 0.5s;
            }

            .panel:hover {
                box-shadow: 5px 0px 40px rgba(0,0,0, .2);
            }

            .panel-footer .btn:hover {
                border: 1px solid #f4511e;
                background-color: #fff !important;
                color: #f4511e;
            }
            
             #feedback.panel-heading
             {background-color:#aaa !important;}   
            .panel-heading {
                color: #fff !important;
                background-color: #1b6d85 !important;
                padding: 25px;
                border-bottom: 1px solid transparent;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
                font-family:"Times New Roman, Times, serif";
            }
             h2,h3{
               font-family:"Times New Roman, Times, serif";  
               
            .panel-footer {
                background-color: #fff !important;
            }

            .panel-footer h3 {
                font-size: 32px;
            }

            .panel-footer h4 {
                color: #aaa;
                font-size: 14px;
            }
           
         
td {
    text-align: left;
    padding: 8px;
    font-family: "Times New Roman, Times, serif" !important;
    font-size: 15px !important; 
    color:#330066;
}
            .panel-footer .btn {
                margin: 15px 0;
                background-color: #f4511e;
                color: #fff;
            }
            
            input {
    border: 5px solid white; 
    -webkit-box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    -moz-box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    padding: 15px;
    background: rgba(255,255,255,0.5);
    margin: 0 0 10px 0;
}
 textarea {
      font-family:"Times New Roman, Times, serif" !important;  
               color:#003399 !important;
    border: 5px solid white; 
    -webkit-box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    -moz-box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    padding: 15px;
    background: rgba(255,255,255,0.5);
    margin: 0 0 10px 0;
    
}
 h2,h3,h1,h4,h5{
               font-family:"Times New Roman, Times, serif";  
            }
            p{
                font-family:"Times New Roman, Times, serif";
                color:#003399;
                font-size: 20px;
label{
    font-family:"Times New Roman, Times, serif" !important; 
    color:#003399;
}
select.form-control{
    border-radius: 20px;
}
            

        </style>


    </head>
    <body>
        </br></br></br></br></br></br></br></</br></br></br></</br></br>
<div id="featureWrap">
    <div class="container">
     <div class="row">
         <div class="col-sm-3">
      <div class="panel panel-default text-center">
         
	
             <div class="panel-body">
                 <a href="search.jsp"><i><img src="images/search.png" height="150px" alt=""/></i></a>
	<h3>Search For Labs</h3>
	<p>
          Search or filter your  search for Pathology lab . 
        </p>
	</div>
      </div></div>
	 <div class="col-sm-3">
      <div class="panel panel-default text-center">
         
	
             <div class="panel-body">

                 <a href="book.jsp"><i align="center">
                         <img src="images/book.png" height="150px" width="150px" alt=""/>
                 </i></a>
            
	<h3>Book Appointment</h3>
	<p>
  You can book the appointment from here.
    	</p>
             </div></div></div>
         
          <div class="col-sm-3">
      <div class="panel panel-default text-center">
         
	
             <div class="panel-body">

    </i>
    <a href="PathoTests.jsp"><i><img src="images/List.png" height="150px" width="150px" alt=""/></i></a>
	<h3>Pathology Test Details</h3>
        <p>
        Get all the details about pathology Tests.
	</p>
             </div></div></div>
         <div class="col-sm-3">
      <div class="panel panel-default text-center">
         
	
             <div class="panel-body">

           <a href="feedback.jsp">  <i><img src="images/feedback.png" height="150px" width="150px" alt=""/></i></a>
	<h3>Give Feedback</h3>
        <p>
            Share your experience with us and other patients . 
        
	</p>
             </div></div></div>

	</div>
	</div>

</div>
    </body>
</html>
<jsp:include page="footer.jsp"></jsp:include>
<%-- 
    Document   : viewlabprofile
    Created on : 23 Jan, 2016, 11:11:55 AM
    Author     : Sony
--%>
<jsp:include page="header.jsp"></jsp:include>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PathoWorld</title>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <style>
            .jumbotron {
                background: url(images/1-3.jpg) no-repeat center center scroll; 
               

                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
                padding-bottom: 5;
                padding-top: 20px;
                color: #fff;
                margin-bottom: 0;

            }
            .myimg img {
                border-bottom-width: 3px;
   }
   
   .nav-pills>li>a{
       font-size: 20px;
   }
            .nav-pills
            {
                color:#fff;
            }
            .nav-pills> li >a:hover{
                color:#fff;
                background-color:#28a4c9;
                font-size: 20px;
            }
            h2,h3,h1{
               font-family:"Times New Roman, Times, serif";  
            }
            p,h4{
                font-family:"Times New Roman, Times, serif";
                color:#003399;
                font-size: 20px;

            }
            h3{
                color: #fff;
            }
            .tab-pane{

                margin-top: 10px;
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
                background-color:#00b3b3 !important;
                padding: 25px;
                border-bottom: 1px solid transparent;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
                font-family:"Times New Roman, Times, serif";
            }

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

            .panel-footer .btn {
                margin: 15px 0;
                background-color: #f4511e;
                color: #fff;
            }
            
        </style>

    </head>
    <body>
        </br></br></br></br></br></br>
        <%
            try {
                if (session.getAttribute("status").equals("true")) {%>

        <%
            model.database m1 = new model.database();
                           String labname = request.getSession().getAttribute("LabName").toString();
                Iterator ia = new model.database().viewlabDetails(labname).iterator();
                Iterator ia1 = new model.database().viewPatientFeedback(labname).iterator();
      String feedback[]=new String[100]; 
        %>
        
        <%  while (ia.hasNext()) {
                String s[] = ((String) ia.next()).split("#");

        %>


        <% for (int i = 0; i < s.length; i++) {%>


        <% System.out.println("Values are:" + i + "-" + s[i]);
                        }%>
                        </br></br></br></br></br>
        <div class="container">
            <div class="row">
                <div class=" col-md-12 col-lg-12 jumbotron">
                    <div class="text-center">

                        <div class="myimg">
                            <img src="<%=s[16]%>"  width="300px" height="300px" />
                        </div>
                            <h1><font color="#1b6d85" face="Times New Roman, Times, serif"><%=s[1]%></h1></font></br>
                            <h3><font color="#000" face="Times New Roman, Times, serif">Laboratory Admin: <%=s[11]%></h3>
                            <a href="book.jsp"><input type="button" class="btn btn-block btn-primary" style="font-size: 25px;" value="Book Appointment">
                            </a>
                            
                    </div>

                </div>
            </div>
        </div>
                    <div class="container">
                        <div class="row">
                            
                            
                               
                        </div>
                    </div>
        <div class="container">
            <div class="row"> 
                <ul class="nav nav-pills" 
                    style=" background-color:#ffffff;
                color:#fff;
                font-family:Times New Roman,Times, serif; padding: 10px 10px 10px 10px;"
                    >
                    <li class="active"><a data-toggle="pill" href="#about">About Us</a></li>
                    <li><a data-toggle="pill" href="#facility">Facilities we have</a></li>
                    <li><a data-toggle="pill" href="#service">Types of Services</a></li>
                    <li><a data-toggle="pill" href="#hours">Hours of Operation</a></li>
                    <li><a data-toggle="pill" href="#contact">Contact us</a></li>
                    <li><a data-toggle="pill" href="#review">Reviews</a></li>
                   
                    
                </ul>

                <div class="tab-content">
                    <div id="about" class="tab-pane fade in active">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3>About Us</h3>
                                    </div>

                                    <%
                                        String delimiter1 = "[.]+";
                                        String[] temp1;
                                        temp1 = s[15].split(delimiter1);%>
                                    <div class="panel-body">
                                        <%for (int i = 0; i < temp1.length; i++) {
                                        %>
                                        <li><p><%=temp1[i]%></p></li>

                                        <%}%>
                                    </div>
                                </div>
                            </div>
                            </div> 
                        </div>
                        <div id="facility" class="tab-pane fade">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3>Facilities we have</h3>
                                        </div>
                                        <%

                                            String delimiter0 = "[.]+";
                                            String[] temp0;
                                            temp0 = s[13].split(delimiter0);%>
                                        <div class="panel-body">
                                            <%for (int i = 0; i < temp0.length; i++) {
                                            %>
                                            <li><p><%=temp0[i]%></p></li>

                                            <%}%>
                                        </div>
                                        <div class="panel-heading">
                                            <h1>Available Pathology Tests</h1>
                                        </div>
                                        <%
                                            String delimiter = ",";
                                            String[] temp;
                                            temp = s[12].split(delimiter);%>
                                        <div class="panel-body">
                                            <%for (int i = 0; i < temp.length; i++) {
                                            %>
                                            <li><p><%=temp[i]%></p></li>

                                            <%}%>
                                        </div>
                                    </div> 
                                </div> 
                            </div>
                        </div>   

   <div id="service" class="tab-pane fade">
       <div class="row">
      <div class="col-sm-12">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3>Services we Provide</h3>
        </div>
        <div class="panel-body">
            <%if(s[14].equalsIgnoreCase("BothVisit")){%>
            <p>We provide Both the Services:
                </br></br>
                1. Center Visit </br>
                2. Home Visit</br></br>
                
                (If the patient Select Home Visit option, The details of the Lab Person will be provided by us, when we confirm the Appintment.)
                
            </p>
           <%}
            else if(s[14].equalsIgnoreCase("centerVisit")){%>
            
            <p>Right now the only Center Visit Option is available for patients.</br>
               
            </p>
            
            <%}
            else{%>
            <p>Right now the only Center Visit Option is available for patients.</br>
               
            </p>
            
            <%}%>
          </div>
      </div> 
    </div> 
  </div>  
   </div>
    <div id="hours" class="tab-pane fade">
       <div class="row">
      <div class="col-sm-12">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3>Hours of Operation</h3>
        </div>
        <div class="panel-body">
            <p>Our Lab remains Open from : <%=s[10]%></p>
          </div>
      </div> 
    </div> 
  </div>  
   </div>      
<div id="contact" class="tab-pane fade">
  <div class="row">
                                <div class="col-sm-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3>Address</h3>
                                        </div>
                                        <div class="panel-body">
                                            <p><%=s[5]%>,<%=s[6]%></br>
                                                    <%=s[7]%>,<%=s[8]%>,
                                                    Gujarat,<%=s[9]%>
                                            </p>
                                            
                                        </div>
                                    </div> 
                                </div> 
                             <div class="col-sm-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3>Contact Us</h3>
                                        </div>
                                        <div class="panel-body">
                                            <p>Contact1. <%=s[2]%></br>
                                                    <%if(s[3].equals("null")){%>
                                                    Contact2. Not Provided. </br>
                                                    <%}else{%>
                                                    Contact2. <%=s[3]%>
                                                    <%}%>
                                                  
                                                </p>
                                        </div></div></div>
                                                    <div class="col-sm-12">
                                    <div class="panel panel-default">
                             
                                    <div class="panel-heading">
                                        <h3>Email-Address</h3>
                                        </div>
                                        <div class="panel-body">
                                            <h4><font color="Black">If any querries,  Write to us at:</font></h4>
                                            <p><%=s[4]%></br>
                                            </p>
                                            
                                        </div>
                                    </div> 
                                </div> 
                            </div>
                        </div>
                                       
                    
 <div id="review" class="tab-pane fade">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3>Reviews from Patients</h3>
                                    </div>
     <%while (ia1.hasNext()) {
                    String s5[] = ((String) ia1.next()).split("#");
                    feedback=s5;%>
                    <div class="panel-heading" style="background-color:#00b3b3;" id="feedback">
                                   </div>
                                    <div class="panel-body">
                                        <li><p>"<%=s5[3]%>"</p></li></br>
                                        <font face="Times New Roman, Times, serif" size="+1">&nbsp;&nbsp;&nbsp; -By <%=s5[0]%>  on <%=s5[1]%></font></br>
                                        </hr>
                                    </div>
   <% }%>                                  
                                </div>
                            </div>
                            </div> 
                        </div>
                

                 
        
                    </div>
                


                        <%}%>


                        <%} else {%>
                        <a href="login.jsp">Please login First</a>
                        <%}
        } catch (Exception e) {%>
                        <a href="login.jsp">Please login First</a>

                        <% System.out.println("Exception" + e);
                            }
                        %>             
                        </body>
                        
                        </html>
                                           
                        <jsp:include page="footer.jsp"></jsp:include>
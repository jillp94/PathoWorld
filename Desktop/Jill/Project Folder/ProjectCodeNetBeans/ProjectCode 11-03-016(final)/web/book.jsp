<%-- 
    Document   : book
    Created on : 5 Apr, 2016, 4:25:04 PM
    Author     : Sony
--%>
      <jsp:include page="header.jsp"></jsp:include>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Iterator"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PathoWorld</title>
        
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
    padding: 0px;
    background: rgba(255,255,255,0.5);
    margin: 0 0 0px 0;
    
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
         <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet"
        type="text/css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script language="javascript">
        $(document).ready(function () {
            $("#txtdate").datepicker({
                minDate: 0,
                dateFormat: 'dd-mm-yy'
                
            });
        });
    </script>


    </head>
    <body>
        
         <%
            try {
                if (session.getAttribute("status").equals("true")) {

                    String PName = session.getAttribute("PatientName").toString();%>
                   
                    <%  String PId=session.getAttribute("PatientId").toString();
        String s[]=new model.database().patientData(PId);
        %>
  <form role="form" action="bookAppointmentServlet" method="post" class="login-form" >  
      </br></br></br></br></br></br></br></br></br></br>
<div class="container">
   
  <div class="row">
     
    <div class="col-sm-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
            
            <h1><font color="#ffffff" face="Times New Roman, Times, serif">Book your appointment here!!</font></h1>
  
          </div>
          <div class="panel-body">
              
           
            <div class="col-sm-12">
                
          <% try
    {
    if(request.getParameter("er").equals("1")){%>
    <font size="+2" color="#4cae4c;" face="Times New Roman, Times, serif">
    <div class="alert alert-success">You have successfully <b>Booked</b>
     your Appointment.</div>                                     
       </font>
     <% }
     else{%>
     <font size="+2" color="red" face="Times New Roman, Times, serif">
     <div class="alert alert-warning">
     <b>Opps!!</b>Appointment could not be booked. Please try again!!
     </div>
     </font>
      <% }}
       catch(NullPointerException ne){}
        %>
          <div class="alert alert-info">
          <h4 align="left">
         Notes:</br>
          1.Do not change your personal details here.If you want to change your Details then please first Go to><a href="patientHistory.jsp"> My Account</a></br>
          2.For the Lab selection Press Search Button.</br>
          3.Before booking appointment you advised to check the lab profile, 
          so that you can make sure that respective lab will meet your Requirements</br>
          4.For the selection of Pathology Test, Click on the Search Button.</br>
          5.After booking the Appointment , please wait for the confirmation from the Lab. 
          You can check your Appointment status on <a href="myAppointments.jsp">My Appointments Page.</a>
          
          </h4>
          </div>
                 <div class="form-group">
                <input type="text" name="aid" value="Appointment Id will be Auto Generated" class=" form-control form-horizontal" disabled="disabled" />
                    </div>
        <div class="form-group text-center">
            <div class="alert alert-info">
                <h4>Patient Details</h4>
            </div>
         </div>
                   
                <div class="form-group">  
              <h4 align="left">Id</h4>
         <input type="text" name="pid" value="<%=PId%>" class="form-horizontal form-control" readonly="readonly" >
         </div>
         <div class="form-group">  
             <h4 align="left"> Name </h4>
         <input type="text" name="pname" value="<%=s[1]%>"  class="form-horizontal form-control">
         </div>
          <div class="form-group">  
             <h4 align="left"> Contact 1</h4>
         <input type="text" name="pcontact1" value="<%=s[3]%>" class="form-horizontal form-control" >
         </div>
         <%if(s[2].equalsIgnoreCase("null")){%>
          <div class="form-group">  
         <label class="control-label col-sm-8" for="lname">Contact2</label>
         <input type="text" name="pcontact2" value="Not Provided" class="form-horizontal form-control" >
         </div>
         <%}else{%>
          <div class="form-group">  
              <h4 align="left">Contact2</h4>
         <input type="text" name="pcontact2" value="<%=s[4]%>" class="form-horizontal form-control" >
         </div>
         <%}%>
         <div class="form-group">  
         <h4 align="left">Address</h4>
         
         
         <textarea name="paddress"class=" form-control" rows="3">
<%=s[5]%>
            
            </textarea>
         </div>
         <div class="form-group">  
         <h4 align="left">Email-Id</h4>
         <input type="text" name="pemail" value="<%=s[6]%>"  class="form-horizontal form-control" >
         </div>
         <div class="form-group text-center">
             <div class="alert alert-info">
                 <h4>Pathology Lab Details</h4>
             </div>
          
         </div>
               <%
               
               String  labname =session.getAttribute("LabName").toString();
                String s2[] = new model.database().getLabdataForAppointment(labname);
                String cartitems = session.getAttribute("TIdName").toString();
            %>
          <div class="form-group">  
              <h4 align="left">Which Lab you want to select?</br>
             <div class="col col-sm-6">
                  <div class="alert alert-success">
                  <a href="search.jsp"> Click here to Search for Pathology Lab
                  </a></div>

          </h4>
              <input type="text" name="lname" value="<%=labname%>" required="true" class="form-horizontal form-control" readonly="readonly">
         </div>
         <div class="form-group">  
             <h4 align="left">Lab Id</h4>
         <input type="text" name="lid" value="<%=s2[0]%>"  class="form-horizontal form-control" readonly="readonly" >
         </div>
          <div class="form-group">  
       <h4 align="left">Lab Contact1</h4>
         <input type="text" name="lcontact1" value="<%=s2[2]%>"  class="form-horizontal form-control" readonly="readonly" >
         </div>
         <%if(s[2].equalsIgnoreCase("null")){%>
          <div class="form-group">  
        <h4 align="left">Lab Contact2</h4>
         <input type="text" name="lcontact2" value="Not Provided" class="form-horizontal form-control" readonly="readonly" >
         </div>
         <%}else{%>
          <div class="form-group">  
         <h4 align="left">Lab Contact2</h4>
         <input type="text" name="lcontact2" value="<%=s2[3]%>" class="form-horizontal form-control" readonly="readonly" >
         </div>
         <%}%>
        
         <div class="form-group">  
     <h4 align="left">Lab Email-Id</h4>
         <input type="text" name="lemail" value="<%=s2[4]%>"  class="form-horizontal form-control" readonly="readonly" >
         </div> 
         <div class="form-group">  
             <h4 align="left">Lab Address</h4>
             <textarea name="laddress"class=" form-control" rows="3" readonly="readonly" >
            <%=s2[5]%>, <%=s2[6]%>,
            <%=s2[7]%>, <%=s2[8]%>
            <%=s2[9]%>
            
            </textarea>
        
         </div>
          <div class="form-group text-center">
              <div class="alert alert-info">
                  <h4> Pathology Tests</h4>
          </div>
          </div>
          <div class="form-group">  
              <h4 align="left">
                  Tests</br>
                  <div class="col col-sm-6">
                  <div class="alert alert-success">
                  <a href="PathoTests.jsp"> Click here to Search for Pathology Tests
                  </a></div>
              </div>
                </div>
              <div class="form-group">
                  <textarea name="tests"class=" form-control form-horizontal" rows="3" required="true" ><%=cartitems%>
            
            </textarea>
              </div>
     
          <div class="form-group text-center">
              <div class="alert alert-info">
                  <h4>Date & Time for an Appointment</h4>
              </div>
          </div>
         <div class="form-group">  
             <h4 align="left">Appointment Date:</h4>
             <input type="text" name="adate" id="txtdate" class="form-horizontal form-control"  data-format="dd/MM/yyyy" required="true" >
         </div>
          
          <% 
           String myTime = "6:30 AM";
             SimpleDateFormat df = new SimpleDateFormat("hh:mm a");
            Date d = df.parse(myTime); 
             
    
        Calendar cal1 = Calendar.getInstance();
       cal1.setTime(d);%>
       
          <div class="form-group">  
         <h4 align="left">Appointment Time:</h4>
         <select name="atime" class="form-horizontal form-control">
       <% for (int i = 0; i <= 34; i++) {
            cal1.add(Calendar.MINUTE,30);%>
           <option value = "<%=df.format(cal1.getTime())%>"><%=df.format(cal1.getTime())%></option>
            
           <%     
        }%>
        </select>   
         </div>
         
          <div class="form-group text-center">
              <div class="alert alert-info">
                  <h4> Type of Service</h4>
              </div>
          </div>
  <div class="form-group">
     
          <h4 align="left">   
              <input type="radio" name="servicetype" value="lab" checked="checked"/>Center Visit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="radio" name="servicetype" value="home"/>Home Visit
         </h4>
    </div>         
      
        <h3> <input type="submit" class="btn btn-block btn-primary"  style="display: block; height: 50px; font-size: 25px;" value="Book Now" /></h3>
           
            </div>
        
           
           
  
            </div>
        </div>     
        </div>
      </div>
    </div>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
 
<%} else {%>
        <a href="login.jsp">Please login First</a>
        <%}
        } catch (Exception e) {
            System.out.println("in catch");
        %>
        <a href="login.jsp">Please login First</a>

        <% System.out.println("Exception" + e);
            }
        %>             

    </body>
</html>
        <jsp:include page="footer.jsp"></jsp:include>


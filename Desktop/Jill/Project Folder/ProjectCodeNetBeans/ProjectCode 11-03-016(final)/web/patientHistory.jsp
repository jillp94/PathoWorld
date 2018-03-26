<%-- 
    Document   : patientHistory
    Created on : 22 Feb, 2016, 10:47:06 AM
    Author     : Sony
--%>

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
    text-align: left !important;
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
h4{
    float: left !important;
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
            
        </style>


    </head>
    <body>
<%
try {
if (session.getAttribute("status").equals("true")) {%>
        <form action="updatePatientDataServlet" method="post">
            </br></br></br></br>
      </br></br></br></br></br></br></br>
      <div class="container">
   
  <div class="row">
     
    <div class="col-sm-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <% try
    {
    if(request.getParameter("er").equals("2")){%>
    <font size="+2" color="red" face="Times New Roman, Times, serif">
     <div class="alert alert-warning">
     <b>Opps!!</b>Failed to update your data. Please try again.
     </div>
     </font>
     <% }
     
       }
       catch(NullPointerException ne){}
        %>
  
            <h1><font color="#ffffff" face="Times New Roman, Times, serif">My Account</font></h1></br>
            </br>
            <div class="alert alert-info">
             <h4 align="left"><font color="black">Notes: </br>1.You can also edit your information given below.</font></h4>
            <h4 align="left"><font color="black">2.Kindly note that you can not change your unique "Patient Id"</font></h4>
            </div>
          </div>
          <div class="panel-body">
<table border="2" class="table table-responsive">
                <%String PId = session.getAttribute("PatientId").toString();
                 String s1[] = new model.database().patientData(PId);%>
                <tr>        
                    <td><h4 align="left">Patient Id</h4></td><td>
                 <input type="text" name="pid" class="form-control form-horizontal" value="<%=s1[0]%>" disabled="true" /></td>
                </tr>
                <tr><td><h4 align="left">Name</h4></td><td><input type="text" class="form-horizontal form-control"  name="pname" value="<%=s1[1]%>" /></td></tr>
                <tr><td><h4 align="left">Date of Birth</h4></td>
                    <td><input type="text" name="pdob" class="form-horizontal form-control" value="<%=s1[2]%>" /></td>
                </tr>
                <tr>
                    <td><h4 align="left">Contact No1</h4></td><td><input type="text" class="form-horizontal form-control" name="pcontact1" value="<%=s1[3]%>" /></td>
                </tr>
                <tr> <td><h4 align="left">Contact No2</h4></h4></td><td><input type="text" class="form-horizontal form-control" name="pcontact2" value="<%=s1[4]%>" /></td></tr>
                <tr> 
                    <td><h4 align="left">Email-Id</h4></td><td><input type="text" class="form-horizontal form-control" name="pemail" value="<%=s1[6]%>" /></td>
                </tr>   
                <tr> 
                    <td><h4 align="left"> Address</h4></td><td><textarea name="paddress" class="form-horizontal form-control" rows="4" cols="20"><%=s1[5]%>
                    </textarea></td>
                <tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" class="btn btn-block btn-primary btn-lg" style="height: 80%;" value="Save Changes" /></td>
                    </tr>
           
      <input type="hidden" name="ppass" value="<%=s1[7]%>" />
        
      
</table></form>  
    </div>
          </div>
      </div>
    </div>
  </div>
</div>
<div class="container">
    <div class="row">
<div class="col-sm-12">
      <div class="panel panel-default text-center">
           
 
          <form action="resetPassword" method="post"> 

        <div class="panel-heading">
            <h2><font color="#ffffff" face="Times New Roman, Times, serif">Reset Password</font></h2>
  
            <% try
    {
    if(request.getParameter("er1").equals("7")){%>
    
     
     <font size="+1" color="red" face="Times New Roman, Times, serif">
     <div class="alert alert-warning">
     <b>Opps!!</b>Your old password is incorrect. Please try again.
     </div>
     </font>
      <% }}
       catch(NullPointerException ne){}
        %>
            
          </div>
    
          <div class="panel-body">
              <table border="2" class="table table-responsive">
                  <tr> 
              
                  <td> <h4 align="left">Your Email-id :</h4></td>
                  <td> <input type="text" class="form-horizontal form-control" readonly="readonly" name="email" value="<%=s1[6]%>" required="true"></td>
                  </tr>
                   <tr> 
              
                  <td> <h4 align="left">Your old Password :</h4></td>
                  <td> <input type="password" class="form-horizontal form-control" name="oldpwd" required="true"></td>
                  </tr>
                  <tr>
                   <td> <h4 align="left">Your New Password :</h4></td>
                  <td> <input type="password" class="form-horizontal form-control" name="newpwd" required="true"></td>
                  </tr>
                  <tr>
                      <td colspan="2">
            <input type="submit" name="resetpwd" value="Change my Password" class="btn btn-block btn-primary btn-lg" style="height: 80%;">
                                             </td></tr>
          </table>
          </div>
                 </form>  
      </div>
    </div>
  </div>
</div>

 <%}
} catch (Exception e) {%>

<a href="login.jsp">Please Login first</a>
<%}%>

</body>
 <jsp:include page="header.jsp"></jsp:include> 
</html>

 <jsp:include page="footer.jsp"></jsp:include> 

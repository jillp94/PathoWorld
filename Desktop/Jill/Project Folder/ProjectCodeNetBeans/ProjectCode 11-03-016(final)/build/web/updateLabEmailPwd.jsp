<%-- 
    Document   : updateLabEmailPwd
    Created on : 16 Apr, 2016, 11:05:50 PM
    Author     : Sony
--%>
<jsp:include page="headerForLab.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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
 try{
 if(session.getAttribute("status").equals("true"))
      {         
 String s[]=new model.database().labData(session.getAttribute("Labid").toString()); %>
 </br>
      </br></br></br></br></br></br></br>
      </br></br>
      </br>
<div class="container">
   
  <div class="row">
     
    <div class="col-sm-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
      
 <form action="updateLabEmailPwdServlet" method="post">
<h1><font color="#ffffff" face="Times New Roman, Times, serif">My Account</font></h1></br>
 </br>
<div class="alert alert-info">
<h4 align="left"><font color="black">Notes: </br>1.You can  edit your Email-id,Lab Name,Lab Admin Name from here.</font></h4>
<h4 align="left"><font color="black">2.After successfully updating your Email-id, you will be redirected to Login Page.</font></h4>
</div>
</div>
<div class="panel-body">
<table border="2" class="table table-responsive">
                
                <tr>        
                 <td><h4 align="left">Lab Name</h4></td><td>
                 <input type="text" name="name" class="form-control form-horizontal" value="<%=s[1]%>" required="true" />
                 </td>
                </tr>
                <tr>        
                 <td><h4 align="left">Lab Admin Name</h4></td><td>
                 <input type="text" name="admin" class="form-control form-horizontal" value="<%=s[2]%>" required="true" />
                 </td>
                </tr>
                <tr>        
                 <td><h4 align="left">Lab Email-Id</h4></td><td>
                 <input type="text" name="email" class="form-control form-horizontal" value="<%=s[5]%>" required="true" />
                 </td>
                </tr>
                <tr>
                    <td colspan="2">   
      <input type="submit" value="Save Changes" class="btn btn-primary btn-lg" style="width: 100%; font-size: 20px;" name="submit" />
                    </td>
                </tr>
 </form>
 </table>
    </div>
          </div>
      </div>
    </div>
  </div>
<div class="container">
    <div class="row">
<div class="col-sm-12">
      <div class="panel panel-default text-center">
           
 
          <form action="resetLabPwdServlet" method="post"> 

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
                  <td> <input type="text" class="form-horizontal form-control" name="email" readonly="readonly" value="<%=s[5]%>" required="true"></td>
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
<input type="submit" name="resetpwd" value="Change my Password" class="btn btn-block btn-primary btn-lg" style="height: 80%; font-size: 20px;">
                                             </td></tr>
          </table>
          </div>
                 </form>  
      </div>
    </div>
  </div>
</div>



        <%}}
        catch(Exception e){
            System.out.println("Exception in update jsp"+e);
        }
%>
    </body>
</html>
<jsp:include page="footer.jsp"></jsp:include>
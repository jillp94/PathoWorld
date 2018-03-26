<%-- 
    Document   : report
    Created on : 24 Feb, 2016, 11:02:19 PM
    Author     : Sony
--%>
<jsp:include page="headerForLab.jsp"></jsp:include>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PathoWorld</title>
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FeedBack Page</title>
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
th{
     background-color:#1b6d85 !important;
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
     element.style {
    background-color:#1b6d85 ;
}       
        </style>


    </head>
    <body>
        
       <%


            try {
                if (session.getAttribute("status").equals("true")) {%>
      </br> </br></br></br></br></br>
      </br></br>
      </br></br>
      </br>
<div class="container">
   
  <div class="row">
     
    <div class="col-sm-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
            <h1><font color="#ffffff" face="Times New Roman, Times, serif">Patient Report's Status</font></h1>
  
          </div>
          <div class="panel-body">
              <table border="2" class="table table-responsive">
                <% Iterator ia = new model.database().appointmentRequest(session.getAttribute("Labid").toString()).iterator();
                String columns[] = {"Sr.No","Appointment Id","Patient's Name","Patient's Email"};
                int j=0;%>
            <tr>
                <%
                    for (int i = 0; i < columns.length; i++) {%>
                    <th style="background-color:#1b6d85;">
                <h4> <font color="#ffffff"  face="Times New Roman, Times, serif"><%=columns[i]%></font></h4></th>
                    <% }%>
            </tr>
            <% while (ia.hasNext()) {
                j++;
                    String s[] = ((String) ia.next()).split("#");%>
                    <form action="EmailForm.jsp" method="post">
      <%if(s[24].equalsIgnoreCase("NotDeleted")){                                   
     if(s[17].equalsIgnoreCase("confirmed")){%>
           <tr> 
               <td><b><h4><%=j%></b></h4></td>
               <td><b><h4><%=s[15]%></b></h4></td>
                <td><h4><%=s[1]%></h4></td>
                <td><h4><%=s[5]%></h4></td>
               
                <%if(s[18].equalsIgnoreCase("pending"))
                {%>
                <tr><td colspan="4"><input type="submit" class="btn btn-block btn-primary" style="display: block; height: 50px; font-size: 25px;" value="Send Report" /></td> </tr>
                <%}else{%>
                <tr>
                    <td colspan="4"><font color="green" size="+1" face="Times New Roman, Times, serif">
                        <div class="alert alert-success">
                        Report has been sent to the Patient.
                        </div></font></td></tr>
                <%}%>
                <input type="hidden" name="aid" value=<%=s[15]%> />
                    </form>
            </tr>
                    
                    <%}}
   
                if(s[24].equalsIgnoreCase("deleted")){}   
                }
            
                    %>
                    
                </table>

          </div>   
            
        </div>      
      </div>
    </div>    
  </div>
      
</div>     
                
                <%}}
            catch(Exception e)
            {%>
                <a href="login.jsp">Please Login first</a>
                <%}%>
    </body>
</html>

<jsp:include page="footer.jsp"></jsp:include>
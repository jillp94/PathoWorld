<%-- 
    Document   : appointment
    Created on : 23 Jan, 2016, 11:44:58 AM
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
              tr{
                  margin-top: 20px;
                  margin-bottom: 20px;
                  height: 80px;
                      
              }
            th{
                background-color:#1b6d85;
                font-size:20px;
                color:#FFFFFF;
               
                font-family: "Times New Roman, Times, serif";
            }
            .btn{
                margin-top: 20px;
                 margin-bottom:20px;
                
            }
            .table-striped{
                
            }
            *{
                -webkit-box-sizing: border-box;
            }
            
td {
    text-align: left;
    padding-bottom: 8px;
    padding-bottom: 8px;
    max-width: 80px;
    overflow-x: auto !important;
    font-family: "Times New Roman, Times, serif";
    font-size: 15px !important; 
    color:#330066;
}
h3,h2,h1,h4,h5{
     font-family: "Times New Roman, Times, serif";
}

table{
    
    width: 100%!important ;
}
</style>
   
    </head>
    <body>
        <%
            try {
                if (session.getAttribute("status").equals("true")) {
        int j=0;
        %>
                
        </br></br></br></br></br></br></br></br>
                 
                 </br></br></br>
                 
                <div class="container table-responsive">
                      <table border="2" class="table"  cellpadding="20" >      
                 
         
        
            <% Iterator ia = new model.database().appointmentRequest(session.getAttribute("Labid").toString()).iterator();
                String columns[] = {"Sr. No","Appointment Id", "Patient Id", "Patient's Name", "Patient's Contact Nos", "Patient's Address", "Patient's Email-id", "Requested Tests", "Appointment Date", "Appointment Time", "Type of Service"};%>
                <tr>
                <%
                    for (int i = 0; i < columns.length; i++) {%>
                    <th><%=columns[i]%></th>
                    <% }%>
            </tr>
            <% while (ia.hasNext()) {
                    String s[] = ((String) ia.next()).split("#");
            j++;
            %> 
                    
             <tr>
            <form action="confirmRejectAppointmentServlet" method="post" form="role">   
                <div class="form-group">
                 <%if(s[24].equalsIgnoreCase("NotDeleted")){%>   
                    <td style="background-color: #E5E5E5;"><b><%=j%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[15]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[0]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[1]%></b></td>
                <td style="background-color: #E5E5E5;"><b>1.<%=s[2]%>, 2.<%=s[3]%></b></td>
                
                <td style="background-color: #E5E5E5;"><b><%=s[4]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[5]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[7]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[12]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[13]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[14]%></td></b>
            </tr>
                
                <% if (s[17].equalsIgnoreCase("pending")) { %>
                <tr>
                    <td colspan="11">
         <input type="submit" class="btn btn-primary" style=" width:555px; height: 40px; font-size: 20px;" name="btype" value="Confirm">
                
      <input type="submit" name="btype" class="btn btn-primary" style="width:555px; height: 40px; font-size: 20px;" value="Reject"></td></tr>
                    <%} else {
                        if (s[17].equalsIgnoreCase("confirmed")) {%>
                <tr>
                    <td colspan="11" ><h4><font color="green" face="Times New Roman, Times, serif">
                            <div class="alert alert-success">
 
                            You have confirmed the Patient's Appointment.
                            </div>
 </center></font></h4></td>
                </tr>
                 <%
                        if (s[14].equalsIgnoreCase("home")) {%>
                  <%  if (s[23].equalsIgnoreCase("NotSent")) {%>
                <tr>
                    <td colspan="11">
                        <h3> <font color="#204d74" face="Times New Roman, Times, serif"><b>Details of lab Person</b></font></h3></br></br>
                        <h4><font  face="Times New Roman, Times, serif">Name of lab Person</font></h4></br>
                        
                        <input type="text" name="lpname"  value="" /></br>
                       
                        <h4><font  face="Times New Roman, Times, serif">Contact No:</font</h4></br>
                        <input type="text" name="lpcontact"  value="" maxlength="10" /></br>
                        
                        <input type="submit" name="btype" class="btn btn-primary btn-block" style="display: block; height: 40px; font-size: 20px;" value="Send lab Person Details"/>
                    </td></tr><%}
                  else{%>
                <tr><td colspan="11"><h4><font color="green" face="Times New Roman, Times, serif">
                         <div class="alert alert-success">
    You have sent the lab person details to the Patient.
    </div>
 </center> </font></h4></td></tr>

                  <%}%>
                    
                        <%}%>
                
                        <%} else {%>
                                    <tr> <td colspan="11"><h4><font color="red" face="Times New Roman, Times, serif">
                            
                                                You have Rejected the Appointment</center></font></h4></td></tr>
 
                            <%  if (s[19].equalsIgnoreCase("NotYetGiven")){%>
                            
                            <tr>
                                <td colspan="11">
                             <h4><font  face="Times New Roman, Times, serif">  
                                 Give reason to the Patient, why you rejected the Appointment?</font></h4></br></br>
                             <textarea name="reason" rows="7" cols="60">
                             </textarea></br></br>
                             <input type="submit" name="btype" class="btn btn-block btn-primary" style="display: block; height: 40px; font-size: 20px;" value="Give Reason for Rejection"/>
                            </center></td></tr>
                      <%}
                     else{%>
                <tr><td colspan="11"><h4><font color="green" face="Times New Roman, Times, serif">
                          <div class="alert alert-success">
   You have Sent the reason for rejecting appointment.
                          </div>
 </center></font></h4></td></tr>
                        <%}}}
                        %>
                <input type="hidden" name="pid" value=<%=s[0]%> />
                <input type="hidden" name="aid" value=<%=s[15]%> />
                <input type="hidden" name="pname" value=<%=s[1]%> />
                <input type="hidden" name="adate" value=<%=s[12]%> />
                <input type="hidden" name="atime" value=<%=s[13]%> />

               
            </form>
         </tr>
        <% }
            
if(s[24].equalsIgnoreCase("deleted")){%>
<tr>
            <form action="confirmRejectAppointmentServlet" method="post" form="role">   
                <div class="form-group">
                    <td style="background-color: #E5E5E5;"><b><%=j%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[15]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[0]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[1]%></b></td>
                <td style="background-color: #E5E5E5;"><b>1.<%=s[2]%>, 2.<%=s[3]%></b></td>
                
                <td style="background-color: #E5E5E5;"><b><%=s[4]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[5]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[7]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[12]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[13]%></b></td>
                <td style="background-color: #E5E5E5;"><b><%=s[14]%></td></b>
            </tr>
  
                <% if (s[17].equalsIgnoreCase("pending")) { %>
                <tr>
                    <td colspan="11">
                        <div class="alert alert-info"><h4><center>
                                    This Appointment has been cancled by Patient.</center></h4>  
                        </div>
                    </td>
                </tr>    
                             <%} else {
                        if (s[17].equalsIgnoreCase("confirmed")) {%>
                        <tr>
                    <td colspan="11">
                        <div class="alert alert-info"><h4><center>
                                   This Appointment has been cancled by Patient. </center></h4>  
                        </div>
                    </td>
                </tr>   
                        
                        
                        <%} else {%>
                                    <tr> <td colspan="11"><h4><font color="red" face="Times New Roman, Times, serif">
                            
                                                You have Rejected the Appointment</center></font></h4></td></tr>
 
                            <%  if (s[19].equalsIgnoreCase("NotYetGiven")){%>
                            
                            <tr>
                                <td colspan="11">
                             <h4><font  face="Times New Roman, Times, serif">  
                                 Give reason to the Patient, why you rejected the Appointment?</font></h4></br></br>
                             <textarea name="reason" rows="7" cols="60">
                             </textarea></br></br>
                             <input type="submit" name="btype" class="btn btn-block btn-primary" style="display: block; height: 40px; font-size: 20px;" value="Give Reason for Rejection"/>
                            </center></td></tr>
                      <%}
                     else{%>
                <tr><td colspan="11"><h4><font color="green" face="Times New Roman, Times, serif">
                          <div class="alert alert-success">
   You have Sent the reason for rejecting appointment.
                          </div>
 </center></font></h4></td></tr>
                        <%}}}
                        %>
                <input type="hidden" name="pid" value=<%=s[0]%> />
                <input type="hidden" name="aid" value=<%=s[15]%> />
                <input type="hidden" name="pname" value=<%=s[1]%> />
                <input type="hidden" name="adate" value=<%=s[12]%> />
                <input type="hidden" name="atime" value=<%=s[13]%> />

               
            </form>
         </tr>
            





<%}} %> 

   
  
         </table></div>
    <%  }
    } catch (Exception e) {%>
    
    <a href="login.jsp">Please Login first</a>
    <%}%>


</body>
</html>
<jsp:include page="headerForLab.jsp"></jsp:include><jsp:include page="footer.jsp"></jsp:include>
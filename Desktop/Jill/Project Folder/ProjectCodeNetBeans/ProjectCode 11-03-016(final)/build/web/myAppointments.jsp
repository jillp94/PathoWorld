<%-- 
    Document   : myAppointments
    Created on : 11 Mar, 2016, 1:16:53 AM
    Author     : Sony
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
  th{
                background-color: #285e8e;
                font-size:20px;
                color:#FFFFFF;
                font-family: "Times New Roman, Times, serif";
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
    text-align: left !important;
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
        </br></br></br></br></br></br></br></br></br></br></br>
<div class="container">
<div class="row">
<div class="col-sm-12">
<div class="panel panel-default text-center">
<div class="panel-heading">
    <h1><font color="#ffffff" face="Times New Roman, Times, serif">My Appointments</font></h1></br>
    <div class="alert alert-info">
        <h4 align="left"> Notes:</br>
           You can cancle your appointment by pressing "cancle" button. But note that you can not cancle
           your appointment on the day on which you have scheduled your appointment.
           
        </h4>
        
    </div>   
    
 </div>
    
<div class="panel-body">

<table border="2" class="table table-responsive"> 
<% Iterator ia = new model.database().appointmentRequest(session.getAttribute("PatientId").toString()).iterator();
String columns[] = {"Sr. No","Appointment Id", " Appointment Status","Report Status"};
int j=0;%>
           
<tr>
<%for (int i = 0; i < columns.length; i++) {%>
<th style="background-color: #285e8e;"><h4 align='center'><font color='#fff'><%=columns[i]%></font></h4></th>
                    <% }%>
</tr>
            <% while (ia.hasNext()) {
                j++;
                    String s[] = ((String) ia.next()).split("#"); %> 
                                     
            <tr>
                <td><b><%=j%></b></td>
                <%if(s[24].equalsIgnoreCase("NotDeleted")){
              %>  
                <% if (s[17].equalsIgnoreCase("pending")) {%>
                <td><h4><b><%=s[15]%></b></h4></td>
                <td><h4 align="left">Dear, <b><%=s[1]%></b> , Your Appointment at <b><%=s[6]%></b> , Dated <b><%=s[12]%></b>,
                                        at <b><%=s[13]%></b>  is still <b><font color="#e6e600">Pending</font></b>. Wait for the response from the lab.</h4></td>
                  <td><h4><%=s[18]%></h4></td>  
<td>
    <form action="deleteAppointmentServlet" method="post">
    <input type="submit"  value="Cancle" name="deleteButton" class="btn btn-info btn-lg"/> 
    <input type="hidden" name="aid" value=<%=s[15]%> />
    </form>
</td>
                              
 
                             
                  
                <%} else {
                                if (s[17].equalsIgnoreCase("confirmed")) {%>
                                <td><h4><b><%=s[15]%></b></h4></td>
                                <td><h4 align="left">Dear,<b><%=s[1]%></b> Your Appointment at Lab  <b><%=s[6]%></b>, Dated <b><%=s[12]%></b>,
                                        at <b><%=s[13]%></b> has been <font color="green"><b><%=s[17]%></b></font></br></br></h4></td>
                <td><h4><%=s[18]%></h4></td>
<% String aDate=s[12];
SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
Date date = formatter.parse(aDate);
System.out.println(formatter.format(date));
  Calendar cal = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            String Today = sdf.format(cal.getTime());
            System.out.println("Current date in String Format: " + Today);
            
SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MM-yyyy");
Date date1 = formatter1.parse(Today);
System.out.println(formatter1.format(date1));

int c = date.compareTo(date1);
System.out.println("comparison of dates"+c);


%>
<%if(c>0){%>
 <td>
   <form action="deleteAppointmentServlet" method="post">  
     <input type="submit"  value="Cancle" name="deleteButton" class="btn btn-info btn-lg"/>
      <input type="hidden" name="aid" value=<%=s[15]%> />
   </form>
</td>
                              

<%}%>
<%if(c==0){%>
<td><h4>Can't cancle</h4>
</td>
                              
<%}%>

            </tr>
            
            <%
            if (s[14].equalsIgnoreCase("home")) {
                 
            if (s[23].startsWith("L")) {%>
            <tr>
             <td colspan="4">   
                 <div class="alert alert-info">
                 <h4>Details of Lab Person ,who is going to visit your home.</h4>
                 </div>
                 <h4><b>Name: </b><%=s[21]%></h4>
                 <h4><b>Contact No:</b><%=s[22]%></h4>
             </td>
             </tr>
             <%}}%>
             
                <%}
           else {%>
<td><h4><b><%=s[15]%></b></h4></td>
<td colspan="2"><h4 align="left">Dear,
        <b><%=s[1]%></b> Your appointment at <%=s[6]%>  has been <font color="red"><b>Rejected</b>. </font></h4></td>

               

<tr><td colspan="4">
        <div class="alert alert-info">
        <h4> Your appointment has been rejected because of following reason/reasons.</h4>
        </div>
        <h4> <%=s[20]%></h4>
    </td></tr>
       
        
                <%}}
                }
if(s[24].equalsIgnoreCase("deleted")){%>
<% if (s[17].equalsIgnoreCase("pending")) {%>
              <td style="background-color: #E5E5E5;"><h4><b><%=s[15]%></b></h4></td>
<td colspan="3" style="background-color: #E5E5E5;"><h4 align="left">Dear, <b><%=s[1]%></b> , Your Appointment at 
              <b><%=s[6]%></b> , Dated <b><%=s[12]%></b>,
              at <b><%=s[13]%></b> has been <b><font color="000000">Cancled</font></b> by you.
            
                  
                <%} 
else{
                                if (s[17].equalsIgnoreCase("confirmed")) {%>
<td style="background-color: #E5E5E5;"><h4><b><%=s[15]%></b></h4></td>
<td colspan="3" style="background-color: #E5E5E5;"><h4 align="left">Dear, <b><%=s[1]%></b> , Your Appointment at 
              <b><%=s[6]%></b> , Dated <b><%=s[12]%></b>,
              at <b><%=s[13]%></b> has been <b><font color="000000">Cancled</font></b> by you.
                
            </tr>
            
      
             
                <%}
           else {%>
<td><h4><b><%=s[15]%></b></h4></td>
<td colspan="2"><h4 align="left">Dear,
        <b><%=s[1]%></b> Your appointment at <%=s[6]%>  has been <font color="red"><b>Rejected</b>. </font></h4></td>

               

<tr><td colspan="4">
        <div class="alert alert-info">
        <h4> Your appointment has been rejected because of following reason/reasons.</h4>
        </div>
        <h4> <%=s[20]%></h4>
    </td></tr>
       
        
                <%}}                
                
                
}%>
    </tr> 
    <%}%>
</table>
          </div>
      </div>
 </div>
   </div>
</div>
    

    </body>
</html>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>

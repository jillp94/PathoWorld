<%-- 
    Document   : LabProfilePage
    Created on : 13 Jan, 2016, 10:27:49 AM
    Author     : Sony
--%>
 <jsp:include page="headerForLab.jsp"></jsp:include>

<%@page import="java.lang.String"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                
<script>
                    $(document).ready(function () {

                        $(".taglist").hide();
                        
                        $("#testlist").click(function () {
                            $(".taglist").show();
                            $(".taglist input").click(function () {
                                $(".taglist").show();
                                $("#testlist").text('');
                                $(".taglist :checked").each(function () {
                                    $("#testlist").append($(this).val()+"," + "\n");
                                });
                            });
                        });
                    });
 </script>
 <style type="text/css">
		.center_div{
    margin: 0 auto;
    width:80% /* value of your choice which suits your alignment */

}
 label{
                        font-family: "Times New Roman, Times, serif";
                        padding: 10px 25px 10px 10px;
                        font-size: 20px;
                        color:#330066;
                        
                        
                    }
.style3 {font-size: 9px}
        .style4 {
	font-size: 36px;
	font-family: 'Glyphicons Halflings';
	color: #330066;}

td{ font-family:"Times New Roman, Times, serif";
    font-size: 20px;
    color:#FFFFFF;
    
}
        </style>
        <script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
   
});
  
</script>
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

 <%
 try{
 if(session.getAttribute("status").equals("true"))
      {
          System.out.println("I m in update if part");
 System.out.println(session.getAttribute("Labid").toString());
 String s[]=new model.database().getdata(session.getAttribute("Labid").toString());
 for(int i=0;i<s.length;i++){
    System.out.println("In Updatelabprofile value of lab info are....."+i+"=="+s[i]);
 }
 %>
 
    </br></br></br></br></br></br></br></br></br></br>
<div class="container">
   
  <div class="row">
     
    <div class="col-sm-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
            
            <h1><font color="#ffffff" face="Times New Roman, Times, serif">Update your Profile Page!!</font></h1>
  
          </div>
          <div class="panel-body">
              
           
            <div class="col-sm-12">
                
          <% try
    {
    if(request.getParameter("er").equals("1")){%>
    <font size="+2" color="#4cae4c;" face="Times New Roman, Times, serif">
    <div class="alert alert-success">Your Profilepage has been successfully <b>Updated</b>
     .</div>                                     
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
        1.For edit Email-Id, Lab Name & Lab Admin name,  goto <a href="updateLabEmailPwd.jsp"> My Account</a> page</h4>
          </div>
          
 <form role="form" action="labProfileUpdateServlet" method="post" class="login-form"  enctype="multipart/form-data" >
        <div class="form-group">  
            <h4 align="left">Laboratory Profile Photo:</h4>
         <input type="file" name="blog_file" value="<%=s[16]%>"  class="form-horizontal form-control" required="true"  >
         </div>                                       
         <div class="form-group">  
         <h4 align="left">Laboratory Name:</h4>
         <input type="text" name="lname"  class="form-horizontal form-control" value="<%=s[1]%>" required="true" readonly="reaonly">
         </div>     
         <div class="form-group">  
         <h4 align="left">Laboratory Admin Name:</h4>
         <input type="text" name="ladmin"  class="form-horizontal form-control" value="<%=s[11]%>" required="true" readonly="reaonly">
         </div>  
         <div class="form-group">  
         <h4 align="left">Laboratory Contact1:</h4>
         <input type="text" name="lcontact1" class="form-horizontal form-control" maxlength="10" value="<%=s[2]%>" required="true">
         </div>
         <div class="form-group">  
         <h4 align="left">Laboratory Contact2:</h4>             
         <input type="text" name="lcontact2" class="form-horizontal form-control" maxlength="10" value="<%=s[3]%>" required="true">
           
         </div>
         <div class="form-group">  
         <h4 align="left">Laboratory E-mail:</h4>
         <input type="text" name="lemail" class="form-horizontal form-control" value="<%=s[4]%>" required="true" readonly="readonly">
        </div> 
         <div class="form-group"> 
            <h4 align="left">Address Line1:</h4>
         <input type="text" name="laddressline1"  value="<%=s[5]%>"  class="form-horizontal form-control ">
        </div>
        <div class="form-group"> 
            <h4 align="left">Address Line2:</h4>
         <input type="text" name="laddressline2" value="<%=s[6]%>"  class="form-horizontal form-control "  required="true">
        </div>
         <div class="form-group"> 
            <h4 align="left">Area:</h4>
         <input type="text" name="larea" value="<%=s[7]%>"  class="form-horizontal form-control"  required="true">
        </div>
          <div class="form-group"> 
            <h4 align="left">City:</h4>
         <input type="text" name="lcity" value="<%=s[8]%>"  class="form-horizontal form-control "  required="true">
        </div>
        <div class="form-group"> 
            <h4 align="left">Pincode:</h4>
         <input type="text" name="lpincode" value="<%=s[9]%>" class="form-horizontal form-control "  required="true">
        </div>
       			                        
        <div class="form-group">
            <h4 align="left">Working Hours of Lab:</h4>
       <% 
           String myTime = "6:30 AM";
             SimpleDateFormat df = new SimpleDateFormat("hh:mm a");
            Date d = df.parse(myTime); 
             
    
        Calendar cal1 = Calendar.getInstance();
       cal1.setTime(d);%>
       
       <select name="lhrs1" class="form-control form-horizontal">
       <% for (int i = 0; i <= 34; i++) {
            cal1.add(Calendar.MINUTE,30);%>
           <option value = "<%=df.format(cal1.getTime())%>"><%=df.format(cal1.getTime())%></option>
            
           <%     
        }%>
        
       </select></br><h4 align="center">To</h4>  
       <% String myTime1 = "11:30 AM";
        SimpleDateFormat df1 = new SimpleDateFormat("hh:mm a");
            Date d1 = df1.parse(myTime1); 
             
    
        Calendar cal2 = Calendar.getInstance();
       cal2.setTime(d1);%>
       
        <select name="lhrs2" class="form-control">
       <% for (int i = 0; i <= 34; i++) {
            cal2.add(Calendar.MINUTE,30);%>
           <option value = "<%=df1.format(cal2.getTime())%>"><%=df1.format(cal2.getTime())%></option>
            
           <%     
        }%>
        </select>             
        </div>
        <div class="form-group">  
         <h4 align="left">Available Pathology Tests:</h4>
         <textarea  name="ltests"  id="testlist"  class="form-control" rows="12"><%=s[12]%></textarea>
        </div>
        <div class="taglist form-group ">        
                    
    <% Iterator ia2 = new model.database().searchTest().iterator();
 while(ia2.hasNext())
 {
                        
String s1[]=((String)ia2.next()).split(",");%>

    <%for(int i=0;i<s1.length;i++){%>
    <h4 align="left">
   
        <input type="checkbox" name="test" value="<%=s1[i]%>"  class=" form-horizontal"/><%=s1[i]%></h4></br>
<%}%>

 <%}%>
   
 </div>



<div class="form-group">
    <h4 align="left">Advanced Facilities</h4>
    <textarea  name="lfacilities" class="form-control form-horizontal" rows="8"><%=s[13]%></textarea>
</div>
<div class="form-group">
    <h4 align="left">Which type of services are provided? </h4>
 <h4 align="left">
  
    <input type="radio" name="lservices" value="centerVisit" checked="checked" />We have Center visit Facility.&nbsp;&nbsp;
    <input type="radio" name="lservices" value="homeVisit"  />We have Home Visit Facility.&nbsp;&nbsp;
    <input type="radio" name="lservices" value="BothVisit"  />We provide Both services.&nbsp;
 </h4>
</div>
<div class="form-group">
    <h4 align="left"></br>Write Something about your Lab </h4>

    <textarea  name="labout"  class="form-control form-horizontal" rows="10"><%=s[15]%></textarea>
</div>
  <h3> <input type="submit" class="btn btn-block btn-primary"  style="display: block; height: 50px; font-size: 25px;" value="Update my Profile Page" /></h3>    </div>
 
   </div>
                                           
          
 
		
			                  
            </div>
          </div>
      </div></div>
     		                    </form>               
                
           

 
                                                                 
                                                            <% }}
                                                  catch(Exception e)
                                                      
                                                  {
                                                            System.out.println("Exception in Update page:"+e);%>
                                                  
            </br></br></br></</br></br></br></br></br></br></br></br></br></br>
                                                            <a href="login.jsp">Please Login first</a>
                                                            <%}%>

                                                            </body>
                                                            </html>
<jsp:include page="footer.jsp"></jsp:include>
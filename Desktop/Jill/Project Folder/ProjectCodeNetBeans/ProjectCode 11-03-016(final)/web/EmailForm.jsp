
<jsp:include page="headerForLab.jsp"></jsp:include>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send an e-mail with attachment</title>
<style>
.panel {
    border: 1px solid #003399; 
    border-radius:0;
    transition: box-shadow 0.5s;
}
h1,h2,h3,h4,h5
{
    font-family:"Times New Roman, Times, serif";
}

.panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
}

.panel-footer .btn:hover {
    border: 1px solid #003399;
    background-color: #fff !important;
    color: #f4511e;
}

.panel-heading {
    color: #fff !important;
    background-color:#1b6d85 !important;
    padding: 25px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-bottom-left-radius: 0px;
    border-bottom-right-radius: 0px;
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
    background-color: #003399;
    color: #fff;
} 
    
</style>
</head>
<body>
    
    <% String aId=request.getParameter("aid");
        
    String s[]=new model.database().AppointmentDataForReportPage(aId);
    for(int i=0;i<25;i++){
    System.out.println("Appointment data is:::"+i+"-->"+s[i]);
    }
    %>
    </br></br></br></br></br></br></br></br></br></br>
<div class="container">
  
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
            
            <h1><font color="#ffffff" face="Times New Roman, Times, serif">Send Report</font></h1>
  
            
        </div>
        <div class="panel-body">
  
    <form action="SendMailAttachServlet" method="post" enctype="multipart/form-data">
       
            <input type="hidden" name="aid" value="<%=s[15]%>" />
            
<div class="form-group">  
<h4 align="left">Patient's Email-Id</h4>
<input type="text" name="recipient" value="<%=s[5]%>" class="form-horizontal form-control"/>
</div>
<div class="form-group">  
<h4 align="left">Subject</h4>
<input type="text" name="subject" value="Pathology Test Report" size="50" class="form-horizontal form-control"/>
</div>
<div class="form-group">  
<h4 align="left">Content</h4>
            
<textarea rows="20" cols="90" name="content" class="form-control form-horizontal">
                    
Dear <%=s[1]%> , Please find your Test report attached below.

Appointment Date: <%=s[12]%>
Appointment Time: <%=s[13]%>
                        
Thank you for choosing us!!!
                        
                        
<%=s[6]%>
Ph: <%=s[9]%>
Email-Id: <%=s[8]%>
                            
Thank You.
</textarea>
</div>
<div class="form-group">  
<h4 align="left">Attachment</h4>
<input type="file" name="file" class="form-control form-horizontal"  />
</div>
<div class="panel-footer">
<input type="submit" value="Send Report" class="btn btn-lg btn-primary"/>
</div>
           
    </form>
 </div> 
    </div>
    </div>
  </div>
</div>
</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>
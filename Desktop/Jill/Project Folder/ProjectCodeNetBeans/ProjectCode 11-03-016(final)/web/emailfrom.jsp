<%-- 
    Document   : emailfrom
    Created on : Feb 25, 2016, 11:14:09 AM
    Author     : PC2
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send an e-mail</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<style>
.panel {
    border: 1px solid #f4511e; 
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
    background-color: #003399 !important;
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
    
<form action="EmailSendingServlet" method="post">
      
<div class="container">
  
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
            <% try
                                {
                                    if(request.getParameter("er").equals("1")){%>
                                    <div class="alert alert-success">
                                        <h3>
                                            Password has been sent successfully!! Check your mail.
                                        </h3>
                                    </div>
 
			
                                       <% }}
                                catch(NullPointerException ne){}
                            %>

                <div class="alert alert-info">
                    <h3 align="left">
                        Note:</br>
                        Give your Email-id, we will send you your password on this mail-address.  
                        
                    </h3>
                </div>
            
        </div>
        <div class="panel-body">
            <div class="alert alert-info">
                    <h4 align="left">
                     Enter your Email-Id: 
                    </h4>
                </div>

            <input type="text" name="recipient" size="50" class="form-control" width="50%"/>
            <input type="hidden" name="content" value="" />

        </div>
        <div class="panel-footer">
          
          <button class="btn btn-lg btn-primary">Send my Password</button>
          <a href="login.jsp"><input type="button" value="Back to Login Page" class="btn btn-lg btn-primary"></a>
        </div>
      </div> 
    </div>
      </form>
</body>
</html>
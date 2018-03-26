<%-- 
    Document   : feedback
    Created on : 25 Feb, 2016, 10:26:40 AM
    Author     : Sony
--%>
 <jsp:include page="header.jsp"></jsp:include>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
               <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PathoWorld</title>
        <script src="js/jquery.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
       
        
        <script src="js/jquery-ui-js.js"></script>
        <style>
    p,h4{
                font-family:"Times New Roman, Times, serif";
                color:#003399;
                font-size: 20px;

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
                background-color: #1b6d85 !important;
                padding: 25px;
                border-bottom: 1px solid transparent;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
                font-family:"Times New Roman, Times, serif";
            }
             h2,h3,h1{
               font-family:"Times New Roman, Times, serif"; }
             h1{
                 color: #fff;
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
            
        </style>

       
    </head>
    
    <body>

        
            
            <% try {
                if (session.getAttribute("status").equals("true")) {
                    String PId = session.getAttribute("PatientId").toString();
                   String PName = session.getAttribute("PatientName").toString();%>
                    <%
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String strDate = sdf.format(cal.getTime());
            System.out.println("Current date in String Format: " + strDate);%>
  <form action="feedbackServlet" method="post"> 
   </br></br></br></br></br></br></br></</br></br></br></</br>
   </br></br>
<div class="container">
   
  <div class="row">
     
    <div class="col-sm-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
            <%try{
         if(request.getParameter("er").equals("1")){%>
            <div class="alert alert-success">
                <h3> <strong>Thank You!!</strong>Your feedback has been posted to the lab Timeline.</h3>
</div>    
         <% }}
     catch(Exception e){}%>
        
     <h1><font color="#fff">Give Feedback</font></h1>
          <div class="alert alert-info">
          <h4 align="left"><font color="#000">Note: If you don't want to disclose your identity then,
              give a fake name in "Name" field </font></h4>
          </div>
          </font> </div>
        <div class="panel-body">
            <h4>Name:</h4></br>
            <p><input type="text" name="name" value="<%=PName%>" required="true"/></p></br>
            </br>
            <h4>Today's date:</h4>
            <p><%=strDate%></br><input type="hidden" name="date" value="<%=strDate%>" /></p>
            </br></br>
            
            <h4> Choose the lab for which you want to give feedback:</h4></br>
             <%
                model.database m1 = new model.database();
                Iterator ia = new model.database().searchLab().iterator();
            %>
            <select name="labName" class="form-control">
                <%
                    while (ia.hasNext()) {

                        String s[] = ((String) ia.next()).split(",");

                        for (int i = 0; i < s.length; i++) {%>
                <option value="<%=s[i]%>"><%=s[i]%></option><%}%>                 
                <%}%>
           </select></br>
           </br>
           <h4> Give feedback:</h4></br></br>
           <textarea name="feedback" rows="6" cols="60">
            </textarea>
           
           
           
            
        </div>
        <div class="panel-footer">
          
            <button class="btn btn-lg" style="background-color:#1b6d85; border-radius: 30px;">Submit the feedback</button>
            
        </div>
      </div> 
    </div> 
  </div>
</div>
  </form>                  
                   
       <jsp:include page="footer.jsp"></jsp:include>
           
 
       
        
        <%}
                    } catch (Exception e) {
                        System.out.println("exception:"+e);
                    }%>
    </body>
</html>


<%-- 
    Document   : search
    Created on : 29 Jan, 2016, 11:04:02 AM
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
                font-size: 40px;

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

.form-control {
    display: block;
    width: 100%;
    height: 34px;
    padding-bottom: 5px;
    padding-top: 5px;
    font-size: 20px !important;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
            .panel-footer .btn {
                margin: 15px 0;
                background-color: #f4511e;
                color: #fff;
            }
            
            input {
                font-size: 25px;
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
            try {
                if (session.getAttribute("status").equals("true")) {
                    String PId = session.getAttribute("PatientId").toString();
                    String PName = session.getAttribute("PatientName").toString();%>
                    </br></br></br></br></br></br></br></br></br></br></</br></br>
 
<div class="container">
   
  <div class="row">
     
    <div class="col-sm-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
            
            <h1><font color="#ffffff" face="Times New Roman, Times, serif">Search for Pathology Lab</font></h1>
  
          </div>
          <div class="panel-body">
            <%
                model.database m1 = new model.database();
                Iterator ia = new model.database().searchLab().iterator();
                Iterator ia2 = new model.database().DisplayLabList().iterator();
            %>
           <form action="searchlLabServlet" method="post">
 
            <div class="col-sm-6">
            <div class="alert alert-info">
                <h4>Search by Pathology Lab</h4>
            </div>
            <select name="labNames" class="form-control">
                <%
                    while (ia.hasNext()) {

                        String s[] = ((String) ia.next()).split(",");

                        for (int i = 0; i < s.length; i++) {%>
                <option value="<%=s[i]%>"><%=s[i]%></option><%}%>                 
                <%}%>
            </select>
            <input type="submit" class="btn btn-block btn-primary"
                   style="font-size: 20px; width: 250px; margin-top: 10px; margin-left: 120px;" 
                   value="Show the lab profile" />
          
            </div>
        </form>
           
          <form action="searchServlet" method="post">
        <div class="col-sm-6">
<div class="alert alert-info">
            <h4>Filter your Search</h4>
            </div>
             <font face="Times New Roman, Times, serif">
              <h4><b>Note:</b> First select the area for getting the list of Particular area.</br>
                The result will be displayed in the list box given below.
            </h4></font>
  
            <div class="col-sm-6">
                <select name="labArea" class="form-horizontal form-control" >
                <%
                    while (ia2.hasNext()) {

                        String s[] = ((String) ia2.next()).split(",");

                        for (int i = 0; i < s.length; i++) {%>
                <option value="<%=s[i]%>"><%=s[i]%></option><%}%>                 
                <%}%>
            </select>
                        </div>
            <div class="col-sm-6">
            <input type="submit" class="btn btn-block btn-primary" style="font-size: 20px; width: 150px; margin-bottom: 10px;" value="Filter" />
           
            </div>
            
            <div class="col-sm-12">
             
              <%

                Iterator ia0 = new model.database().searchLabByArea(session.getAttribute("area").toString()).iterator();
            %>
            </form>
  <form action="searchlLabServlet" method="post">
            
            <select name="labNames" class="form-horizontal form-control">
                <%
                    while (ia0.hasNext()) {

                        String s[] = ((String) ia0.next()).split(",");

                        for (int i = 0; i < s.length; i++) {%>
                <option><%=s[i]%></option><%}%>                 
                <%}%>
            </select>
               <input type="submit" class="btn btn-block btn-primary"
                      style="font-size: 20px; width: 250px; margin-top: 10px; margin-left: 120px;" 
                      value="Show the lab profile" />
            
            </form>
            </div>
        </div>     
        </div>
      </div>
    </div>
  </div>
      
</div>

           
                       
        <%} else {%>
        <a href="login.jsp">Please login First</a>
        <%}
        } catch (Exception e) {%>
        <a href="login.jsp">Please login First</a>
        <%
                System.out.println("Exception" + e);
            }
        %>                     

    </body>
</html>

<jsp:include page="footer.jsp"></jsp:include>
     <jsp:include page="header.jsp"></jsp:include>
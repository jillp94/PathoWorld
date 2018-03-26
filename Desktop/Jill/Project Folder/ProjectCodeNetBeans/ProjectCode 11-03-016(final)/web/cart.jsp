<%-- 
    Document   : cart
    Created on : 27 Jan, 2016, 11:36:36 AM
    Author     : Sony
--%>

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
            
        </style>

    </head>
    <body>
        <%
            try {
                if (session.getAttribute("status").equals("true")) {
                    String PId = session.getAttribute("PatientId").toString();
                    String PName = session.getAttribute("PatientName").toString();%>
</br></br></br></br></br>
</br></br>
      </br>
      </br></br>
      </br>
<div class="container">
   
  <div class="row">
     
    <div class="col-sm-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
            <h1><font color="#ffffff" face="Times New Roman, Times, serif">Items in your cart</font></h1>
  
          </div>
          <div class="panel-body">
        


        <h2>
            <%
                String cartitems[] = session.getAttribute("TIdName").toString().split(",");
            %></h2>
            <table border="2" class="table table-responsive">
                <tr> 
                    <th><h4><center><b>
                    Test Name
                    </b></center></h4></th> 
                    <th><h4><center><b>
                    Remove the Test from here
                        </b></center></h4> </th>
                </tr>
            <%for (int i = 0; i < cartitems.length; i++) {%>
            <tr>
            <form action="removeServlet" method="post">

                <td><font color="black"  size="+1" face="Times New Roman, Times, serif"><%=cartitems[i]%></td>
                <td><input type="submit"  class="btn btn-block btn-primary" value="Remove" name="deleteItem" /></td>
                <input type="hidden" name="rtests" value=<%=cartitems[i]%>  />
            </form>
            <%}%>

        </tr>

    </table>        
            <h4> <a href="book.jsp"><input type="button" class="btn btn-block btn-primary" style="display: block; height: 50px; font-size: 25px;" value="Book my appointment for above tests">   
                </a></h4>
                </div>   
            
        </div>      
      </div>
    </div>    
  </div>
      
</div>     
    <%}
    } catch (Exception e) {%>
    <h3>Hello User</h3>
    <a href="login.jsp">Please login First</a>

    <% System.out.println("Exception" + e);
        }
    %>     
</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>
 <jsp:include page="header.jsp"></jsp:include>
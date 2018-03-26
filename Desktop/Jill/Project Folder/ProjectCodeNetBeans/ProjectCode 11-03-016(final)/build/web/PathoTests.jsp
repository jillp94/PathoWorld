<%--
   
Document   : PathoTests
    Created on : 25 Jan, 2016, 11:10:54 AM
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
            th{
                background-color: #285e8e;
                font-size:20px;
                color:#FFFFFF;
                font-family: "Times New Roman, Times, serif";
            }

td {
    text-align: left;
    padding: 8px;
    font-family: "Times New Roman, Times, serif";
}
</style>
   
    </head>
    <body>

        <%
            try {
                if (session.getAttribute("status").equals("true")) {
                    String PId = session.getAttribute("PatientId").toString();
                    String PName = session.getAttribute("PatientName").toString();%>
                  
                    <div class="container table-responsive">
                        </br>
                        </br></br></br></br></br>
                        </br></br></br></br>
       

        <%

            try {
                if (request.getParameter("er").equals("1")) {%>
                    <div class="alert alert-warning">
                        <strong><h4>Warning!</h4></strong> <h4>This item is already added into your car.</h4>
                    </div>
                    

               <% }
            } catch (NullPointerException ne) {
            }
        %>
        <table border="2" class="table table-hover">

            <%
                model.database m1 = new model.database();
                int j=0;
                Iterator ia = new model.database().viewPathoTests().iterator();
                String columns[] = {"Test Name", "Also kown as", "Why to get Tested?", "When to get Tested?", "Sample Requiered","Preparation Needed"};
            %>
            <tr>
                <%
                    for (int i = 0; i < columns.length; i++) {%>
                <th><%=columns[i]%></th>
                    <% }%>
            </tr> 
            <%
                while (ia.hasNext()) {
                    j++;
                    String s[] = ((String) ia.next()).split("#");
            %>
            <tr>
            <form action="TemporaryTestServlet" method="post">
                <td><b><%=s[0]%></b></td> 
                <% for(int i = 1; i < s.length; i++) {%>
             <td>
                 <button type="button" class="btn btn-default" data-toggle="collapse" data-target="#<%=j%><%=i%>">Show more Details </button>
               <div id="<%=j%><%=i%>" class="collapse">
             <%=s[i]%>
             </div>
            </td> <%}%>
            <td><button type="submit"  value="Add to cart" class="btn btn-info btn-lg"/> <span class="glyphicon glyphicon-shopping-cart">AddToCart</span></td>
                
                                <input type="hidden" name="testName" value=<%=s[0]%> />
            </form>
        </tr>

        <%}%>

    </table>
    </div>
      <jsp:include page="footer.jsp"></jsp:include> 
    <%}
    } catch (Exception e) {%>
    <h3>Hello User</h3>
    <a href="login.jsp">Please login First</a>

    <% System.out.println("Exception" + e);
        }
    %>                     
                    </div>
</body>
</html>
<jsp:include page="header.jsp"></jsp:include>
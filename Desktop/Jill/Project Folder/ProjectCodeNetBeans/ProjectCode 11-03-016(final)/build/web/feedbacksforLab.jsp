<%-- 
    Document   : feedbacksforLab
    Created on : 26 Feb, 2016, 10:42:51 AM
    Author     : Sony
--%>

<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PathoWorld</title>
    </head>
    <body>
       <%
            try {
                if (session.getAttribute("status").equals("true")) {%>
                
                
                <% model.database m1 = new model.database();
                String labid = request.getSession().getAttribute("Labid").toString();
                String lname = request.getSession().getAttribute("LabName").toString();
                               
                %>
                 <table border="2">
                <%
                
                Iterator ia = new model.database().viewPatientFeedback(lname).iterator();
                
                String columns[] = {"Patient's Name", "Date", "Feedback Content"};
                %>
                <tr>
                    <% for (int i = 0; i < columns.length; i++) {%>
                    <th><%=columns[i]%></th>
                        <% }%>
                </tr> 
                <%  while (ia.hasNext()) {
                    String s[] = ((String) ia.next()).split(",");%>
                <tr>
                    
                    <td><%=s[0]%></td> 
                    <td><%=s[1]%></td> 
                    <td><%=s[3]%></td> 
                </tr>
                <%}%>
            </table>


                <%}}
            catch(Exception e)
            {%>
                 <a href="login.jsp">Please login First</a>

            <% System.out.println("Exception in feedbacks"+e);
                
            }%>

    </body>
</html>

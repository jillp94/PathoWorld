/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static model.database.counter;

/**
 *
 * @author Sony
 */
@WebServlet(name = "bookAppointmentServlet", urlPatterns = {"/bookAppointmentServlet"})
public class bookAppointmentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html><body>");
            model.database m1 = new model.database();

            String values[] = new String[17];

            values[0] = request.getParameter("pid");
             System.out.println("appoint:"+values[0]);
            values[1] = request.getParameter("pname");
             System.out.println("appoint:"+values[1]);
            values[2] = request.getParameter("pcontact1");
             System.out.println(values[2]);
            values[3] = request.getParameter("pcontact2");
             System.out.println(values[3]);
            values[4] = request.getParameter("paddress");
             System.out.println(values[4]);
            values[5] = request.getParameter("pemail");
            System.out.println(values[5]);
            values[6] = request.getParameter("lname");
             System.out.println(values[6]);
            values[7] = request.getParameter("tests");
             System.out.println(values[7]);
            values[8] = request.getParameter("lemail");
             System.out.println(values[8]);
            values[9] = request.getParameter("lcontact1");
             System.out.println(values[9]);
            values[10] = request.getParameter("lcontact2");
             System.out.println(values[10]);
            values[11] = request.getParameter("laddress");
             System.out.println(values[11]);

            values[12] = request.getParameter("adate");
             System.out.println(values[12]);
            values[13] = request.getParameter("atime");
             System.out.println(values[13]);

            values[14] = request.getParameter("servicetype");
             System.out.println(values[14]);
            
            counter = new model.database().incrementCounter();
            counter =counter+ 1;

            values[15] = "A" + counter + values[1].substring(0, 2) + values[6].substring(0, 3);
             System.out.println(values[15]);
            System.out.println("And the counter in servlet is "+values[15]);
            values[16] = request.getParameter("lid");
           System.out.println(values[16]);
            if (new model.database().insertAppointmentData(values)) {
                // values[15]="A"+m1.counter+values[1].substring(0,2)+values[6].substring(0,3);
                //System.out.println("m1 counter"+m1.counter);
                 request.getRequestDispatcher("book.jsp?er=1").forward(request, response);
                out.println("<h3>Record is successfully inserted..</h3>");
                out.println("<h3>wait for the confirmation..</h3>");
                out.println("<h3><a href=homePage.jsp >Go to home Page</a></h3>");

            } else {
                out.println("<h1>Some of the fields are null. You must fill them to confirm the appointment</h1>");
                request.getRequestDispatcher("book.jsp").forward(request, response);
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

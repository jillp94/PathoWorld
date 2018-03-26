/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sony
 */
@WebServlet(name = "confirmRejectAppointmentServlet", urlPatterns = {"/confirmRejectAppointmentServlet"})
public class confirmRejectAppointmentServlet extends HttpServlet {

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
            String buttonType, pid, aid, pname, adate, atime,reason="Reason:",lpn="-",lpc="-";
            buttonType = request.getParameter("btype");
            pid = request.getParameter("pid");
            aid = request.getParameter("aid");
            pname = request.getParameter("pname");
            adate = request.getParameter("adate");
            atime = request.getParameter("atime");
            reason = reason+request.getParameter("reason");
             String details[] = new String[2];
            
             details[0]= request.getParameter("lpname");
             details[1] = request.getParameter("lpcontact");

// String reason=request.getParameter("reason");
            
            model.database m1 = new model.database();
            
         
            if (buttonType.startsWith("C")) {
                String value = "Confirmed";
                if (m1.updateAppointmentStatus(value, aid)) {
                    System.out.println("Record is successfully updated..");
                    //System.out.println("details:"+pid+aid+pname+adate+atime);

                    request.getRequestDispatcher("appointment.jsp").forward(request, response);
                }
            }
           else if (buttonType.startsWith("G")) {
               String value = "Sent";
                if (m1.updateRejectionStatus(value, aid)) {
                    System.out.println("Record is successfully updated..");
                    System.out.println("reason for rejection:"+reason);
                    if (m1.updateRejectionReason(reason, aid)) {
                    request.getRequestDispatcher("appointment.jsp").forward(request, response);
                }}
              }
             else if (buttonType.startsWith("S")) {
               String value = "Lab Person Details:Sent";
                if (m1.updateLabPersonDetailsStatus(value, aid)) {
                    System.out.println("Record is successfully updated..");
                    System.out.println("Details are:"+lpn+lpc);
                    if (m1.updateLabPersonDetail(details,aid)) {
                    request.getRequestDispatcher("appointment.jsp").forward(request, response);
                }}
              }
          
            
            else {
                String value = "Rejected";
               
                         //System.out.println( "reason is"+reason);
                if (m1.updateAppointmentStatus(value, aid)) {
                    System.out.println("Record is successfully updated.. of" + aid);
                    System.out.println("Record is successfully updated..");

                    System.out.println(("Sorry, Rejected"));
                    request.getRequestDispatcher("appointment.jsp").forward(request, response);
                }
            }
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

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
@WebServlet(name = "LabSignUpServlet", urlPatterns = {"/LabSignUpServlet"})
public class LabSignUpServlet extends HttpServlet {

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
            out.println("<html>");

            String values[] = new String[9];

            values[1] = request.getParameter("lname");
            values[2] = request.getParameter("ladmin");
            values[3] = request.getParameter("lcontact1");
            values[4] = request.getParameter("lcontact2");
           
            values[5] = request.getParameter("lemail");
            values[6] = request.getParameter("lpassword");

            values[0] = "L" + values[1].substring(0, 3) + values[3].substring(7, 10);
             model.database m1 = new model.database();
            if (new model.database().labSignUp(values)) {
                System.out.println("in Sign Up Servlet:"+m1.labIdAfterSignUp);
                 request.getSession().setAttribute("labIdAfterSignUp",values[0]);
                //out.println("<h1>Record is successfully inserted..</h1>");
                request.getRequestDispatcher("LabProfilePage.jsp?er=2").forward(request, response);
            } else {
                out.println("<h1>Record is not successfully inserted..</h1>");
            }
            request.getRequestDispatcher("LabSignUp.jsp").forward(request, response);
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

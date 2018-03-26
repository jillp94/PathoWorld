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
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
             request.getSession().setMaxInactiveInterval(60*60*24);
            // request.getSession().setAttribute("staus","true");
            System.out.println(request.getSession().getAttribute("uri"));
            model.database m1 = new model.database();
            request.getSession().setAttribute("filter", "");
            request.getSession().setAttribute("area", "");
            if (request.getSession().getAttribute("uri").equals("reset")) {

                String newpassword = request.getParameter("newpwd");
                String oldpassword = request.getParameter("oldpwd");
                String email = request.getParameter("email");

                if (m1.update(oldpassword, newpassword, email)) {
                    out.println("Update succesfully");
                    // response.sendRedirect("login.jsp");
                    //  return true;
                    out.println("<a href=login.jsp>go to login Page</a>");
                } else {
                    out.println("Error!!");
                    request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);

                }
            } else {
                String userType = request.getParameter("person");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String id = request.getParameter("pId");

                if (m1.loginCheck(username, password, userType)) //check username and password
                {
                    System.out.println("Logged in Successfully");
                    request.getSession().setAttribute("status", "true"); //if patient/lab Person is logged in set the status=true

                    request.getSession().setAttribute("TIdName", "");
                    request.getSession().setAttribute("LabName", "");

                    if (m1.id.charAt(0) == 'p') {
                        request.getSession().setAttribute("PatientId", m1.id);
                        request.getSession().setAttribute("PatientName", m1.patientname);

                        request.getRequestDispatcher("homePage.jsp").forward(request, response);
                    } else {
                                    System.out.println("login servlet :");
                                
                                System.out.println("LabId :"+ m1.id);
                                System.out.println("LabId :"+ m1.labname);
                                System.out.println("LabId :"+ m1.labAdmin);
                                
                        request.getSession().setAttribute("Labid", m1.id);
                        request.getSession().setAttribute("LabName", m1.labname);
                        request.getSession().setAttribute("LabAdmin", m1.labAdmin);
                        request.getSession().setAttribute("staus", "true");
                        request.getRequestDispatcher("LabHomePage.jsp").forward(request, response);
                    }
                } else {
                    out.println("Error!!");
                    request.getRequestDispatcher("login.jsp?er=1").forward(request, response);
                }
            }

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

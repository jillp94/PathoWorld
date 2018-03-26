/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author Sony
 */
@WebServlet(name = "removeServlet", urlPatterns = {"/removeServlet"})
public class removeServlet extends HttpServlet {

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
            String removeTests = request.getParameter("rtests");
            System.out.println("the test for remove is:" + removeTests);

            String cartitems[] = request.getSession().getAttribute("TIdName").toString().split(",");
            for (int i = 0; i < cartitems.length; i++) {
                System.out.println("  cartitems are:" + cartitems[i]);
            }

            ArrayList<String> newcart = new ArrayList<String>(Arrays.asList(cartitems)); // change the array to a list of integers

            newcart.remove(removeTests);// remove the item 

            Iterator ia = newcart.iterator();
            String s = "";
            while (ia.hasNext()) {
                s += (String) ia.next() + ",";
                //System.out.println("final cart is:"+s);
            }

            //newcart.toString();
            System.out.println("newcart is:" + s);
            request.getSession().setAttribute("TIdName", s);
            request.getSession().setAttribute("RemoveTest", removeTests);

            String rt = request.getSession().getAttribute("RemoveTest").toString();
            request.getRequestDispatcher("cart.jsp").forward(request, response);

            out.println("</body></html>");
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

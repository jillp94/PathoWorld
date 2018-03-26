/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.UploadFile;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sony
 */
@WebServlet(name = "LabProfileServlet", urlPatterns = {"/LabProfileServlet"})
@MultipartConfig(fileSizeThreshold=1024*1024*10,    // 10 MB 
                 maxFileSize=1024*1024*50,          // 50 MB
                 maxRequestSize=1024*1024*100)      // 100 MB
public class LabProfileServlet extends HttpServlet {

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
 UploadFile uf=new UploadFile();
		String blog_file="";
		try
		{
			blog_file=new model.UploadFile().uploadFile(request, "C:/Users/Sony/Documents/NetBeansProjects/ProjectCode 11-03-016(final)/web/images");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
String lhr1=request.getParameter("lhrs1");
String lhr2=request.getParameter("lhrs2");
String lhrs=lhr1+" To "+lhr2;
            String values[] = new String[21];
            values[0] = request.getSession().getAttribute("labIdAfterSignUp").toString();
            values[1] = request.getParameter("lname");
            values[2] = request.getParameter("lcontact1");
            values[3] = request.getParameter("lcontact2");
            values[4] = request.getParameter("lemail");
            values[5] = request.getParameter("laddressline1");
            values[6] = request.getParameter("laddressline2");
            values[7] = request.getParameter("larea").toLowerCase();
            values[8] = request.getParameter("lcity");
            values[9] = request.getParameter("lpincode");
            values[10] =lhrs;
            
            values[11] = request.getParameter("ladmin");
            values[12] = request.getParameter("ltests");
            values[13] = request.getParameter("lfacilities");
            values[14] = request.getParameter("lservices");
            
            values[15] = request.getParameter("labout");
            values[16] = blog_file;
            
            
           
            if (new model.database().labProfileInsert(values)) {
                out.println("<h1>Record is successfully inserted..</h1>");
                request.getRequestDispatcher("login.jsp?er=8").forward(request, response);
            } else {
                out.println("<h1>Record is not successfully inserted..</h1>");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package view;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Security;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC2
 */
@WebServlet(name = "sendemail", urlPatterns = {"/sendemail"})
public class sendemail extends HttpServlet {

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
                String mailto = "viral85shah@gmail.com";
		String message = "hi hello";
		String subject = "hi";
		String mailfrom = "javaforv@gmail.com";
		String[] sendTo = { mailto };

		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
	         sendemail sendMailThroughJava = new sendemail();
		try {
			sendMailThroughJava.sendSSLMessage(sendTo, subject,	message, mailfrom);
			out.println("Mail sent successfully");
		} catch (MessagingException ex) {
			out.println("Error in sending mail");
		}
        }
    }
public void sendSSLMessage(String recipients[], String subject,	String message, String from) 
throws MessagingException {
		boolean debug = true;
		Properties ps = new Properties();
		ps.put("mail.smtp.host", "smtp.gmail.com");
		ps.put("mail.smtp.auth", "true");
		ps.put("mail.debug", "true");
		ps.put("mail.smtp.port", "465");
		ps.put("mail.smtp.socketFactory.port", "465");
		ps.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		ps.put("mail.smtp.socketFactory.fallback", "false");

		Session session = Session.getDefaultInstance(ps,new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() 
{
					return new PasswordAuthentication("javaforv@gmail.com", "return@java");
					}
				});
		session.setDebug(debug);
		Message msg = new MimeMessage(session);
		InternetAddress addressFrom = new InternetAddress(from);
		msg.setFrom(addressFrom);
		InternetAddress[] addressTo = new InternetAddress[recipients.length];
		for (int i = 0; i < recipients.length; i++) {
			addressTo[i] = new InternetAddress(recipients[i]);
		}
		msg.setRecipients(Message.RecipientType.TO, addressTo);
		msg.setSubject(subject);
                
                
        MimeBodyPart messageBodyPart = new MimeBodyPart();

        Multipart multipart = new MimeMultipart();

        messageBodyPart = new MimeBodyPart();
        String file = "path of file to be attached";
        String fileName = "attachmentName";
        DataSource source = new FileDataSource(file);
        messageBodyPart.setDataHandler(new DataHandler(source));
        messageBodyPart.setFileName(fileName);
        multipart.addBodyPart(messageBodyPart);

        msg.setContent(multipart);

		msg.setContent(message, "text/plain");
		Transport.send(msg);
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

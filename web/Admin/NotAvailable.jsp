<%--
    Document   : NotAvailable
    Created on : 20 Feb, 2020, 1:50:32 AM
    Author     : Denzil Rodrigues
--%>

<%@page import="java.util.Random"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                if (session.getAttribute("aname") == null) {
                    response.sendRedirect("AdminLogin.jsp? &ptr=asf");
                }
                String ma = request.getParameter("mail");
                String type = request.getParameter("typ");
                String typ = "";
                if (type.equals("bhk2")) {
                    typ = "2 BHK";
                } else if (type.equals("bhk3")) {
                    typ = "3 BHK";
                } else if (type.equals("bhk4")) {
                    typ = "4 BHK";
                }
                final String msg = "Sorry, no " + typ + " apartment are vacant.";
                final String sub = "Visit Appointment";
                final String to = ma;
                final String from = "maurishkapark007@gmail.com";
                final String pass = "Admin123#";
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");

                Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, pass);
                    }
                });
                MimeMessage message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(from));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject(sub);
                message.setText(msg);
                Transport.send(message);
                /*out.print("Mail Sent");*/
                response.sendRedirect("SendApointment.jsp? &ptr=sent");
            } catch (Exception e) {
                out.print(e.getMessage());
                response.sendRedirect("SendApointment.jsp? &ptr=error");
            }
        %>
    </body>
</html>

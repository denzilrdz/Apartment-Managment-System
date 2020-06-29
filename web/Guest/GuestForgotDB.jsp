<%--
    Document   : GuestPasswordDB
    Created on : 19 Feb, 2020, 11:40:15 PM
    Author     : Denzil Rodrigues
--%>

<%@page import="DBConnect.DBCon"%>
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
                boolean stat = false;
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                String pass1 = "";
                String mail = request.getParameter("mail");
                ResultSet rs = s.executeQuery("SELECT `password` FROM `guest_login` WHERE username='" + mail + "'");
                while (rs.next()) {
                    stat = true;
                    pass1 = rs.getString(1);
                }
                if (stat == false) {
                    out.print("User Not Found");
                }
                if (stat) {
                    final String msg = "Password for Maurishka park guest login is " + pass1;
                    final String sub = "Password for guest user";
                    final String to = mail;
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
                    /*out.print("Password Sent on mail");*/
                    response.sendRedirect("GuestForgot.jsp? &ptr=sent");
                }
                s.close();
                con.close();
            } catch (Exception e) {
                response.sendRedirect("GuestForgot.jsp? &ptr=error");
                out.print(e.getMessage());
            }
        %>
    </body>
</html>

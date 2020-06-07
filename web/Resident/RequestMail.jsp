<%--
    Document   : RequestMail
    Created on : 8 Feb, 2020, 12:31:40 PM
    Author     : Denzil Rodrigues
--%>

<%@page import="DBConnect.DBCon"%>
<%@page import="java.sql.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.*"%>
<%@page import="java.util.*"%>
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
                final String to = request.getParameter("email");
                String pass1 = "";
                String apno = "";
                boolean send = false;
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                ResultSet rs = s.executeQuery("SELECT password FROM TENENT_LOGIN where username='" + to + "'");
                while (rs.next()) {
                    send = true;
                    pass1 = rs.getString(1);
                }
                ResultSet rs1 = s.executeQuery("SELECT apart_no FROM TENENT_EMAIL where email='" + to + "'");
                while (rs1.next()) {
                    apno = rs1.getString(1);
                }
                final String msg = "Password for apartment " + apno + " is " + pass1;
                rs.close();
                rs1.close();
                s.close();
                con.close();
                final String sub = "Password for apartment portal login";
                final String from = DBCon.email;
                final String pass = DBCon.ePass;
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
                if (send) {
                    Transport.send(message);
                    /*out.print("Mail send");*/
                    response.sendRedirect("Mail.jsp? &ptr=sent");
                } else {
                    /*out.print("Tenent not registred. Please contact manager for details");*/
                    response.sendRedirect("Mail.jsp? &ptr=not");
                }
            } catch (MessagingException mex) {
                mex.printStackTrace();
                out.print(mex.getMessage());
                response.sendRedirect("Mail.jsp? &ptr=error");
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
    </body>
</html>

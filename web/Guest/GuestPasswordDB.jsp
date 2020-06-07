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
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                String mail = request.getParameter("mail");
                Boolean check = false;
                ResultSet rs = s.executeQuery("SELECT `regno` FROM `guest_login` WHERE `username`='" + mail + "'");
                while (rs.next()) {
                    check = true;
                }
                if (check) {
                    response.sendRedirect("GuestPassword.jsp? &ptr=exist");
                } else {
                    String abc = "qAr1sBt2C3D4E5F6G7H8I9J0KaLbMcNdOePfQgRhSiTjUkVlWmXnYoZp";
                    Random r = new Random();
                    int si = abc.length();
                    StringBuffer sb = new StringBuffer("");
                    for (int i = 0; i < 8; i++) {
                        sb.append(abc.charAt(r.nextInt(si)));
                    }

                    int i = s.executeUpdate("INSERT INTO `guest_login`(`username`, `password`) VALUES ('" + mail + "','" + sb + "')");
                    final String msg = "Password for Maurishka park guest login is " + sb;
                    final String sub = "Password for guest user";
                    final String to = mail;
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
                    Transport.send(message);

                    /*out.print("Password Sent on mail");*/
                    response.sendRedirect("GuestPassword.jsp? &ptr=sent");
                }
                s.close();
                con.close();
            } catch (Exception e) {
                response.sendRedirect("GuestPassword.jsp? &ptr=error");
                e.printStackTrace();
                out.print(e.getMessage());
            }
        %>
    </body>
</html>

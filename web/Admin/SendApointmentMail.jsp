<%-- 
    Document   : SendApointmentMail
    Created on : 20 Feb, 2020, 1:16:38 AM
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
            try{
                if(session.getAttribute("aname")==null)
                {
                    response.sendRedirect("AdminLogin.jsp");
                }
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL,DBCon.DBusername,DBCon.DBpassword);
                Statement s=con.createStatement();
            String ma=request.getParameter("mail");
            String da=request.getParameter("da");
            String type=session.getAttribute("type").toString();
            String typ="";
            if(type.equals("bhk2"))
                typ="2 BHK";
            else if(type.equals("bhk3"))
                typ="3 BHK";
            else if(type.equals("bhk4"))
                typ="4 BHK";
            int q=s.executeUpdate("INSERT INTO `appointment`(`email`, `type`, `adate`) VALUES ('"+ma+"','"+type+"','"+da+"')");
            int w=s.executeUpdate("UPDATE `guest_apart` SET `status`=1 WHERE `email`='"+ma+"'");
            if(q!=0 && w!=0)
            {
                final String msg="Vist appointment for apartment type "+typ+" is on "+da;
                final String sub="Visit Appointment";
                final String to=ma;
                final String from= DBCon.email;
                final String pass= DBCon.ePass;
                Properties props = new Properties();
                props.put("mail.smtp.host","smtp.gmail.com");
                props.put("mail.smtp.port","587");
                props.put("mail.smtp.auth","true");
                props.put("mail.smtp.starttls.enable","true");
            
                Session mailSession = Session.getInstance(props,new javax.mail.Authenticator() 
                {              
                    protected PasswordAuthentication getPasswordAuthentication()
                    {
                        return new PasswordAuthentication(from,pass);
                    }
                });
                MimeMessage message=new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(from));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject(sub);
                message.setText(msg);
                Transport.send(message);
                /*out.print("Appointment sent on mail");*/
                session.setAttribute("output", "s");
                response.sendRedirect("SendApointment.jsp");
            }
            s.close();
            con.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
                /*out.print(e.getMessage());*/
                session.setAttribute("output", "e");
                response.sendRedirect("SendApointment.jsp");
            }
        %>
    </body>
</html>

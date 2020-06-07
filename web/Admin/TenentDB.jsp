<%--
    Document   : TenentDB
    Created on : 6 Feb, 2020, 10:13:57 PM
    Author     : Denzil Rodrigues
--%>

<%@page import="DBConnect.DBCon"%>
<%@page import="java.util.Random"%>
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
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                String mail = request.getParameter("mail");
                String ano = request.getParameter("ano");
                boolean ptr=true;
                ResultSet rs = s.executeQuery("SELECT `regno`, `apart_no` FROM `tenent_email` WHERE `email`='"+mail+"'");
                while(rs.next())
                {
                    ptr=false;
                }
                
                if(ptr) {
                    int n = s.executeUpdate("insert into TENENT_EMAIL(email, apart_no) values('" + mail + "','" + ano + "')");
                    int q = s.executeUpdate("UPDATE `apartment` SET `status`=1 WHERE `apart_no`='" + ano + "'");
                    out.println("Number of rows effected are" + n);
                    String abc = "qAr1sBt2C3D4E5F6G7H8I9J0KaLbMcNdOePfQgRhSiTjUkVlWmXnYoZp";
                    Random r = new Random();
                    int si = abc.length();
                    StringBuffer sb = new StringBuffer("");
                    for (int i = 0; i < 8; i++) {
                        sb.append(abc.charAt(r.nextInt(si)));
                    }
                    n = s.executeUpdate("insert into TENENT_LOGIN values('" + mail + "','" + sb + "')");
                    session.setAttribute("output","success");
                    response.sendRedirect("TenentRegister.jsp");
                } else {
                    session.setAttribute("output","email");
                    response.sendRedirect("TenentRegister.jsp");
                }
                s.close();
                con.close();
            } catch (Exception e) {
                out.println(e.getMessage());
                session.setAttribute("output", "error");
                response.sendRedirect("TenentRegister.jsp");
            }
        %>
    </body>
</html>

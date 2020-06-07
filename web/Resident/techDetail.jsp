<%-- 
    Document   : techDetail
    Created on : 17 Feb, 2020, 7:20:27 PM
    Author     : Denzil Rodrigues
--%>

<%@page import="DBConnect.DBCon"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@include file="Header.jsp" %>
    </head>
    <body>
        <%
            try
            {
                if(session.getAttribute("tname")==null)
            {
                response.sendRedirect("TenentLogin.jsp");
            }
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL,DBCon.DBusername,DBCon.DBpassword);
                Statement s=con.createStatement();
                int tno=0;
                String da="";
                int cn=0;
                String tna="";
                boolean fi=false;
                int sno=0;
                ResultSet rs=s.executeQuery("SELECT `t_number`, `date`, service_number FROM `assign` WHERE email='"+session.getAttribute("tname")+"' AND status=0");
                while(rs.next())
                {
                    fi=true;
                    tno=rs.getInt(1);
                    da=rs.getString(2);
                    sno=rs.getInt(3);
                }   
                ResultSet rs1=s.executeQuery("SELECT `name`, `contact` FROM `technician` WHERE `slno`='"+tno+"'");
                while(rs1.next())
                {
                    tna=rs1.getString(1);
                    cn=rs1.getInt(2);
                }
                if(fi==false){ %>
                  <div class="alert alert-danger notavailable mt-5"> Technician not assigned</div>
                <% }
                else
                {
                    out.print("<br>Technician Name "+tna);
                    out.print("<br>Technician Contact "+cn);
                    out.print("<br>Date and time of assigning "+da);
                    out.print("<br>Service ID "+sno);
                    %>
                    <br><a href="updateTech.jsp? &sno=<%=sno%> &tno=<%=tno%>">Click here if the service is completed by the technician</a>
                    <%
                }
                s.close();
                con.close();
            }
            catch(Exception e)
            {
                out.println(e.getMessage());
            }
        %>
         <%@include file="Footer.jsp" %>
    </body>
</html>

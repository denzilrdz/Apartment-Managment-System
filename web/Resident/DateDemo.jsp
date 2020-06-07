<%-- 
    Document   : DateDemo
    Created on : 16 Feb, 2020, 11:41:30 AM
    Author     : Denzil Rodrigues
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            java.util.Date today=new Date();
            SimpleDateFormat cd=new SimpleDateFormat("yyyy-MM-dd");
            String cdate=cd.format(today);
            SimpleDateFormat sdf=new SimpleDateFormat("MM-dd");
            String da=sdf.format(today);
            SimpleDateFormat df=new SimpleDateFormat("yyyy");
            String ye=df.format(today);
            int year=Integer.parseInt(ye)+1;
            String edate=year+"-"+da;
            out.print(edate);
            out.print("<br>"+cdate);
            %>
            <form action="DateDemo1.jsp">
                Select Date<input type="date" name="dat" value="" /><br>
                <input type="hidden" name="cur" value="<%=edate%>" />
                <input type="submit" value="Submit" />
            </form>
    </body>
</html>

<%--
    Document   : GymMember
    Created on : 16 Feb, 2020, 12:11:55 PM
    Author     : Denzil Rodrigues
--%>

<%@page import="DBConnect.DBCon"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <%@include file="Header.jsp" %>
        <style>
       
        label{
            color:white;
        }
        </style>
    </head>
    <body>
        <%             try {
                if (session.getAttribute("tname") == null) {
                    response.sendRedirect("TenentLogin.jsp");
                }
                java.util.Date today = new Date();
                SimpleDateFormat cd = new SimpleDateFormat("yyyy-MM-dd");
                String cdate = cd.format(today);
                SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
                String da = sdf.format(today);
                SimpleDateFormat df = new SimpleDateFormat("yyyy");
                String ye = df.format(today);
                int year = Integer.parseInt(ye) + 1;
                String edate = year + "-" + da;
                java.util.Date curr = new SimpleDateFormat("yyyy-MM-dd").parse(cdate);
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                int regno = 0;
                int gymprice = 0;
                ResultSet rs2 = s.executeQuery("SELECT price FROM amenities_prices WHERE amenity_name='swim' ");
                while (rs2.next()) {
                    gymprice = rs2.getInt(1);
                }
                ResultSet rs = s.executeQuery("SELECT `regno` FROM `tenent_email` WHERE email='" + session.getAttribute("tname") + "'");
                while (rs.next()) {
                    regno = rs.getInt(1);
                }
                Random randomGenerator = new Random();
                int o_id = randomGenerator.nextInt(1000000);
                boolean status = false;
                ResultSet rs1 = s.executeQuery("SELECT `bdate`, `edate`, `status` FROM `gym_swimming` WHERE `regno`=" + regno);
                while (rs1.next()) {
                    status = rs1.getBoolean(3);
                    if (rs1.getBoolean(3) && (rs1.getDate(2).after(curr))) {%>
        <h3 style="Color:white;">Already a member till <%=rs1.getDate(2)%></h3>
        <%
                } else if (rs1.getBoolean(3) && (rs1.getDate(2).before(curr))) {
                    out.print("Membership expired");
                    status = false;
                }
            }
            if (status == false) {
                int a = s.executeUpdate("INSERT INTO `gym_swimming`(`regno`, `email`, `bdate`, `edate`, `o_id`, `status`) VALUES (" + regno + ",'" + session.getAttribute("tname") + "','" + cdate + "','" + edate + "','MPA" + o_id + "',0)");
        %>
        <div class="col-sm-9 col-md-5 ">
            <div class="jumbotron col-md-7 col-sm-9 mt-3 shadow-lg" style="background-color:#111;">
                <h3 class="display-5" style="text-align: center;color:white;">Gym Membership</h3>
        <form action="gymRedirect.jsp" method="POST">   
          <label>  Amount to be paid </label><input type="text" class="form-control" name="TXN_AMOUNT" value=<%=gymprice%> readonly="readonly" /><br>
           <label> Order ID </label><input type="text" class="form-control" name="ORDER_ID" value="MPA<%=o_id%>" readonly="readonly" />
            <input type="hidden" class="form-control" name="CUST_ID" value="<%=regno%>" />
            <input type="hidden" class="form-control" name="INDUSTRY_TYPE_ID" value="Retail" />
            <input type="hidden" name="CHANNEL_ID" value="WEB" />
            <input type="hidden" class="form-control" name="EMAIL" value="<%=session.getAttribute("tname")%>" />
            <br><label>Mobile Number</label><input type="text" class="form-control" name="MOBILE_NO" value="" /><br>
             <button class="btn btn-danger form-control" type="submit" value="PAY" >PAY</button>
        </form>
        <%
                }
                rs1.close();
                rs.close();
                s.close();
                con.close();
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
        <%@include file="Footer.jsp" %>
    </body>
</html>

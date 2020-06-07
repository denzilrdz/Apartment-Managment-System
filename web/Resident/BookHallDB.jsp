<%-- 
    Document   : BookHallDB
    Created on : 15 Feb, 2020, 11:32:49 AM
    Author     : A.D.S.F
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
        <%@include file="Header.jsp" %>
        <style>
        label{
            color:white;
        }
      h3
      {
          color:white;
      }
        </style>
    </head>
    <%
            if(session.getAttribute("tname")==null)
            {
                response.sendRedirect("TenentLogin.jsp");
            }
            try
            {
                Class.forName(DBCon.DriverURL);
            Connection con = DriverManager.getConnection(DBCon.DBURL,DBCon.DBusername,DBCon.DBpassword);
                Statement s=con.createStatement();
                int regno=0;
                int a=0;
                String email="";
                int hallprice=0;
               ResultSet rs1=s.executeQuery("SELECT regno, apart_no FROM tenent_email WHERE email='"+session.getAttribute("tname")+"'");
                while(rs1.next())
                {
                    regno=rs1.getInt(1);
                    email=rs1.getString(2);
                }
                 ResultSet rs2=s.executeQuery("SELECT price FROM amenities_prices WHERE amenity_name='hall' ");
                while(rs2.next())
                {
                    hallprice=rs2.getInt(1);
                }
                ResultSet rs=s.executeQuery("SELECT `status` FROM `hall_booking` WHERE date='"+request.getParameter("dat")+"'");
                while(rs.next())
                {
                    if(rs.getBoolean(1)==true)
                    {
                        a=1;
                        %>
                        <div class="alert alert-danger vv">Selected Date is not available, Please choose another date. </div>
                        <%
                           
                            response.sendRedirect("BookHall.jsp? &ptr=true");
                    }
                }
                if(a==0)
                    {
                        Random randomGenerator = new Random();
                        
                        int o_id = randomGenerator.nextInt(1000000);
                        int q=s.executeUpdate("INSERT INTO `hall_booking`(`regno`, `email`, `apart_no`, `date`, `status`, o_id) VALUES ("+regno+",'"+session.getAttribute("tname")+"','"+email+"','"+request.getParameter("dat")+"',0,'MPA"+o_id+"')");
                    %>

                    <div class="col-sm-5 col-md-5 ">
                        <div class="jumbotron col-md-7 col-sm-9 mt-3 shadow-lg" style="background-color:#111;">
                            <h3 class="display-5" style="text-align: center;">Book Hall</h3>
                            <form action="hallRedirect.jsp" method="POST">
                   <label>Price</label>
                   <div class="form-group">
                    <input type="text" class="form-control" name="TXN_AMOUNT" value="<%=hallprice%>" readonly/></div> 
                       <label>Order ID</label>
                       <div class="form-group"> 
                        <input type="text" class="form-control" name="ORDER_ID" value="MPA<%=o_id%>" readonly="readonly" />
                    </div>
                        <input type="hidden" name="CUST_ID" value="<%=regno%>" />
                        <input type="hidden" name="INDUSTRY_TYPE_ID" value="Retail" />
                        <input type="hidden" name="CHANNEL_ID" value="WEB" />
                        <input type="hidden" name="EMAIL" value="<%=session.getAttribute("tname")%>" />
                        <label>Mobile Number</label>
                        <div class="form-group"> 
                       <input type="text" class="form-control" name="MOBILE_NO" value="" /></div>
                        <button button="submit" class="btn btn-danger form-control" value="PAY" >PAY</button>
                    </form>
                        </div>
                    </div>
                    </div>
                    
                    <%
                    }
                rs1.close();
                rs.close();
                s.close();
                con.close();
            }
            catch(Exception e)
            {
                out.print(e.getMessage());
            }
        %>
        <%@include file="Footer.jsp" %>
        </body>
</html>

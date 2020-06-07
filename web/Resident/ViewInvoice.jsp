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
            if(session.getAttribute("tname")==null)
            {
                response.sendRedirect("TenentLogin.jsp");
            }
            try{
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL,DBCon.DBusername,DBCon.DBpassword);
                Statement s=con.createStatement();
                %>
                <div class="col-sm-8 col-md-6 mt-2 "> 
                <table class="table table-striped text-white" style="text-align:center;">
          <thead class="bg-dark text-white">
                     <tr style="text-align: center;">
                      <th scope="col">Invoice Number</th>
                      <th scope="col">Date Time</th>
                      <th scope="col">Order ID</th>
                      <th scope="col">Amount</th>
                      <th scope="col">Apartment Number</th> 
                    </tr>
                  </thead>
                  <tbody>
                   
                   
                 
                <%
        
                ResultSet rs=s.executeQuery("SELECT i.invoice_no, i.date, i.email, i.o_id, i.amount, t.apart_no FROM invoice i,tenent_email t WHERE t.email='"+session.getAttribute("tname")+"'");
                while(rs.next())
                { 
                 %>
                   <tr><td><%= rs.getInt(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(4)%></td><td><%= rs.getString(5)%></td><td><%= rs.getString(6)%></td></tr>
            <%
                }
                %>
            </tbody>
        </table>
        <button type="submit" class="btn btn-danger d-print-none" onclick="window.print()">Print</button>
                </div>

                
                <%


               
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

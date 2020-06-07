  <%@page import="DBConnect.DBCon"%>
<%@page import="java.sql.*"%>
<html>
<head>
<style>
h3{
  color:white;
}
</style>
 <% try{
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL,DBCon.DBusername,DBCon.DBpassword);
                Statement s=con.createStatement();

                 ResultSet rs = s.executeQuery("SELECT apart_no,email from tenent_email WHERE email='"+session.getAttribute("tname")+"'");
            while (rs.next()) {     
            out.print("<h3>"+rs.getString(1)+"</h3>");
                }

                
            }
            catch(Exception e)
            {
                out.print(e.getMessage());
            }

%>
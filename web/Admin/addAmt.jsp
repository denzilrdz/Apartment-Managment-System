<%@page import="DBConnect.DBCon"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Header.jsp" %>
        <style>
        h5{
    color:white;
        }
        </style>
    </head>

    <body>
       
                      <div class="col-sm-9 col-md-5 ">
            <div class="jumbotron col-md-9 mt-3  shadow-lg" style="background-color:#111;">
                <h3 class="display-5 text-light" style="text-align: center;">Send Maintenance Bill</h3>
        <form action="addAmtDB.jsp" method="POST">
                            <%                                
                            try {
                                    if (session.getAttribute("aname") == null) {
                                        response.sendRedirect("AdminLogin.jsp? &ptr=asf");
                                    }
                            %>

                            <%   Class.forName(DBCon.DriverURL);
                                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                                Statement s = con.createStatement();
                                ResultSet rs = s.executeQuery("SELECT e.regno,e.apart_no,a.status FROM tenent_email e,tenent_amt a WHERE a.status=1 OR NOT EXISTS(SELECT * from tenent_amt WHERE e.regno=a.regno)");
                            %>
                             <h5 class="mt-5" >Select Apartment Number</h3> <select  class="form-control" name="ano">
                                <%
                                        while (rs.next()) {
                                            out.print("<option value=" + rs.getInt(1) + ">");
                                            out.print(rs.getString(2));
                                            out.print("</option>");
                                        }
                                        rs.close();
                                        s.close();
                                        con.close();
                                    } catch (Exception e) {
                                        out.print(e.getMessage());
                                    }
                                %>
                            </select><br>
                            <h5> Enter amount</h5><input class="form-control" type="text" name="amt" value="" /><br>
                              <button type="submit" class="btn btn-danger form-control mt-3">Add</button>
                              <h5 style="color:white">
                        <%
                        if(session.getAttribute("output")!=null){
                            if(session.getAttribute("output").equals("e"))
                                out.print("There was a error try again");
                            else if(session.getAttribute("output").equals("a"))
                                out.print("Amount updated");
                            session.setAttribute("output", null);
                        }
                        %>
                    </h5>
                        </form>
                            
                    </div>
                </div>


                <%@include file="Footer.jsp" %>
                </body>
                </html>

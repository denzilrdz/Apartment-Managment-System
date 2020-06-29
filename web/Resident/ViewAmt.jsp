
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
        h4{
            color:white;
            margin-left:20%;
        }
         h5{
            color:white;
            margin-left:10%;
        }
        
  
     </style>
    </head>
    <body>
        <%
            if(session.getAttribute("tname")==null)
            {
                response.sendRedirect("TenentLogin.jsp");
            }
        
            try
            {   
                int amt=0;
                int o_id=0;
                int q=0;
                boolean status=false;
                int regno=0;
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL,DBCon.DBusername,DBCon.DBpassword);
                Statement s=con.createStatement();
                String oid="";
                ResultSet rs=s.executeQuery("SELECT `regno` FROM `tenent_email` WHERE email='"+session.getAttribute("tname")+"'");
                while(rs.next())
                {
                    regno=rs.getInt(1);
                }
                ResultSet rs1=s.executeQuery("SELECT `amt`,`status`, `o_id` FROM `tenent_amt` WHERE regno="+regno);
                while(rs1.next())
                {
                    q=1;
                    amt=rs1.getInt(1);
                    status=rs1.getBoolean(2);
                    oid=rs1.getString(3);
                    if(status==false)
                {
                    Random randomGenerator = new Random();
                    o_id = randomGenerator.nextInt(1000000);
                    int i=s.executeUpdate("UPDATE `tenent_amt` SET `o_id`='MPA"+o_id+"' WHERE regno="+regno+" and status=0");
                    %>
                    <div class="col-sm-9 col-md-5 ">
                    <div class="jumbotron col-md-9 mt-3 ml-2  shadow-lg" style="background-color:#111;"">
                        <h3 class="display-5" style="text-align: center;color:white;">Pay Maintenance</h3>
                    <form action="testRedirect.jsp" method="POST">
                        <div class="form-group">
                        <label>Amout to be paid</label>
                        <input type="text" class="form-control f" name="TXN_AMOUNT" value="<%=amt%>" readonly="readonly" />
                        </div>
                        <div class="form-group">
                            <label>Order Id</label>
                        <input type="text" name="ORDER_ID" value="MPA<%=o_id%>" class="form-control" readonly="readonly" />
                        </div>
                        <input type="hidden" name="CUST_ID" value="<%=regno%>" />
                        <input type="hidden" name="INDUSTRY_TYPE_ID" value="Retail" />
                        <input type="hidden" name="CHANNEL_ID" value="WEB" />
                        <input type="hidden" name="EMAIL" value="<%=session.getAttribute("tname")%>" />
                        <div class="form-group">
                            <label>Mobile Number</label>
                        <input type="text" name="MOBILE_NO" value="" class="form-control" />
                        </div>
                        <div class="form-group">
                        <button type="submit" value="PAY" class="btn btn-danger form-control" >Pay</button>
                    </div>
                    </form>
                </div>
            </div>
        </div><!---->
            
                    <%
                }
                }

                if(status==true)
                { 
                    
                    out.print("<h4><br>Amount paid</h4> ");
                }
                
                if(q==0)
                {
                    out.print("<h5>Maintaince bill not updated</h5>");
                }
                rs1.close();
                rs.close();
                s.close();
                con.close();
            }
            catch(Exception e)
            {
                /*out.print(e.getMessage());*/
            }
         %>
         <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/all.min.js"></script>
       
    </body>
</html>

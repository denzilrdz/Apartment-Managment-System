<%--
    Document   : addTech
    Created on : 17 Feb, 2020, 5:44:59 PM
    Author     : Denzil Rodrigues
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
            <%@include file="Header.jsp" %>
            <div class="col-sm-9 col-md-5 ">
            <div class="jumbotron col-md-9 mt-3 ml-2 shadow-lg" style="background-color:#111;">
            <h3 class="display-5 text-light" style="text-align: center;">Add Technician</h3>
            <form action="addTechDB.jsp" method="POST">
            <h5 class="mt-5 text-white"> Insert Name</h5><input class="form-control" type="text" name="iname" value="" required />
            <h5 class="mt-3 text-white">Contact Number</h5><input class="form-control" type="text" name="cno" value="" required/>
            <h5 class="mt-3 text-white">Select Type</h5> <select class="form-control" name="serve">
            <option value="Plumbing">Plumbing</option>
            <option value="Electrician">Electrician</option>
            <option value="Pest">Pest Control</option>
            </select><br>
            <button type="submit" class="btn btn-danger form-control mt-3">Add</button>
            <h5 style="color:white">
                        <%
                        if(session.getAttribute("output")!=null){
                            if(session.getAttribute("output").equals("e"))
                                out.print("There was a error try again");
                            else if(session.getAttribute("output").equals("a"))
                                out.print("Technician added");
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

<%@page import="DBConnect.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>
<%
Enumeration<String> paramNames = request.getParameterNames();

Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	if(paramName.equals("CHECKSUMHASH")){
		paytmChecksum = mapData.get(paramName)[0];
	}else{
		parameters.put(paramName,mapData.get(paramName)[0]);
	}
}
boolean isValideChecksum = false;
String outputHTML="";
try{
	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum("eW4QZ@P2VnW@&yIl",parameters,paytmChecksum);
	if(isValideChecksum && parameters.containsKey("RESPCODE")){
		if(parameters.get("RESPCODE").equals("01")){
                        try{
                                /*outputHTML = parameters.toString();*/
                            String mid=parameters.get("MID");
                            String txnid=parameters.get("TXNID");
                            String orderid=parameters.get("ORDERID");
                            String banktxnid=parameters.get("BANKTXNID");
                            String txnamount=parameters.get("TXNAMOUNT");
                            String currency=parameters.get("CURRENCY");
                            String respcode=parameters.get("RESPCODE");
                            String gatewayname=parameters.get("GATEWAYNAME");
                            String bankname=parameters.get("BANKNAME");
                            String paymentmode=parameters.get("PAYMENTMODE");
                            String txndate=parameters.get("TXNDATE");
                            Class.forName(DBCon.DriverURL);
                            Connection con = DriverManager.getConnection(DBCon.DBURL,DBCon.DBusername,DBCon.DBpassword);
                            Statement s=con.createStatement();
                            int q=s.executeUpdate("INSERT INTO `invoice`( `date`, `email`, `o_id`, `amount`) VALUES ('"+txndate+"','"+session.getAttribute("tname")+"','"+orderid+"','"+txnamount+"')");
                            int i=s.executeUpdate("INSERT INTO `payment`(`MID`, `TXNID`, `ORDERID`, `BANKTXNID`, `TXNAMOUNT`, `CURRENCY`, `RESPCODE`, `TXNDATE`, `GATEWAYNAME`, `BANKNAME`, `PAYMENTMODE`) VALUES ('"+mid+"','"+txnid+"','"+orderid+"','"+banktxnid+"','"+txnamount+"','"+currency+"','"+respcode+"','"+txndate+"','"+gatewayname+"','"+bankname+"','"+paymentmode+"')");
                            int a=s.executeUpdate("UPDATE `tenent_amt` SET `status`=true WHERE o_id='"+orderid+"'");
                            response.sendRedirect("PaymentSuccessfull.jsp");
                            s.close();
                            con.close();
                         }
                        catch(Exception e)
                        {
                            out.print("Database exception"+e.getMessage());
                        }
		}else{
			outputHTML="<b>Payment Failed.</b><a href=ViewAmt.jsp>Click here to try again</a>";
		}
	}else{
		outputHTML="<b>Checksum mismatched.</b><a href=ViewAmt.jsp>Click here to try again</a>";
	}
}catch(Exception e){
	outputHTML=e.toString();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%= outputHTML %>
</body>
</html>

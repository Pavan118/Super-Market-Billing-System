<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="p1.DB"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Thank you For Buying</h1>

<%
DB.connect();

String bill = "select sum(total) from bill";
ResultSet r = DB.st.executeQuery(bill);
if(r.next())
out.println("<h1>Pay "+r.getInt(1)+"</h1>");
String del="delete from bill";
DB.st.executeUpdate(del);

%>

</body>
</html>
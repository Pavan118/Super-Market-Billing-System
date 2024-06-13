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
<%
DB.connect();
int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
int price =Integer.parseInt(request.getParameter("price"));

String in = "insert into product values("+id+",'"+name+"',"+price+")";

int rs = DB.st.executeUpdate(in);
if(rs>0){
	response.sendRedirect("adminIndex.html");
}
%>
</body>
</html>
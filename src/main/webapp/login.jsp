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
String password=request.getParameter("password");

String q = "select * from admin where id="+id;

ResultSet rs = DB.st.executeQuery(q);
if(rs.next()){
	if(password.equals(rs.getString("password"))){
		response.sendRedirect("adminIndex.html");
	}
}else{
	out.println("No Admin Found");
}

%>
</body>
</html>
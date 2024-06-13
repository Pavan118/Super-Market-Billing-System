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
<img src="https://media.istockphoto.com/id/1386010216/photo/checking-receipt-after-payment.jpg?s=612x612&w=0&k=20&c=ZgpFT_xBJWt-dcYHHJxio8hsfHDswh1_4o3KuZBSPJs=" alt="Description of the image">
<form action="addpro.jsp" method="post">
  <select name="product" id="cars">
  <%
  DB.connect();
  String q = "select * from product";
	int price =0;
  ResultSet rs = DB.st.executeQuery(q);
  while(rs.next()){
	String name=rs.getString("name");
	price = rs.getInt(3);
  	out.println("<option value='"+name+"'>"+name+"</option>");
  	
  }
  %>
 </select>
   <input type="number" name="q" placeholder="Quantity" />
   <%
   out.println("<input type='hidden' name='price' value='"+price+"' />");
   %>
   <input type="submit" value="Add Product"/>
</form>

<h1>Cart:</h1>

<table style="width:100%">
 <tr>
 <th>Product Name</th>
 <th>Quantity</th>
 <th>Amount</th>
 </tr>
 <% String bill = "select * from bill";
 ResultSet r = DB.st.executeQuery(bill);
 while(r.next()){
	String pname=r.getString("name");
  	out.println("<tr>");
  	out.println("<td>"+pname+"</td>");
  	out.println("<td>"+r.getInt(2)+"</td>");
  	out.println("<td>"+r.getInt(3)+"</td>");
  	out.println("</tr>");
  }%>
</table>
<%
String total_bill = "select sum(total) from bill";
ResultSet tb = DB.st.executeQuery(total_bill);
if(tb.next()){
	out.println("<h1> Total: "+tb.getInt(1)+"</h1>");
}

%>
<form action="getbill.jsp" method="post">
<input type="submit" value="Check Out"/>
</form>
</body>
</html>
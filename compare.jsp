<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Statement" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset = "UTF-8">
<title>db테스트</title>
</head>
<body>


<%
    try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.83:3307/kopoctc","root","kopoctc"); 
		Statement stmt = conn.createStatement();
		String ckey = request.getParameter("key");
		ResultSet rset = stmt.executeQuery("select * from examtable where name = '"+ckey+"';");
%>
   <h1>[<%=ckey%>]조회</h1>
	<table cellspacing=1 width=600 border=1>
	<tr>
	<td width=50><p align=center>이름</p></td>
	<td width=50><p align=center>학번</p></td>
	<td width=50><p align=center>국어</p></td>
	<td width=50><p align=center>영어</p></td>
	<td width=50><p align=center>수학</p></td>
	</tr>
<%
		while(rset.next()) {
			out.println("<tr>");
			out.println("<td width=50><p align=center>"+rset.getString(1)+"</p></td>");
			out.println("<td width=50><p align=center>"+rset.getInt(2)+"</p></td>");
			out.println("<td width=50><p align=center>"+rset.getInt(3)+"</p></td>");
			out.println("<td width=50><p align=center>"+rset.getInt(4)+"</p></td>");
			out.println("<td width=50><p align=center>"+rset.getInt(5)+"</p></td>");
			out.println("</tr>");
		}
	rset.close();
	stmt.close();
	conn.close();	
	
    } catch (Exception e) {
        out.println("<h1> => error</h1>");
    }

%>
</body>
</html>
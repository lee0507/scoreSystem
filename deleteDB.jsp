<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.net.*, javax.sql.*,java.io.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Statement" %>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
</head>
<body>
<h1>레코드 삭제<h1>
 <% 
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.83:3307/kopoctc","root","kopoctc"); 
		Statement stmt = conn.createStatement();
		
		String ctmp = request.getParameter("studentid");
		String sql = "delete from examtable where studentid = "+ctmp+";";
		stmt.executeUpdate(sql);
		
		ResultSet rset = stmt.executeQuery("select * from examtable;");

%>

<table width=600 border=1 cellspacing=1>
	<tr>
		<td width=50><p align=center><b>이름</b></p></td>
		<td width=50><p align=center><b>학번</b></p></td>
		<td width=50><p align=center><b>국어</b></p></td>
		<td width=50><p align=center><b>영어</b></p></td>
		<td width=50><p align=center><b>수학</b></p></td>
	</tr>

<%
	while (rset.next()){
		out.println("<tr>");
		out.println("<td width=50><p align=center><a href='oneviewDB.jsp?key="
					+rset.getString(1)+"'> "+rset.getString(1)+"</a></p></td>");
		out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(2))+"</p></td>");
		out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3))+"</p></td>");
		out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(4))+"</p></td>");
		out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(5))+"</p></td>");
		out.println("</tr>");
	}

	rset.close();
	stmt.close();
	conn.close();
%>
</BODY>
</HTML>
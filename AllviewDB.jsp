<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Statement" %>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
<meta charset = "UTF-8">
<title>db테스트</title>

</head>
<body>
   <h1>테이블 값 조회하기</h1>

<%
    try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.83:3307/kopoctc","root","kopoctc"); 
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from examtable;");
%>
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
			out.println("<td width=50><p align=center><a href='oneviewDB.jsp?key="+rset.getInt(2)+"'> "+rset.getString(1)+"</a></p></td>");
			out.println("<td width=50><p align=center>"+(rset.getInt(2))+"</p></td>");
			out.println("<td width=50><p align=center>"+(rset.getInt(3))+"</p></td>");
			out.println("<td width=50><p align=center>"+(rset.getInt(4))+"</p></td>");
			out.println("<td width=50><p align=center>"+(rset.getInt(5))+"</p></td>");
			out.println("</tr>");
		}
	rset.close();
	stmt.close();
	conn.close();	
	
    } catch (SQLSyntaxErrorException e) {
        out.println("<h1> => 저장된 데이터가 없습니다.</h1>");
    } catch (Exception e) {
        out.println(e);
    } 

%>
</body>
</html>
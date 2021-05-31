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
<h1>Table 생성 </h1>
 <%   
    try{
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.83:3307/kopoctc","root","kopoctc"); 
		Statement stmt = conn.createStatement(); 
		stmt.execute("create table examtable("+
                        "name varchar(20),"+
                        "studentid int not null primary key,"+
                        "kor int,"+
                        "eng int,"+
                        "mat int);");
		stmt.close(); 
		conn.close(); 
		out.println("<h1> => 테이블을 만들었습니다. </h1>");
	} catch (SQLSyntaxErrorException e) {
		out.println("<h1> => 테이블이 이미 존재합니다. </h1>");		
    } catch (Exception e) {
		out.println(e);
	}
%>

</body>
</html>
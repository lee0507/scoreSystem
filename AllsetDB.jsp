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
<h1>Table 값넣기 </h1>
 <%   
    try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.83:3307/kopoctc","root","kopoctc"); 
		Statement stmt = conn.createStatement();
		stmt.execute("insert into examtable value ('나연', 209901, rand()*100, rand()*100, rand()*100);");
		stmt.execute("insert into examtable value ('정연', 209902, rand()*100, rand()*100, rand()*100);");
		stmt.execute("insert into examtable value ('모모', 209903, rand()*100, rand()*100, rand()*100);");
		stmt.execute("insert into examtable value ('사나', 209904, rand()*100, rand()*100, rand()*100);");
		stmt.execute("insert into examtable value ('지효', 209905, rand()*100, rand()*100, rand()*100);");
		stmt.execute("insert into examtable value ('미나', 209906, rand()*100, rand()*100, rand()*100);");
		stmt.execute("insert into examtable value ('다현', 209907, rand()*100, rand()*100, rand()*100);");
		stmt.execute("insert into examtable value ('채영', 209908, rand()*100, rand()*100, rand()*100);");
		stmt.execute("insert into examtable value ('쯔위', 209909, rand()*100, rand()*100, rand()*100);");
		stmt.close(); 
		conn.close(); 
		out.println("<h1> => 데이터를 입력하였습니다. </h1>");
	} catch (SQLSyntaxErrorException e) {
		out.println("<h1> => 테이블이 존재하지않습니다. </h1>");
    } catch (SQLIntegrityConstraintViolationException e) {
		out.println("<h1> => 중복되는 키가 있습니다. </h1>");
    } catch (Exception e) {
		out.println(e);
    }
%>

</body>
</html>
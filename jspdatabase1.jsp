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
   <h1>Table 생성 </h1>
<%
    try{
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc",                  
                                          "root" , "kopoctc"); 
    Statement stmt = conn.createStatement(); 
    stmt.execute("create table examtable12("+
				"name varchar(20),"+
				"studentid int not null primary key,"+
				"kor int,"+
				"eng int,"+
				"mat int);");
    stmt.close(); 
    conn.close(); 
    out.println("<h1> => Result: OK </h1>");
    } catch (Exception e) {
        out.println("<h1> => Result: Table already Exists! Please Delete Table First If You want to Create a Table</h1>");
    }
   %>

</body>
</html>
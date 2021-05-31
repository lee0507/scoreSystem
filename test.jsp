<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결과 화면</title>
</head>
<body>
<!-- JSP(Java Server Page) -->
<%
String rid = request.getParameter("student");
String rkor = request.getParameter("kor");
String reng = request.getParameter("eng");
String rmat = request.getParameter("mat");
out.println("아이디 : " + rid + "<br>");
out.println("국어 : " + rkor + "<br>");
out.println("영어 : " + reng + "<br>");
out.println("수학 : " + rmat + "<br>");
%>
</body>
</html>
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
<script language="JavaScript">

function submitFormUpdate(){
	myform.action = "updateDB.jsp";
	myform.submit();
}
function submitFormDelete(){
	myform.action = "deleteDB.jsp";
	myform.submit();
}

</script>
</head>
<body>

 <% 
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.83:3307/kopoctc","root","kopoctc"); 
		Statement stmt = conn.createStatement();

		String name="";
		String studentid="";
		String kor="";
		String eng="";
		String mat="";
		String ctmp = request.getParameter("searchid");
	try {
		if (ctmp.length() == 0) {
			ctmp="0";
		}
		ResultSet rset = stmt.executeQuery("select * from examtable where studentid = "+ctmp+";");
		name = "해당학번없음";
		while (rset.next()) {
			name=rset.getString(1);
			studentid=Integer.toString(rset.getInt(2));
			kor=Integer.toString(rset.getInt(3));
			eng=Integer.toString(rset.getInt(4));
			mat=Integer.toString(rset.getInt(5));
		}
		
		rset.close();
		stmt.close();
		conn.close();
	} catch (Exception e) {
		out.println("error");
	}
%>
<h1>성적 조회후 정정 / 삭제<h1>
<FORM name='fm' action="showREC.jsp" method="post">
	<table width=400 border=0 cellspacing=1>
	<tr>
		<td width=300><p align=center>조회할 학번</p></td>
		<td width=100><p align=center><input type='number' name="searchid" value='' autocomplete='off' style=ime-mode:active; placeholder='학번을 입력해주세요'></p></td>
		<td width=100><input type="submit" value="조회"></td>
	</tr>
	</table>
</form>

<form method='post' name='myform'>
	<table width=400 border=1 cellspacing=1>
	<tr>
		<td width=100><p align=center><b>이름</b></p></td>
		<td width=300><p align=center><input type='text' name="name" value='<%=name%>' autocomplete='off' style=ime-mode:active; 
		onkeypress="if(!(event.keyCode < 47 && event.keyCode > 58)) event.returnValue=false;" required></p></td>
	</tr>
	<tr>
		<td width=100><p align=center><b>학번</b></p></td>
		<td width=300><p align=center><input type='number' name="studentid" value='<%=studentid%>' autocomplete='off' required></p></td>
	</tr>
	<tr>
		<td width=100><p align=center><b>국어</b></p></td>
		<td width=300><p align=center><input type='number' min= "0" max = "100" name="korean" value='<%=kor%>' autocomplete='off' required></p></td>
	</tr>
	<tr>
		<td width=100><p align=center><b>영어</b></p></td>
		<td width=300><p align=center><input type='number' min= "0" max = "100" name="english" value='<%=eng%>' autocomplete='off' required></p></td>
	</tr>
	<tr>
		<td width=100><p align=center><b>수학</b></p></td>
		<td width=300><p align=center><input type='number' min= "0" max = "100" name="mathmatic" value='<%=mat%>' autocomplete='off' required></p></td>
	</tr>
	</table>
<% 
	if (name.equals("해당학번없음")) {
		
	} else {
		out.println("<input type=SUBMIT value=\"수정\" onclick=\"javascript: form.action='updateDB.jsp';\">");
		out.println("<input type=SUBMIT value=\"삭제\" onclick=\"javascript: form.action='deleteDB.jsp';\">");
	}	
%>

</form>
</BODY>
</HTML>
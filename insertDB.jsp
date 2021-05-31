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
</head>
<body>
<h1>성적입력추가완료 </h1>

 <% 
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.83:3307/kopoctc","root","kopoctc"); 
		Statement stmt = conn.createStatement();

		Integer NewStuId = 0;
		
		ResultSet rset = stmt.executeQuery("select max(studentid) from examtable");
		String cTmp = request.getParameter("name");
		Integer ckor = Integer.parseInt(request.getParameter("korean"));
		Integer ceng = Integer.parseInt(request.getParameter("english"));
		Integer cmat = Integer.parseInt(request.getParameter("mathmatic"));
		
	if(cTmp.length() == 0) {
		cTmp = "이름을 빈칸으로 할 수 없습니다.";
	} else if(ckor > 100 || ckor < 0 || ceng > 100 || ceng < 0 || cmat > 100 || cmat < 0) {
		cTmp = "성적은 0부터 100사이로";
	} else if(cTmp.contains("&quot") || cTmp.contains("&lt;") || cTmp.contains("&gt;") || 
				cTmp.contains("&amp") || cTmp.contains("&nbsp") || cTmp.contains("&nbsp") || 
				cTmp.contains("&reg")|| cTmp.contains("&copy;") || cTmp.contains("&;") ||
				cTmp.contains("`") || cTmp.contains("~") || cTmp.contains("!") || 
				cTmp.contains("@")|| cTmp.contains("#") || cTmp.contains("$") ||
				cTmp.contains("%") || cTmp.contains("^") || cTmp.contains("&") || 
				cTmp.contains("*")|| cTmp.contains("(") || cTmp.contains(")") ||
				cTmp.contains("-") || cTmp.contains("_") || cTmp.contains("=") || 
				cTmp.contains("+")|| cTmp.contains("\\") || cTmp.contains("|") ||
				cTmp.contains("[") || cTmp.contains("]") || cTmp.contains("{") || 
				cTmp.contains("}")|| cTmp.contains("<") || cTmp.contains(">") ||
				cTmp.contains(",") || cTmp.contains(".") || cTmp.contains("/") || 
				cTmp.contains(":") || cTmp.contains("\"") || cTmp.contains("\'") || 
				cTmp.contains("1") || cTmp.contains("2") || cTmp.contains("3") || 
				cTmp.contains("4") || cTmp.contains("5") || cTmp.contains("6") || 
				cTmp.contains("7") || cTmp.contains("8") || cTmp.contains("9") || 
				cTmp.contains("0") || cTmp.contains("?")) {
		cTmp = "기호는 입력할 수 없습니다.";
	} else {
		while (rset.next()) {
			NewStuId = rset.getInt(1)+1;
		}
	try {
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('"+
		cTmp +"',"+
		Integer.toString(NewStuId) +","+
		request.getParameter("korean") +","+
		request.getParameter("english") +","+
		request.getParameter("mathmatic") +" );" );
		
	} catch (SQLSyntaxErrorException e) {
		out.println("<h1> => 성적은 숫자를 입력해야합니다. </h1>");		
    } catch (DataTruncation e) {
		out.println("<h1> => 입력한 이름이 칸을 초과하였습니다. </h1>");		
	} catch (Exception e) {
		out.println(e);
	}
		rset.close();
		stmt.close();
		conn.close();
	}
%>

<FORM name='fm' action="inputForm1.html" method="post">
	<table width=400 border=0 cellspacing=1>
	<tr>
		<td width=300></td>
		<td width=100><input type="submit" value="뒤로가기"></td>
	</tr>
	</table>
	
	<table width=400 border=0 cellspacing=1>
	<tr>
		<td width=100><p align=center><b>이름</b></p></td>
		<td width=300><p align=center>
			<input type=text name="name" value='<%=cTmp%>'></p></td>
	</tr>
	<tr>
		<td width=100><p align=center><b>학번</b></p></td>
		<td width=300><p align=center>
		<input type=text name="studentid" value='<%=Integer.toString(NewStuId)%>'></p></td>
	</tr>
	<tr>
		<td width=100><p align=center><b>국어</b></p></td>
		<td width=300><p align=center>
		<input type=text name="korean" value='<%=request.getParameter("korean")%>'></p></td>
	</tr>
	<tr>
		<td width=100><p align=center><b>영어</b></p></td>
		<td width=300><p align=center>
		<input type=text name="english" value='<%=request.getParameter("english")%>'></p></td>
	</tr>
	<tr>
		<td width=100><p align=center><b>수학</b></p></td>
		<td width=300><p align=center>
		<input type=text name="mathmatic" value='<%=request.getParameter("mathmatic")%>'></p></td>
	</tr>
</table>
</form>
</BODY>
</HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_example</title>
</head>
<%
	String memo_text = request.getParameter("memo_text");
%>
<body>
	<%			
	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "0000" ;
	String sql = "select * from oneline" ;
	PreparedStatement psmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(url, user, passwd);
	
	psmt = con.prepareStatement(sql);
	ResultSet rs =psmt.executeQuery(); //SELECT 문
	while(rs.next()) {
		int no = rs.getInt(1);
		String memo = rs.getString("memo");
		String wdate = rs.getString(3);
		
		out.print(no + ":" + memo +":(" + wdate +")<br>");
	}
	rs.close();
	psmt.close();
	con.close();
	System.out.println("DB연결 성공");
	%>
</body>
</html>
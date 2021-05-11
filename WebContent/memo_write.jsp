<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String memo = request.getParameter("memo_text");
	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "0000" ;
	String sql = "insert into oneline(memo) values(?)" ;
	PreparedStatement psmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(url, user, passwd);
	
	psmt = con.prepareStatement(sql);
	psmt.setString(1, memo);
	psmt.executeUpdate();

	psmt.close();
	con.close();
	out.println("데이타 추가 성공");	
    response.sendRedirect("/memo/memo_list.jsp");

	%>
</body>
</html>
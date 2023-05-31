<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz02</title>
</head>
<body>
	<% 
	Date now = new Date();  // ZonedDateTime 나중에 프로젝트할때 이거로 해보기
	SimpleDateFormat sdf = null;
	if (request.getParameter("type").equals("time")) {
		sdf = new SimpleDateFormat("현재 시간은 HH시 mm분 ss초 입니다.");
	} else if(request.getParameter("type").equals("date")) {
		sdf = new SimpleDateFormat("오늘 날짜는 yyyy년 MM월 dd일 입니다.");
				
	}
	String result = sdf.format(now);
	
	%>
	<h2><%= result %></h2>
	
<%--
	<% 
	Date now = new Date();
	String nowTime = null;
	String nowDate = null;
	if (request.getParameter("type").equals("time")) {
	SimpleDateFormat sdf1 = new SimpleDateFormat("현재 시간은 HH시 mm분 ss초 입니다.");
		nowTime = sdf1.format(now);
	} 
	%>
	<h2><%= nowTime %></h2>
	<%
	if(request.getParameter("type").equals("date")) {
	SimpleDateFormat sdf2 = new SimpleDateFormat("오늘 날짜는 yyyy년 MM월 dd일 입니다.");
		nowDate = sdf2.format(now);		
	}
	%>
	<h2><%= nowDate %></h2>
 --%>
</body>
</html>
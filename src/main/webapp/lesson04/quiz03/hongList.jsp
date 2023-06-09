<%@ page import="com.test.common.MysqlService" %>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hongList</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<style>
#wrap {height:900px;}
header {height:120px;}
.box {height:300px; width:350px}
</style>
</head>
<body>
<%
   // DB 연결
   MysqlService ms = MysqlService.getInstance();
   ms.connect();
   
   String selectQuery = "select A.*, B.* from seller as A join used_goods as B on A.id = B.sellerId";
   ResultSet res = ms.select(selectQuery);   
%>
	<div id="wrap" class="container">
		<header class="bg-danger">
			<div>
				<h1 class="text-white text-center mb-4">HONG당무 마켓</h1>
				<div class="d-flex justify-content-around text-white">
					<div>리스트</div>
					<div>물건 올리기</div>
					<div>마이페이지</div>
				</div>
			</div>
		</header>
		<section>
		<div class="big d-flex flex-wrap justify-content-around">
		<%		
			while(res.next()) {		
		%>
			<div class="box border border-danger">
				<img src="<%= res.getString("pictureUrl") %>" width="130" height="150" class="d-block">
				<span class="font-weight-bold d-block"><%= res.getString("title") %></span>
				<span class="d-block"><%= res.getString("price") %>원</span>
				<span class="d-block"><%= res.getString("nickname") %></span>
			</div>
		<% 
			}
		%>
		</div>		
		</section>
	</div>
<% 
   // DB 연결 해제
   ms.disconnect();
%>
</body>
</html>
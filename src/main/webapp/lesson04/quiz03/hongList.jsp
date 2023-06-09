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


<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



<style>
#wrap {height:900px;}
header {height:120px;}
.box {height:300px; width:350px}
.box:hover {background-color:skyblue}
.no-image {height:200px; width:340px}
</style>
</head>
<body>
<%
   // DB 연결
   MysqlService ms = MysqlService.getInstance();
   ms.connect();
   
   String selectQuery = "select A.*, B.* from seller as A join used_goods as B on A.id = B.sellerId order by A.id DESC";
   ResultSet res = ms.select(selectQuery);
%>
	<div id="wrap" class="container">
	
		<header class="bg-danger">
			<jsp:include page="header.jsp" />
		</header>
		
		<section>
			<div class="big d-flex flex-wrap p-3">
			<%		
				while(res.next()) {		
			%>
				<div class="box border border-danger ml-2 mb-2 p-1">
				<% 
					if (res.getString("pictureUrl") == null || res.getString("pictureUrl").equals("")) {
				%>
					<div class="d-flex align-items-center justify-content-around no-image">No image</div>
				<%
					} else {
				%>
					<img src="<%= res.getString("pictureUrl") %>" height="200" class="d-block w-100">
				<%
					}
				%>	
					<span class="font-weight-bold d-block m-1"><%= res.getString("title") %></span>
					<span class="d-block m-1"><%= res.getString("price") %>원</span>
					<span class="d-block m-1 text-danger"><%= res.getString("nickname") %></span>
				</div>
			<% 
				}
			%>
			</div>		
		</section>
		
		<footer>
			<jsp:include page="footer.jsp" />
		</footer>
		
	</div>
<% 
   // DB 연결 해제
   ms.disconnect();
%>

	
	

</body>
</html>
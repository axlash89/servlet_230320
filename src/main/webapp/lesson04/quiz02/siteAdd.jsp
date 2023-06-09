<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>siteAdd</title>
</head>
<body>
	
	<form method="post" action="/lesson04/quiz02_insert">	
		<label>사이트명<input type="text" name="name"></label>
		<br>
		<label>사이트주소<input type="text" name="address"></label>
		<input type="submit" value="추가">		
	</form>
	
</body>
</html>
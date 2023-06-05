<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길이 변환</title>
</head>
<body>
	<%
		int cm = Integer.parseInt(request.getParameter("cm"));
		String[] typeArr = request.getParameterValues("type"); // checkbox 같은 여러 값을 가져올 때		
	%>
	<h1>길이 변환 결과</h1>
	<h3><%= cm %> cm</h3>
	<hr>
	<h2>
	<%
		if (typeArr != null) {
			for (String type : typeArr) {
				if (type.equals("inch")) {
					double inch = cm * 0.393701;
					out.print(inch + " in <br>");
				} else if (type.equals("yard")) {
					double yard = cm * 0.0109361;
					out.print(yard + " yd <br>");
				} else if (type.equals("feet")) {
					double feet = cm * 0.0328084;
					out.print(feet + " ft <br>");
				} else if (type.equals("meter")) {
					double meter = cm * 0.01;
					out.print(meter + " m <br>");
				}			
			}
		}
	%>
	</h2>
</body>
</html>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz01</title>
</head>
<body>
		
	<%!
	// 1) 합계
	// input(n), output(합계)
	public int sum1toN(int n) {
		int sum = 0;
		for (int i = 1; i <= n; i++) {
			sum += i;
		}
		return sum;
	}	
	%>
	
	<%
	int[] scores = {80, 90, 100, 95, 80};
	int total = 0;
	double average = 0;
	for (int i = 0; i < scores.length; i++) {
		total += scores[i];
	}
	average = (double)total / scores.length;
	
	
	List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
	
	int score = 0;
	for (int i = 0; i < scoreList.size(); i++) {
		if (scoreList.get(i).equals("O")) {
			score += 100 / scoreList.size();
		}
	}
	
	String birthDay = "20070820";
	int age = 0;
	age = 2023 - Integer.parseInt(birthDay.substring(0, 4)) + 1;
	// out.print(age);
	%>
	
	
	<h2>1부터 50까지의 합은 <%= sum1toN(50) %>입니다.</h2>
	<h2>평균점수는 <%= average %>입니다.</h2>
	<h2>채점결과는 <%= score %>점 입니다.</h2>
	<h2><%= birthDay %>의 나이는 <%= age %> 입니다.</h2>

</body>
</html>
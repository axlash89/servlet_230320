package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz06")
public class GetMethodQuiz06 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/json");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		int n1 = Integer.parseInt(request.getParameter("number1"));
		int n2 = Integer.parseInt(request.getParameter("number2"));
		
		out.print("{\"addition\":" + (n1 + n2) + ",\"subtraction\":" + (n1 - n2) + ",\"multiplication\":" + (n1 * n2) + ",\"division\":" + (n1 / n2) + "}");
		
	}
	
}

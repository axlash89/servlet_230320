package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex03")
public class GetMethodEx03 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// test code
		
		response.setContentType("text/json");
		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		// request parameter 꺼내기		
		String userId = request.getParameter("user_id");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
//		out.println("서블릿 호출");		
//		out.println("user_id : " + userId);
//		out.println("name : " + name);
//		out.println("age : " + age);
		
		
		// JSON(JavaScript Object Notation)으로 response 구성하기
		// {"user_id":"axlash7", "name":"kotaeyoung", "age":31}
		out.print("{\"user_id\":\"" + userId + "\", \"name\":\"" + name + "\", \"age\":" + age + "}");
		
	}

}

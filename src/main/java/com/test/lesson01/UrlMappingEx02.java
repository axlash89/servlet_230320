package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex02")
public class UrlMappingEx02 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 한글 깨짐 방지
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");  // 플레인으로 내리면 그냥 글자,, html 태그로 내리려면 text/html로
		
		PrintWriter out = response.getWriter();
		
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
			sum += i;
		}
		
		// 서블릿 : 자바 + HTML
		out.print("<html><head><title>합계</title></head><body>");  //println으로 해봤자 안먹힘. html이라
		out.print("합계 : <b>" + sum + "</b>");
		out.print("</body></html>");
		
		
	}
		
}

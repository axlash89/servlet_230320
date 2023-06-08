package com.test.lesson04;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson04/ex02_insert")
public class Ex02Insert extends HttpServlet {
	
	@Override 
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 응답에 대한 정의는 생략 - redirect할 것이기 때문에
		// response.setContentType();
		
		// request parameter 받기
		String name = request.getParameter("name");
		String yyyymmdd = request.getParameter("yyyymmdd");
		String email = request.getParameter("email");
		String introduce = request.getParameter("introduce");
		
		
		
		// db 연결
		MysqlService ms = MysqlService.getInstance();
		ms.connect();  // 여기서 진짜 DB 연결!!!
		
		// db insert
		String insertQuery = "insert into `new_user`"
				+ "(`name`, `yyyymmdd`, `email`, `introduce`)"
				+ "values ('" + name + "', '" + yyyymmdd + "', '" + email + "', '" + introduce + "')";
		
		try {
			ms.update(insertQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// db 연결 해제
		ms.disconnect();
		
		// 유저 목록 화면으로 이동(Redirect)
		response.sendRedirect("/lesson04/ex02/userList.jsp");
		
	}

}

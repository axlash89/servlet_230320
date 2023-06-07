<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h3 class="mr-4">
	<a href="/lesson03/quiz02/list_layout.jsp" class="logo text-success text-decoration-none">Melong</a>
</h3>

<div class="col-10">
	<form method="get" action="/lesson03/quiz02/info_layout.jsp">
		<div class="input-group col-5">
			<input type="text" class="form-control" name="search" value="<%= request.getParameter("search") %>">
			<div class="input-group-append">
				<button class="btn btn-success" type="submit">검색</button>
			</div>
		</div>
	</form>
</div>
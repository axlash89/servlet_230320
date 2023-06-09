<%@ page import="com.test.common.MysqlService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hongList</title>
		<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<style>
#wrap {
	height: 900px;
}

header {
	height: 120px;
}

.box {
	height: 300px;
	width: 350px
}

.box:hover {
	background-color: skyblue
}

.no-image {
	height: 200px;
	width: 340px
}
</style>
</head>
<body>
			
	<%
	// DB 연결
	MysqlService ms = MysqlService.getInstance();
	ms.connect();

	String selectQuery1 = "select A.*, B.* from seller as A join used_goods as B on A.id = B.sellerId order by A.id DESC";
	ResultSet res1 = ms.select(selectQuery1);
	String selectQuery2 = "select * from seller";
	ResultSet res2 = ms.select(selectQuery2);
	%>
	<div id="wrap" class="container">

		<header class="bg-danger">
			<jsp:include page="header.jsp" />
		</header>

		<section class="p-5">
			<h1 class="text-secondary">물건 올리기</h1>
			<form method="post" action="/lesson04/quiz03_insert">
				<div>
					<div class="d-flex w-100">
						<select name="sellerId" id="selVal">
							<option value="nonSelectId">--아이디 선택--</option>
							<%
							while (res2.next()) {
							%>
							<option value="<%= res2.getInt("id") %>"><%=res2.getString("nickname")%></option>
							<%
							}
							%>
						</select> 
						<input type="text" name="title" id="inputTitle" placeholder="제목">
						<div class="input-group">
							<input type="text" name="price" id="inputPrice">
							<div class="input-group-append">
								<span class="input-group-text">원</span>
							</div>
						</div>
					</div>
					<textarea name="description" cols="50" rows="7" class="d-block"></textarea>
					<input type="text" name="pictureUrl" placeholder="이미지 URL" class="d-block">
					<input type="submit" class="d-block" value="저장">
				</div>
			</form>
		</section>

		<footer>
			<jsp:include page="footer.jsp" />
		</footer>

	</div>
	<%
	// DB 연결 해제
	ms.disconnect();
	%>
	
	<script>
            $(document).ready(function() { 
                $('form').submit(function() {                	
                        if ($('#selVal').val() == 'nonSelectId') {
                            alert("아이디를 선택하세요");
                            return false;
                        }

                        if ($('#inputTitle').val() == '') {
                            alert("판매 물품이름을 입력하세요");
                            return false;
                        }
                        
                        if ($('#inputPrice').val() == '') {
                            alert("판매 가격을 입력하세요");
                            return false;
                        }                    
                });
            });
	</script>
	

</body>
</html>
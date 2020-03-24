<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="안규철" />
<meta name="description" content="기본 폼 예시 페이지" />

<title>TestPageForm</title>

<!-- *************************************************** -->

<!-- jQuery 연결 -->
<script
	src="<%=request.getContextPath()%>/resources/common/jQuery/jquery-1.12.4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/common/jQuery/jquery-migrate-1.4.1.min.js"></script>

<!-- bootstrap 연결 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/common/bootstrap/css/bootstrap.min.css">
<script
	src="<%=request.getContextPath()%>/resources/common/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- font-awesome 연결 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/common/font-awesome/css/font-awesome.min.css">

<!-- 공통 CSS 연결 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/commonStyle.css">

<!-- *************************************************** -->

<style>
* {
	margin: 0;
	padding: 0;
}

li {
	list-style: none;
}

.container {
	width: 1000px;
}

#title {
	margin: 3rem 0;
}

#box3, #box4 {
	margin: 0.5rem 0;
}

#btn1 {
	height: 38px;
}
</style>

</head>
<body>
	<div class="container">
		<h2 style="text-align: center;" class="text-primary" id="title">E-book
			관리</h2>
		<div class="row col-md-6" id="box1">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<button class="btn btn-outline-secondary dropdown-toggle"
						type="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">선택하시오</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">제목</a> <a class="dropdown-item"
							href="#">저자</a> <a class="dropdown-item" href="#">출판사</a> <a
							class="dropdown-item" href="#">카테고리</a>
					</div>
				</div>
				<input type="text" class="form-control"
					aria-label="Text input with dropdown button">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button">
						<i class="fa fa-search" aria-hidden="true"></i>
					</button>
				</div>
			</div>
		</div>
		<div class="row" id="box2">
			<table class="table table-striped col-">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>저자</th>
						<th>출판사</th>
						<th>카테고리</th>
					</tr>
				</thead>
				<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.e_book_num}</td>
					<td>${list.e_book_title}</td>
					<td>${list.e_book_writer}</td>
					<td>${list.e_book_publisher}</td>
					<td>${list.e_book_tag}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div class="row btn-toolbar" id="box3">
			<div class="btn-group mr-2">
				<button class="btn btn-primary">삭제</button>
			</div>
			<div class="btn-group mr-2">
				<button class="btn btn-primary">수정</button>
			</div>
			<div class="btn-group mr-2 offset-md-8 col">
				<button class="btn btn-primary col-sm-12">등록</button>
			</div>
		</div>
		<div class="row" id="box4">
			<div style="margin: 0 auto;">
				<ul class="pagination">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">Previous</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2 <span
							class="sr-only">(current)</span></a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>

					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
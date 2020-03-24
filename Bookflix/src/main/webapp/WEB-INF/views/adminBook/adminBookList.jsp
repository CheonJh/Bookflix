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
#box1{
	margin-bottom : 1rem;
}
#box4 {
	justify-content: center;
}
</style>
<script>
  $('#mytype ~ div > a').on('click', function() {
    // 버튼에 선택된 항목 텍스트 넣기 
    $('#mytype').text($(this).text());

    // 선택된 항목 값(value) 얻기
    alert($(this).attr('value'));
  });
</script>
</head>
<body>
	<div class="container">
		<h2 style="text-align: center;" class="text-primary" id="title">E-book
			관리</h2>
		<div class="row col-md-6" id="box1">
			<div class="input-group">
				<select class="custom-select col-md-3" id="inputGroupSelect04"
					aria-label="Example select with button addon">
					<option selected>Choose...</option>
					<option value="1">One</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select> <input type="text" class="form-control"
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
						<td><a
							href="/adminBook/adminBookView?e_book_num=${list.e_book_num}">${list.e_book_title}</a></td>
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
			<ul class="pagination">
				<c:if test="${prev}">
					<li class="page-item"><a class="page-link"
						href="/adminBook/adminBookList?num=${startPageNum - 1}">Previous</a></li>
				</c:if>

				<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">

					<c:if test="${select != num}">
						<li class="page-item"><a class="page-link"
							href="/adminBook/adminBookList?num=${num}">${num}</a></li>
					</c:if>

					<c:if test="${select == num}">
						<li class="page-item active"><a class="page-link"
							href="/adminBook/adminBookList?num=${num}">${num}</a></li>
					</c:if>


				</c:forEach>

				<c:if test="${next}">
					<li class="page-item"><a class="page-link"
						href="/adminBook/adminBookList?num=${endPageNum + 1}">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>
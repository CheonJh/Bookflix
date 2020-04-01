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

#box1 {
	margin-bottom: 1rem;
}
.pagination{
	justify-content: center;
}
</style>
<script>
	$(document).ready(function () {
    $("#checkbox").click(function () {
      // 클릭되었으면
      if($("#checkbox").prop("checked")){
        //name값이 check인 인풋태그들의 체크드속성을 트루로 정의
        $("input[name=check]").prop("checked", true);
      }else{
        //name값이 check인 인풋태그들의 체크드속성을 트루로 정의
        $("input[name=check]").prop("checked", false);
      }
    });
    $("input[name=check]").click(function(){
      $("#checkbox").prop("checked", false);
     });
    
 	 $("#delete_btn").click(function(){
	   var confirm_val = confirm("정말 삭제하시겠습니까?");
	   //boolean 값을 받음
	   if(confirm_val) {
	    var checkArr = new Array();
	    var checkArr2 = new Array();
	    var checkArr3 = new Array();
	    // check값들을 받을 배열을 선언
	    $("input[name=check]:checked").each(function(){
	     checkArr.push($(this).attr("data-eno"));
	     //배열안에 
	     //checkArr2.push($(this).attr("data-img"));
	     //checkArr3.push($(this).attr("data-thumb"));
	    });
    	$("input[name=check]:checked").closest("td").children(".imgPath").each(function(){
 	     checkArr2.push($(this).attr("data-img"));
		    });
    	$("input[name=check]:checked").closest("td").children(".imgThumb").each(function(){
 	     checkArr3.push($(this).attr("data-thumb"));
		    });
	//ajax
  $.ajax({
    url : "/adminBook/adminBookDelete",
    type : "post",
    data : { 
      check : checkArr,
      check2 : checkArr2,
    	check3 : checkArr3
    },
    success : function(){
    location.href = "/adminBook/adminBookList";
    }
    //ajax 에서 해당 url로 post 타입으로 데이터를 보냄
    //즉 컨트롤러의 adminBookDelete post로 데이터를 보내서 처리함
    //성공시 함수 실행(페이지 이동)
   });
  } 
 });
 
   // 검색 스크립트
   $(document).on('click', '#btnSearch', function(e) {
     e.preventDefault();
 /*  var url = "${pageContext.request.contextPath}/adminBook/adminBookList"; */
 		var url = "${getAdminBookList}";
 		url = url + "?searchType=" + $('#searchType').val();
     url = url + "&keyword=" + $('#keyword').val();
     location.href = url;
     console.log(url);
   }); 
  });
 	//페이지네이션
 	//이전 버튼 글릭
   function fn_prev(page, range, rangeSize, searchType, keyword) {
     var page = ((range - 2) * rangeSize) + 1;
     var range = range - 1;
     var url = "${pageContext.request.contextPath}/adminBook/adminBookList";
     url = url + "?page=" + page;
     url = url + "&range=" + range;
     url = url + "&searchType=" + $('#searchType').val();
     url = url + "&keyword=" + keyword;

     location.href = url;
   }
   //페이지 번호 클릭
   function fn_pagination(page, range, rangeSize, searchType, keyword) {
     var url = "${pageContext.request.contextPath}/adminBook/adminBookList";
     url = url + "?page=" + page;
     url = url + "&range=" + range;
     url = url + "&searchType=" + $('#searchType').val();
     url = url + "&keyword=" + keyword;
     location.href = url;
   }
   //다음 버튼 이벤트
   function fn_next(page, range, rangeSize, searchType, keyword) {
     var page = parseInt((range * rangeSize)) + 1;
     var range = parseInt(range) + 1;
     var url = "${pageContext.request.contextPath}/adminBook/adminBookList";
     url = url + "?page=" + page;
     url = url + "&range=" + range;
     url = url + "&searchType=" + $('#searchType').val();
     url = url + "&keyword=" + keyword;
     location.href = url;
   }
</script>
</head>
<body>
	<div class="container">
		<h2 style="text-align: center;" class="text-primary" id="title">E-book
			관리</h2>
		<div class="row col-md-6" id="box1">
			<div class="input-group">
				<select class="custom-select col-md-3" id="searchType"
					aria-label="Example select with button addon">
					<option selected value="e_book_title">제목</option>
					<option value="e_book_writer">작가</option>
					<option value="e_book_publisher">출판사</option>
					<option value="e_book_tag">태그</option>
				</select> <input type="text" class="form-control" id="keyword"
					aria-label="Text input with dropdown button">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button"
						id="btnSearch">
						<i class="fa fa-search" aria-hidden="true"></i>
					</button>
				</div>
			</div>
		</div>
		<div class="row" id="box2">
			<table class="table table-striped col-">
				<thead>
					<tr>
						<th>
							<input type="checkbox" id="checkbox">
						</th>
						<th>번호</th>
						<th>제목</th>
						<th>저자</th>
						<th>출판사</th>
						<th>태그</th>
					</tr>
				</thead>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>
						<input type="checkbox" name="check" data-eno="${list.e_book_num}" value="${list.e_book_num}">
						<input type="hidden" class="imgPath" data-img="${list.e_book_img_path}" value="${list.e_book_img_path}">
						<input type="hidden" class="imgThumb" data-thumb="${list.e_book_thumbnail}" value="${list.e_book_thumbnail}">
						</td>
						<td>${list.e_book_num}</td>
						<td><a
							href="/adminBook/adminBookMod?e_book_num=${list.e_book_num}">${list.e_book_title}</a></td>
						<td>${list.e_book_writer}</td>
						<td>${list.e_book_publisher}</td>
						<td>${list.e_book_tag}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="row btn-toolbar" id="box3">
			<div class="btn-group mr-2">
				<button class="btn btn-primary" id="delete_btn" >삭제</button>
			</div>
			<div class="btn-group mr-2">
				<button class="btn btn-primary" id="modify_btn">수정</button>
			</div>
			<div class="btn-group mr-2 offset-md-8 col">
				<a href="/adminBook/adminBookReg"><button
						class="btn btn-primary col-sm-12">등록</button></a>
			</div>
		</div>
		<div id="paginationBox">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}','${search.searchType }', '${search.keyword }');">Previous</a></li>
				</c:if>
				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
					<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType }', '${search.keyword }');"> ${idx} </a></li>
				</c:forEach>
				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}',${search.searchType }', '${search.keyword }');">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>
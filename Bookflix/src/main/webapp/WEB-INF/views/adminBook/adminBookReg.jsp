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
<meta name="description" content="기본 폼 예시 페이지" />

<title>TestPageForm</title>

<!-- *************************************************** -->
	
<!-- DatePicker -->
<script src="<%=request.getContextPath()%>/resources/datepicker/bootstrap-datepicker.js"></script>
	
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/datepicker/bootstrap-datepicker3.css">

<!-- *************************************************** -->

  <style>
    h1{
      text-align: center;
    }
    #top{
      margin-top: 80px;
    }
    .xel{
      margin-bottom: 25px;
    }
    #bottom{
      margin-bottom: 32px;
    }
    .container{
    	width : 1000px;
    }
  </style>


</head>
<body>
	<div class="container">

		<h1 class="text-primary">E-Book 등록</h1>

		<form>
			<div class="input-group xel" id="top">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control" name="E_BOOK_TITLE">
			</div>

			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">저자</span>
				</div>
				<input type="text" class="form-control" name="E_BOOK_WRITER">
			</div>

			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">역자</span>
				</div>
				<input type="text" class="form-control" name="E_BOOK_TRANSLATER">
			</div>

			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">출판사</span>
				</div>
				<input type="text" class="form-control" name="E_BOOK_PUBLISHER">
			</div>

			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">카테고리</span>
				</div>
				<select class="custom-select" id="inputGroupSelect02">
					<option selected>선택하시오</option>
					<option value="소설" name="E_BOOK_TAG">소설</option>
					<option value="2">장르2</option>
					<option value="3">장르3</option>
				</select>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">이미지</span>
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="inputGroupFile01" name="">
					<label class="custom-file-label" for="inputGroupFile01">파일찾기</label>
				</div>
			</div>

			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">목차</span>
				</div>
				<textarea class="form-control col-sm-12" rows="6" name="E_BOOK_INDEX"></textarea>
			</div>
 
			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">소개</span>
				</div>
				<textarea class="form-control col-sm-12" rows="8" name="E_BOOK_INFO"></textarea>
			</div>

			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">출판일</span>
				</div>
				<input type="text" id="datePicker" placeholder="날짜 선택"
					class="form-control col-md-3" name="E_BOOK_DATE">
			</div>

			<script>
        $('#datePicker').datepicker({
          format : "yyyy-mm-dd",
        });

        $('#click-btn').on('click', function() {
          var date = $('#datePicker').val();
          alert(date);
        });
        // 날짜값 확인하기
      </script>

			<button class="btn btn-info col-sm-2 offset-5" id="bottom">등록</button>
		</form>
	</div>
</body>
</html>
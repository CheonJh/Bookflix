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
<script
	src="<%=request.getContextPath()%>/resources/datepicker/bootstrap-datepicker.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/datepicker/bootstrap-datepicker3.css">

<!-- *************************************************** -->

<style>
h1 {
	text-align: center;
}

#top {
	margin-top: 80px;
}

.xel {
	margin-bottom: 25px;
}

#bottom {
	margin-bottom: 32px;
}

.container {
	width: 1000px;
}

.select_img img {
	background-size: cover;
	margin: 70px 0;
}

.select_img {
	text-align: center;
	height: 520px;
	background-color: grey;
	justify-content: center;
}
#bottom{
	justify-content : center;
	margin-top : 24px;
}
.input-group-text{
	
	width : 70px;
}
</style>

<script>
  
</script>

</head>
<body>
	<div class="container">

		<h1 class="text-primary">E-Book 등록</h1>

		<form role="form" autocomplete="on" method="post"
			enctype="multipart/form-data">
			<div class="input-group xel" id="top">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control" name="e_book_title">
			</div>

			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">저자</span>
				</div>
				<input type="text" class="form-control" name="e_book_writer">
			</div>

			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">역자</span>
				</div>
				<input type="text" class="form-control" name="e_book_translater">
			</div>

			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">출판사</span>
				</div>
				<input type="text" class="form-control" name="e_book_publisher">
			</div>

			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">목차</span>
				</div>
				<textarea class="form-control col-sm-12" rows="6"
					name="e_book_index"></textarea>
			</div>

			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">소개</span>
				</div>
				<textarea class="form-control col-sm-12" rows="8" name="e_book_info"></textarea>
			</div>

			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">출판일</span>
				</div>
				<input type="text" id="datePicker" placeholder="날짜 선택"
					class="form-control col-md-3" name="e_book_date">
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

			<div class="input-group xel">
				<div class="input-group-prepend">
					<span class="input-group-text">태그</span>
				</div>
				<input type="text" class="form-control" name="e_book_tag">
			</div>



			<div class="inputArea input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text" for="e_book_img_path">이미지</label>
				</div>
				<input type="file" id="e_book_img_path" name="file" />
				<script>
          $("#e_book_img_path").change(
              function() {
                if (this.files && this.files[0]) {
                  var reader = new FileReader;
                  reader.onload = function(data) {
                    $(".select_img img").attr("src", data.target.result).width(
                        500);
                  }
                  reader.readAsDataURL(this.files[0]);
                }
              });
        </script>

				<%-- <%=request.getRealPath("/")%>--%>

			</div>

			<div class="row select_img">
				<img src="" />
			</div>
			<div class="row" id="bottom">
				<button type="submit" class="btn btn-primary">등록</button>
			</div>
		</form>

	</div>
</body>
</html>
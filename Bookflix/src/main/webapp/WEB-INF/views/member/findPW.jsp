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
<meta name="author" content="천재헌" />
<meta name="description" content="비밀번호 찾기 페이지" />

<title>Bookflix 비밀번호 찾기</title>


<style type="text/css">
html, body {
	height: 100%;
}

#title {
	text-align: center;
}

h1 {
	margin-bottom: 3rem;
}

.container {
	height: 100%;
}

.container>.row {
	height: 100%;
}
</style>

<script>
  $(document).ready(function() {
    $("#btn").click(function() {
      var find = new Array();

      find.push($("#email").val());
      find.push($("#name").val());
      find.push($("#phone").val());

      $.ajax({
        url : "/member/findPW",
        type : "post",
        data : {
          findArr : find
        },
        success : function(result) {

          if (result == 1) {
            console.log("성공");
            alert("메일발송 성공 메일을 확인해주세요");
            location.href = "/";
          }
          if (result == 0) {
            console.log("실패");
            alert("일치하는 아이디가 없습니다. 다시입력해주세요");
          }

        },
        error : function() {
          console.log("실패");
          alert("다시 시도해 주세요");
        }
      //ajax 에서 해당 url로 post 타입으로 데이터를 보냄
      //즉 컨트롤러의 adminBookDelete post로 데이터를 보내서 처리함
      //성공시 함수 실행(페이지 이동)
      });
    });
  });
</script>


</head>
<body>
	<div class="container">
		<div class="row align-items-center">
			<div class="col">
				<h1 class="text-primary" id="title">비밀번호 찾기</h1>
				<div class="form-group row ">
					<label for="email" class="col-sm-2 offset-3 col-form-label">이메일</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="email"
							placeholder="이메일을 입력하세요." required>
					</div>
				</div>
				<div class="form-group row ">
					<label for="name" class="col-sm-2 offset-3 col-form-label">이름</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="name"
							placeholder="내용을 입력하세요." required>
					</div>
				</div>
				<div class="form-group row ">
					<label for="phone" class="col-sm-2 offset-3 col-form-label">전화번호</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="phone"
							placeholder="내용을 입력하세요." required>
					</div>
				</div>
				<!-- 등록버튼 -->
				<div class="form-group row">
					<div class="col-sm-2 offset-5">
						<button class="btn btn-primary" id="btn">찾기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
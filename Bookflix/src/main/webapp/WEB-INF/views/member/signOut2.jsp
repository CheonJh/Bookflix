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
<meta name="description" content="회원탈퇴 페이지2" />

<title>Bookflix 회원탈퇴</title>

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
<style type="text/css">
h3 {
  text-align: center;
  font-weight: bold;
}

.wrap {
  max-width: 500px;
  margin: 0 auto;
}

.form-check {
  padding: 10px 0;
  font-weight: bold;
}

.text {
  width: 100%;
  margin: 10px 0;
}

.form-group {
  display: flex;
  justify-content: space-between;
}

.form-group button {
  width: 49
}
</style>
</head>
<body>
  <br>
  <h3>회원 탈퇴</h3>
  <br>
  <div class="wrap">
    <form action="#">
      <div class="form-check">
        <input type="radio" class="form-control-input" name="Outlist"
          value="option1" id="list1"> <label for="list1"
          class="form-check-label"> 자주 사용하지 않아서 </label>
      </div>
      <div class="form-check">
        <input type="radio" class="form-control-input" name="Outlist"
          value="option2" id="list2"> <label for="list2"
          class="form-check-label"> 도서 컨텐츠가 부족해서 </label>
      </div>
      <div class="form-check">
        <input type="radio" class="form-control-input" name="Outlist"
          value="option3" id="list3"> <label for="list3"
          class="form-check-label"> 잦은 시스템 오류 때문에 </label>
      </div>
      <div class="form-check">
        <input type="radio" class="form-control-input" name="Outlist"
          value="option4" id="list4"> <label for="list4"
          class="form-check-label"> 전반적으로 이용이 어려워서 </label>
      </div>
      <div class="form-check">
        <input type="radio" class="form-control-input" name="Outlist"
          value="option5" id="list5"> <label for="list5"
          class="form-check-label"> 구독 요금이 비싸서 </label>
      </div>
      <div class="form-check">
        <input type="radio" class="form-control-input" name="Outlist"
          value="option6" id="list6"> <label for="list6"
          class="form-check-label"> 개인정보 및 보안 우려 때문에 </label>
      </div>
      <div class="form-check">
        <input type="radio" class="form-control-input" name="Outlist"
          value="option7" id="list7"> <label for="list7"
          class="form-check-label"> 다른 아이디로 가입하고자 </label>
      </div>
      <div class="form-check">
        <input type="radio" class="form-control-input" name="Outlist"
          value="option8" id="list8"> <label for="list8"
          class="form-check-label "> 기타(직접작성) </label> <input
          class="text form-control" type="text"
          placeholder="탈퇴 내용 간략히 입력">
      </div>
      <div class="form-group">
        <button type="button" class="btn btn-info">나중에 하기</button>
        <button type="button" class="btn btn-secondary">탈퇴하기</button>
      </div>
    </form>
  </div>
</body>
</html>
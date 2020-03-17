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
<meta name="description" content="회원 가입 페이지" />

<title>Bookfilx 회원가입</title>

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
body {
  background-color: #ccc;
}

.wrap {
  width: 500px;
  margin: auto;
}

.title {
  padding: 30px;
}

.fontcolor {
  color: dodgerblue;
}

.accept {
  text-align: center;
}

.button {
  margin-top: 20px;
  display: flex;
  justify-content: center;
}

label {
  text-align: right;
}
</style>

</head>
<body>
<div class="title">
    <h3>회원가입</h3>
    <hr>
  </div>
  <form action="#">
    <div class="wrap">
      <div class="form-group row">
        <label for="email" class="col-sm-4 col-form-label">이메일</label>
        <input type="text" class="form-control col-sm-8" placeholder="이메일주소" id="email">
      </div>
      <div class="form-group row">
        <label for="password" class="col-sm-4 col-form-label">비밀번호</label>
        <input type="password" class="form-control col-sm-8" placeholder="비밀번호" id="password">
      </div>
      <div class="form-group row">
        <label for="pwconfirm" class="col-sm-4 col-form-label">비밀번호 확인</label>
        <input type="password" class="form-control col-sm-8" placeholder="비밀번호 확인" id="pwconfirm">
      </div>
      <div class="form-group row">
        <label for="name" class="col-sm-4 col-form-label">이름</label>
        <input type="text" class="form-control col-sm-8" placeholder="펭수" id="name">
      </div>
      <div class="form-group row">
        <label for="nick" class="col-sm-4 col-form-label">닉네임</label>
        <input type="text" class="form-control col-sm-8" placeholder="펭펭펭" id="nick">
      </div>
      <div class="form-group row">
        <label for="birth" class="col-sm-4 col-form-label">생년월일</label>
        <input type="text" class="form-control col-sm-8" placeholder="1922-10-04" id="birth"></div>
      <div class="form-group row">
        <label for="phone" class="col-sm-4 col-form-label">연락처</label>
        <input type="text" class="form-control col-sm-8" placeholder="010-1234-5678" id="phone"></div>
      
    </div>
    <div class="accept">
      <span>약관동의</span>
      <input type="checkbox">
      <span><span class="fontcolor">이용약관</span>에 동의합니다.</span>
    </div>
    <div class="button">
      <button type="button" class="btn btn-secondary">회원가입</button>
    </div>
  </form>
</body>
</html>
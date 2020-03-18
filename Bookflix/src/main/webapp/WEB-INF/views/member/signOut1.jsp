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
<meta name="description" content="회원탈퇴 페이지" />

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
}

body {
  background-color: #fff;
}

.wrap {
  max-width: 1200px;
  margin: 0 auto;
}

.form-group {
  display: flex;
  justify-content: space-between;
}

.form-group button {
  width: 49%;
}
</style>
</head>
<body>
  <h3>회원 탈퇴</h3>
  <br>
  <div class="wrap">
    <div class="usage">
      <p>ㅇㅇ님의 이용내역</p>
      <p>ㆍ남은 구독기간 : 00일</p>
    </div>
    <br>
    <div class="outnotice text-danger">
      <p>탈퇴시 유의사항</p>
      <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.
        Voluptatibus, blanditiis laudantium laboriosam adipisci non
        incidunt explicabo, deserunt sint, nulla voluptatem aliquam
        velit cumque! Eos eligendi, eveniet corporis officiis tenetur
        necessitatibus.</p>
    </div>

    <form action="#">
      <div class="accept">
        유의사항을 숙지 하였으며 탈퇴에 동의합니다. <input type="checkbox">
      </div>
      <br>
      <div class="form-group">
        <button type="button" class="btn btn-primary">돌아가기</button>
        <button type="button" class="btn btn-danger">탈퇴하기</button>
      </div>
    </form>

  </div>
</body>
</html>
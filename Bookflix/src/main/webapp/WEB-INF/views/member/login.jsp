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
<meta name="description" content="로그인 페이지" />

<title>Bookflix 로그인</title>

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

a {
  text-decoration: none;
}

body {
  background-color: #ddd;
}

button {
  width: 100%;
}

html, body {
  height: 100%;
}

.container {
  width: 400px;
  height: 100%;
}

.container>.row {
  height: 100%;
}

.form-group * {
  margin: 16px 0;
}
</style>
</head>
<body>
  <div class="container">

    <div class="row align-items-center">
      <div class="col">
        <h3>BOOKFLIX</h3>
        <form action="#">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="이메일">
            <input type="password" class="form-control"
              placeholder="비밀번호">

            <button type="button" class="btn btn-dark">로그인</button>
          </div>
        </form>
        <div class="link">
          <a href="#">회원가입</a> <a href="#">아이디/비밀번호 찾기</a>
        </div>
      </div>
    </div>

  </div>
</body>
</html>
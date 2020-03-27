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
<meta name="description" content="기본 폼 예시 페이지" />

<title>관리자 네비</title>

<style type="text/css">
img {
  width: 200px;
}

body {
  height: 100%;
}

#nav {
  border: 1px solid #000;
  width: 200px;
  height: 100vh;
  position: relative;
}

.nav-link.aa {
  position: absolute;
  bottom: 100px;
}
</style>
</head>
<body>
  <nav class="nav flex-column" id="nav">
    <div>
      <img src="/resources/imgs/common/logo.png" alt="">
    </div>
    <a class="nav-link active" href="#">E-book 관리</a> <a
      class="nav-link" href="#">공지사항 관리</a> <a class="nav-link" href="#">FAQ
      관리</a> <a class="nav-link aa" href="#">메인페이지로</a>
  </nav>
</body>
</html>
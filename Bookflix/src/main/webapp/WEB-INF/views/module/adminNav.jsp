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

<!-- <title>관리자 네비</title> -->
<link rel="stylesheet" href="/resources/css/module/adminNav.css" />

</head>
<body>
  <nav class="nav flex-column" id="nav">
    <div>
      <a href="/"><img src="/resources/imgs/common/logo.png" alt=""></a>
    </div>
    <p>
      <a class="nav-link active" href="/adminBook/adminBookList">▷
        E-book 관리</a>
    </p>
    <p>
      <a class="nav-link" href="/adminInfo/admNoticeList">▷ 공지사항 관리</a>
    </p>
    <p>
      <a class="nav-link" href="/adminInfo/admFAQList">▷ FAQ 관리</a>
    </p>
  </nav>
</body>
</html>
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

<title>임시 메인</title>
<style>
.testPage {
  height: 400px;
  width: 1200px;
  margin: 0 auto;
}

.testPage li {
  font-size: 2rem;
}
</style>
</head>
<body>
  <div class="testPage">
    <h1>임시 메인 페이지</h1>

    <ul>
      <li><a href="/adminInfo/admNoticeList">관리자 공지 목록 페이지</a></li>
      <li><a href="/adminBook/adminBookList">관리자 도서 목록 페이지</a></li>
      <li><a href="/myPage/mylib">마이페이지 내서재 페이지</a></li>
      <li><a href="/book/book?e_book_num=1">도서 상세 페이지</a></li>
    </ul>
  </div>
</body>
</html>
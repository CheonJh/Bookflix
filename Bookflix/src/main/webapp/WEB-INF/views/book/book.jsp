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
<meta name="author" content="성인규" />
<meta name="description" content="책 상세 페이지" />

<title>책 상세 페이지</title>

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
<!-- 현재 페이지 CSS -->
<link rel="stylesheet"
  href="<%=request.getContextPath()%>/resources/css/book/book.css">

</head>
<body>
  <div class="wrap">
    <div class="container">
      <div class="row">
        <div class="col-sm-4 offset-sm-1 thumbnail">
          <a href="#"> <img src="http://via.placeholder.com/200X350"
            alt="#">
          </a>
        </div>
        <div class="col-sm-6 offset-sm-1 wrapinfo">
          <h4>책 제목${book.e_book_title}</h4>
          <br>
          <div>
            <div class="writer">저자 ${book.e_book_writer}</div>
            <div class="writer">역자 ${book.e_book_translater}</div>
            <div class="writer">출판사 ${book.e_book_publisher}</div>
            <br>
            <div class="like">좋아요${book.e_book_thumbupcnt}</div>
          </div>
          <form action="#">
            <button type="button" class="btn btn-primary">e-북
              읽기</button>
            <button type="button" class="btn btn-primary">좋아요</button>
            <button type="button" class="btn btn-primary">찜하기</button>
          </form>

        </div>
      </div>
    </div>
    <div class="wrapintro">
      <div class="summary">
        <h5>책 소개</h5>
        <hr>
        <p>
          ${book.e_book_info}
        </p>
      </div>
      <br> <br>
      <div class="conlist">
        <h5>목차</h5>
        <hr>
        <p>
          ${book.e_book_index}
        </p>
      </div>
    </div>
    <div class="recommend">
      <h5>관련도서</h5>
      <hr>
      <ul class="reclist">
        <li><a href="#"> 
        <img src="http://via.placeholder.com/200X350" alt="#">
            
        </a>
        <div>책 제목</div>
        
      </ul>
    </div>
  </div>
  <a class="sidetop" href="#">TOP</a>
</body>
</html>
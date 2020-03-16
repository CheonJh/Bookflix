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
<meta name="author" content="김경재" />
<meta name="description" content="푸터 모듈 페이지" />

<title>TestPageForm</title>

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

<!-- 푸터 CSS -->
<link rel="stylesheet"
  href="<%=request.getContextPath()%>/resources/css/module/footer.css">
  
<!-- *************************************************** -->

</head>
<body>
  <footer>
    <div class="foot-nav">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-2"></div>
          <div class="col-sm-8">
            <ul class="nav-li">
              <li><a href="#">공지사항</a></li>
              <li>l</li>
              <li><a href="#">FAQ</a></li>
              <li>l</li>
              <li><a href="#">이용약관</a></li>
              <li>l</li>
              <li><a href="#">개인정보처리방침</a></li>
            </ul>
          </div>
          <div class="col-sm-2"></div>
        </div>
      </div>
    </div>
    <div class="foot-info">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-2"></div>
          <div class="col-sm-8 company-info">
            <p>상호명 : (주)북플릭스 l 서울특별시 영등포구 여의도동 123</p>
            <p>대표 : 천재헌 l 사업자 등록번호 : 123-45-67890</p>
            <p>Tel : 02-123-4567 l Fax : 02-123-4568</p>
            <p>E-mail : bookflix@bookflix.co.kr</p>
          </div>
          <div class="col-sm-2"></div>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<title>footer</title>

<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/module/footer.css">

</head>
<body>
  <footer>
    <div class="foot-nav">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-2"></div>
          <div class="col-sm-8">
            <ul class="nav-li">
              <li><a href="/info/noticeList?num=1">공지사항</a></li>
              <li>|</li>
              <li><a href="/info/FAQList">FAQ</a></li>
              <li>|</li>
              <li><a href="#">이용약관</a></li>
              <li>|</li>
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
            <p>상호명 : (주)북플릭스 | 서울특별시 영등포구 여의도동 123</p>
            <p>대표 : 천재헌 | 사업자 등록번호 : 123-45-67890</p>
            <p>Tel : 02-123-4567 | Fax : 02-123-4568</p>
            <p>E-mail : bookflix@bookflix.co.kr</p>
          </div>
          <div class="col-sm-2"></div>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>
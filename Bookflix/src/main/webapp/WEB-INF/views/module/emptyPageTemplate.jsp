<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 타일즈 -->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="천재헌" />
<meta name="description" content="메뉴가 없는 빈 페이지 템플릿" />

<!-- 파비콘 삽입 -->
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/imgs/common/favicon.ico" />
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/imgs/common/favicon.ico" />
<title>BOOKFLIX</title>

<!-- *************************************************** -->

<!-- jQuery 연결 -->
<script src="<%=request.getContextPath()%>/resources/common/jQuery/jquery-1.12.4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/jQuery/jquery-migrate-1.4.1.min.js"></script>

<!-- bootstrap 연결 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/bootstrap/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/resources/common/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- font-awesome 연결 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/font-awesome/css/font-awesome.min.css">

<!-- 공통 CSS 연결 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/commonStyle.css">

<!-- *************************************************** -->

  <style type="text/css">
    .empty{
      width: 1200px;
      margin: 0 auto;
    }
  </style>
</head>
<body>
  <div class="empty">
    <tiles:insertAttribute name="content" />
  </div>
</body>
</html>
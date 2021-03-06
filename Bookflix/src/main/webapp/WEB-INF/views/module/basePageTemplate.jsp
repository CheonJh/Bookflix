<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 타일즈 -->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=1.0, initial-scale=1.0">
<meta name="author" content="천재헌" />
<meta name="description" content="기본 페이지 템플릿, 헤더-바디-푸터 구조" />

<!-- 파비콘 삽입 -->
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/imgs/common/favicon.ico" />
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/imgs/common/favicon.ico" />

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

<style>
.width-120{
  width: 100%;
  height: 120px;
}
</style>
</head>
  <body>

    <tiles:insertAttribute name="header" />
    <div class="width-120"></div>
    <tiles:insertAttribute name="content" />
    <tiles:insertAttribute name="footer" />

  </body>
</html>
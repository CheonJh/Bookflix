<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="천재헌" />
<meta name="description" content="기본 폼 예시 페이지" />

<title>TestPageForm</title>

  <!-- *************************************************** -->
  
  <!-- jQuery 연결 -->
  <script src="<%=request.getContextPath() %>/resources/common/jQuery/jquery-1.12.4.min.js"></script>
  <script src="<%=request.getContextPath() %>/resources/common/jQuery/jquery-migrate-1.4.1.min.js"></script>

  <!-- bootstrap 연결 -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/common/bootstrap/css/bootstrap.min.css">
  <script src="<%=request.getContextPath() %>/resources/common/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- font-awesome 연결 -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/common/font-awesome/css/font-awesome.min.css">
  
  <!-- 공통 CSS 연결 -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/commonStyle.css">

  <!-- *************************************************** -->
  
  
</head>
<body>

<h1>테스트</h1>

</body>
</html>
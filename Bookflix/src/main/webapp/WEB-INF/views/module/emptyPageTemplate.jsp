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

<title>emptyPageTemplate</title>
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
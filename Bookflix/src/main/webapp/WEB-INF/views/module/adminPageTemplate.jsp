<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<!-- 타일즈 -->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="천재헌" />
<meta name="description" content="관리자페이지 템플릿, 좌측네비-바디 구조" />

<title>adminPageTemplate</title>

<style type="text/css">
.con{
  width: 1200px;
  margin: 0 auto;
}
.adminNav, .adminContent{
  float: left;
}
</style>
</head>
<body>
  <div class="con">
    <div class="adminNav">
      <tiles:insertAttribute name="adminNav" />
    </div>
    <div class="adminContent">
      <tiles:insertAttribute name="adminContent" />
    </div>
  </div>
</body>
</html>
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
<meta name="author" content="안규철" />
<meta name="description" content="기본 폼 예시 페이지" />

<title>Error404</title>

<!-- Google font -->
<!-- 	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,700" rel="stylesheet">-->

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/error/style.css" />

</head>

<body>

	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
				<h1>
					4<span></span>4
				</h1>
			</div>
			<h2>찾는 페이지가 없습니다</h2>
			<p>찾으시는 페이지가 존재하지 않거나 사라졌습니다</p>
			<a href="/">메인페이지로 돌아가기</a>
		</div>
	</div>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>

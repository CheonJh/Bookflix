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
<meta name="description" content="헤더 모듈 페이지" />

<title>header</title>

<style>
@import url(font.css);

body * {
  margin: 0;
  padding: 0;
}

li {
  list-style: none;
}

a {
  text-decoration: none;
  display: block;
  color: #333;
}

header {
  width: 100%;
  height: 100%;
}


/* 로고 part */
.logo {
  width: 100%;
  height: 100%;
}

.logo a img {
  width:500px;
  display: block;
  margin: 0 auto;
}


/* 내비게이션 part */
#gnb {
  width: 100%; height: 100%;
  background-color: #eee;
}

#gnb .nav {
  width: 100%; height: 35px;
}

#gnb .nav li {
  float: left;
  width: 25%;
}

#gnb .nav li a {
  text-align: center;
  margin-top: 10px;
  margin-bottom: 10px;
  font-size: 15px;
  font-weight: bold;
  text-decoration: none;
}

/* 로그인 part */
.signin {
  width: 100%; height: 100%;
}

.signin li {
  float: left;
  width: 50%;
}

.signin li a {
  text-align: center;
  margin-top: 10px;
  margin-bottom: 10px;
  font-size: 15px;
  font-weight: bold;
  text-decoration: none;
}
</style>


<!-- css -->
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/module/header.css"> --%>

</head>
<body>

  <header>
  
    <div class="logo">
      <a href="#"><img src="resources/imgs/common/logo.png" alt="logo"></a>
    </div>
    <div id="gnb">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-3"></div>
          <div class="col-sm-6">
            <ul class="nav">
              <li><a href="#">검색</a></li>
              <li><a href="#">신간</a></li>
              <li><a href="#">인기</a></li>
              <li><a href="#">고객센터</a></li>
            </ul>
          </div>
          <div class="col-sm-3">
            <ul class="signin">
              <!-- 세션 찾아서 멤버 없으면 로그인, 회원가입 출력 -->
              <c:if test="${member == null}">
                <li><a href="/member/login">로그인</a></li>
                <li><a href="/member/signIn">회원가입</a></li>
              </c:if>
              <!-- 세션 있으면 회원 닉네임, 로그아웃 출력 -->
              <c:if test="${member != null}">
                <!-- 관리자 -->
                <c:if test="${member.member_grade==0}">
                  <li><a href="/adminBook/adminBookList">${member.member_nickname}</a></li>
                </c:if>
                <!-- 회원 -->
                <c:if test="${member.member_grade!=0}">
                  <li><a href="/myPage/Page">${member.member_nickname}</a></li>
                </c:if>
                <li><a href="/member/logout">로그아웃</a></li>
              </c:if>

            </ul>
          </div>
        </div>
      </div>
    </div>
  </header>
  
</body>
</html>

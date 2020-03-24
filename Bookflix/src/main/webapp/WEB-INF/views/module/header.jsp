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

<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/module/header.css">

</head>
<body>
  <div class="wrap">
    <header>
      <div class="line">
        <div class="topbar clear">
          <div class="sns">
            <div>
              <div class="container">
                <div class="row">
                  <div class="col">
                    <a href=""><i class="fa fa-facebook-official"></i></a>
                  </div>
                  <div class="col">
                    <a href=""><i class="fa fa-instagram"></i></a>
                  </div>
                  <div class="col">
                    <a href=""><i class="fa fa-twitter-square"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="login">
            <div class="container">
              <div class="row">
                <div class="col"></div>
                <div class="col"></div>
                <div class="col">
                  <div class="container logbtn">
                    <div class="row">
                    
                    <!-- 세션 찾아서 멤버 없으면 로그인, 회원가입 출력 -->
                    <c:if test="${member == null}">
                      <div class="col">
                        <a href="/member/login">로그인</a>
                      </div>
                      <div class="col">
                        <a href="/member/signIn">회원가입</a>
                      </div>
                    </c:if>
                    
                    <!-- 세션 있으면 회원 닉네임, 로그아웃 출력 -->
                    <c:if test="${member != null}">
                      <div class="col">
                        <a href="/myPage/myPage">${member.member_nickname}</a>
                      </div>
                      <div class="col">
                        <a href="/member/logout">로그아웃</a>
                      </div>
                    </c:if>
                    
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="line">
        <div class="header clear">
          <div class="logo ho">
            <a href="/"><img src="/resources/imgs/common/logo.png" alt="logo"></a>
          </div>
          <div id="nav" class="ho">
            <ul id="gnb" class="clear">
              <li><a href="/search/search">검 색</a></li>
              <li><a href="#">신 간</a></li>
              <li><a href="#">인 기</a></li>
              <li><a href="/info/notice">고객센터</a></li>
            </ul>
          </div>
        </div>
      </div>
    </header>
  </div>

</body>
</html>

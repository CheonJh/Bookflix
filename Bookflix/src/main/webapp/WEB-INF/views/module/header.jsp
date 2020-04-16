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

<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/module/header.css">

</head>

<body>
  <header class="fixed-top">
    <!-- 헤더 상단 -->
    <div class="head-top-wrap">
      <div class="head-top">
        <!-- sns -->
        <div class="head-sns float-left">
          <a href="#"><i class="fa fa-facebook-square sns-icon" aria-hidden="true"></i></a>
          <a href="#"><i class="fa fa-twitter-square sns-icon" aria-hidden="true"></i></a>
          <a href="#"><i class="fa fa-youtube-square sns-icon" aria-hidden="true"></i></a>
        </div>
        <!-- login, signin -->
        <div class="head-member float-right">
          <ul class="signin float-right cf">
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
    
    <!-- 헤더 하단 -->
    <div class="head-bottom-wrap">
      <div class="head-bottom cf">
        <!-- 상단 로고 -->
        <div class="head-logo float-left">
          <a href="/">
            <img src="/resources/imgs/common/logo_transparent_680x480.png" alt="logo">
          </a>
        </div>
        <!-- 메뉴 -->
        <div class="head-menu cf">
          <ul class="float-right cf">
            <li><a href="/search/search">검색</a></li>
            <li><a href="/info/noticeList?num=1">고객센터</a></li>
          </ul>
        </div>
      </div>
    </div>
  </header>

</body>
</html>

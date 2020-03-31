<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="김지나" />
<meta name="description" content="기본 폼 예시 페이지" />

<title>Page</title>
<!-- css 연결 -->
<link rel="stylesheet" href="/resources/css/myPage/Page.css" />
<!-- js 연결 -->
<script src="/resources/js/myPage/Page.js"></script>
</head>
<body>
  <div class="title">
    <h3>마이페이지</h3>
    <hr>
  </div>
  <div class="wrap">
    <div class="titlewrap">
      <h4>
        ${member.member_nickname}
        <span class="member">
          <c:if test="${member.member_grade==1}"> (일반회원) </c:if>
          <c:if test="${member.member_grade==2}"> (구독회원) </c:if>
        </span>
      </h4>
      
      <br>
      <c:if test="${member.member_grade==2}">
        <div>구독 잔여 일수 : ${date}일</div>
      </c:if>
      <c:if test="${member.member_grade==1}">
        <button id="sub" name="sub" type="button" class="btn btn-secondary">구독하기</button>
      </c:if>

    </div>

    <br>
    <hr>
    <br>
    <div class="contents">
    <div class = content1>
    <div class="ul">기본 설정</div>
    <div class="li">
      <a href="/member/modifyMember">내 정보</a>
    </div>
    <div class="ul">서비스 관리</div>
    <div class="li">
      <a href="/myPage/mylib">내 서재 관리</a>
    </div>
    <div class="li">
      <a href="/myPage/sub">구독 관리</a>
    </div>
    </div>
    
    <div class = content3>
    <div class="ul">서비스 안내</div>
    <div class="li">
      <a href="/info/noticeList?num=1">고객센터</a>
    </div>
    <div class="li">
      <a href="/member/signOut1">회원탈퇴</a>
    </div>
    </div>
  </div>
  </div>
</body>
</html>
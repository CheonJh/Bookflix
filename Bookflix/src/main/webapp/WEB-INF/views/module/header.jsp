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
<meta name="author" content="김경재" />
<meta name="description" content="헤더 모듈 페이지" />

<!-- <title>header</title> -->

<!--  
<style>
 header {
  width: 100%;
  height: 100%;
}


/* 로고 part */
.logo {
  width: 100%;
  height: 100%;
}

.logo a{
  width: 500px;
  display: block;
  margin: 0 auto;
}

.logo a img {
  width:100%;
  display: block;
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
-->
<!--
<style>
header {
  width : 100%;
  height : 111px;
  position: fixed;
  z-index: 999;
/*   background-color: #000; */
}

.head-top-container{
  width: 100%;
  height: 40px;
  background-color: #000;
  border-bottom: 1px solid #333;
}

.head-bottom-container{
  width: 100%;
  height: 70px;
  background-color: #000;
}

.head-top {
  width: 1200px;
  height: 40px;

}

.head-bottom {
  width: 1200px;
  height: 70px;
/*   background-color: #bbb; */
}

/*********** 
  헤더 상단부 
************/

/* sns - 폰트어썸 */
.sns{
/*   width: 100px; */
  height: 40px;
  margin-left: 20px;
}

.snsicon{
  font-size: 30px;
  margin-top: 5px;
  color: #fff;
}

.snsicon:hover{
  color: #458dd6;
}

/* 회원 로그인, 가입파트 */
.head-member{
/*   width: 200px; */
  height: 100%;
}

.head-member .signin{
  width: 100%;
  height: 100%;
}

.head-member .signin li{
  width: 100px;
  height: 100%;
  float: left;
}

.head-member .signin li a{
  display : block;
  width: 100%;
  line-height: 40px;
  color: #fff;
  text-decoration: none !important;
}
.head-member .signin li a:hover{
  color: #458dd6;
}

/*********** 
  헤더 하단부 
************/

.head-bottom .logo{
  width: 100px;
  height: 70px;
}

.head-bottom .logo a{
  display: block;
  width: 100%;
  height: 100%;
}

.head-bottom .logo img{
  width: 100%;
  height: 100%;
  margin-left: 17px;
  padding: 3px;
  float: left;
}

</style>
-->


<!-- css -->
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/module/header.css"> --%>

<style>
header{
  width: 100%;
  height: 111px;
}
.head-top-wrap{
  width: 1200px;
  height: 40px;
  margin: 0 auto;
  border-bottom: 1px solid #333;
  background-color: #fff;
}
.head-bottom-wrap{
  width: 1200px;
  height: 70px;
  margin: 0 auto;
  background-color: #fff;
}

/* 헤더 상단 */
.head-top{
  width: 100%;
  height: 100%;
}

/* sns - 폰트어썸 */
.head-sns{
/*   width: 100px; */
  height: 40px;
  margin-left: 20px;
}

.snsicon{
  font-size: 30px;
  margin-top: 5px;
  color: #000;
}

.snsicon:hover{
  color: #458dd6;
}

/* 회원 로그인, 가입 */
.head-member{
/*   width: 200px; */
  height: 100%;
}

.head-member .signin{
  width: 100%;
  height: 100%;
}

.head-member .signin li{
  width: 100px;
  height: 100%;
  float: left;
}

.head-member .signin li a{
  display : block;
  text-align: center;
  line-height: 40px;
  color: #000;
  text-decoration: none !important;
}
.head-member .signin li a:hover{
  color: #458dd6;
}

/* 헤더 하단 */
.head-bottom{
  width: 100%;
  height: 100%;
}
/* 헤더 - 로고 */
.head-bottom .head-logo{
  width: 120px;
  height: 70px;
}

.head-bottom .head-logo a{
  display: block;
  width: 100%;
  height: 100%;
}

.head-bottom .head-logo img{
  width: 85px;
  height: 60px;
  margin-top: 5px;
  margin-left: 17px;
  padding: 3px;
  float: left;
}

/* 헤더 - 메뉴 */
.head-menu{
  width: 1080px;
  height: 100%;
}
.head-menu ul{
  width: 200px;
  height: 100%;
}

.head-menu ul li{
  width: 100px;
  height: 100%;
  float: left;
}
.head-menu ul li a{
  display : block;
  text-align: center;
  line-height: 70px;
  color: #000;
  text-decoration: none !important;
  font-size: 1.5rem
}
.head-menu ul li a:hover{
  color: #458dd6;
}

</style>
</head>

<body>
  <header class="fixed-top">
    <!-- 헤더 상단 -->
    <div class="head-top-wrap">
      <div class="head-top">
        <!-- sns -->
        <div class="head-sns float-left">
          <a href="#"><i class="fa fa-facebook-square snsicon" aria-hidden="true"></i></a>
          <a href="#"><i class="fa fa-twitter-square snsicon" aria-hidden="true"></i></a>
          <a href="#"><i class="fa fa-youtube-square snsicon" aria-hidden="true"></i></a>
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

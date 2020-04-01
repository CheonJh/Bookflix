<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="천재헌" />
<meta name="description" content="로그인 페이지" />

<title>Bookflix 로그인</title>
<link rel="stylesheet" href="/resources/css/member/login.css" />

</head>
<body>

  <div class="container">

    <div class="row align-items-center">
      <div class="col">
        
        <h1><a href="/">BOOKFLIX</a></h1>
        
        <form action="/member/login" method="post" autocomplete="off">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="Email" id="member_email" name="member_email">
            <input type="password" class="form-control" placeholder="Password" id="member_pw" name="member_pw">
            <button type="submit" class="btn btn-dark">로그인</button>
          </div>
        </form>
        
        <div class="link clear" >
        <div class="log1"><a class="ab1" href="/member/signIn">회원가입</a></div>
        <div class="log2"><a class="ab2" href="/member/findID">아이디 찾기</a></div>
        <div class="log3"><a class="ab3" href="/member/findPW">비밀번호 찾기</a></div>
        </div>
        
        <c:if test="${msg == false }">
          <p>로그인 실패! 아이디 또는 패스워드를 다시 입력해주세요 :)</p>
        </c:if>
      </div>
    </div>

  </div>

</body>
</html>
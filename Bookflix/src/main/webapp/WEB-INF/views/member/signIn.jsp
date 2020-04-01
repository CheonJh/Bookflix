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
<meta name="description" content="회원 가입 페이지" />

<title>Bookflix 회원가입</title>
<link rel="stylesheet" href="/resources/css/member/signIn.css" />
<script src="/resources/js/member/signIn.js"></script>
</head>
<body>
  <div class="title">
    <h3>회원가입</h3>
    <hr>
  </div>
  <form method="post" autocomplete="off" id="usercheck" name="member">
    <div class="wrap">
    
      <div class="form-group row">
        <label for="member_email" class="col-sm-4 col-form-label">이메일</label>
        <input type="text" class="form-control col-sm-8" placeholder="E-MAIL" id="member_email" name="member_email">
        <div id="email_check" class="check_font"></div>
      </div>
      
      <div class="form-group row">
        <label for="member_pw" class="col-sm-4 col-form-label">비밀번호</label>
        <input type="password" class="form-control col-sm-8" placeholder="Password" id="member_pw" name="member_pw">
        <div id="pw_check" class="check_font"></div>
      </div>
      
      <div class="form-group row">
        <label for="member_pwc" class="col-sm-4 col-form-label">비밀번호 확인</label>
        <input type="password" class="form-control col-sm-8" placeholder="ConfirmPassword " id="member_pwc" name="member_pwc">
        <div id="pwc_check" class="check_font"></div>
      </div>
      
      <div class="form-group row">
        <label for="member_name" class="col-sm-4 col-form-label">이름</label>
        <input type="text" class="form-control col-sm-8" placeholder="Name" id="member_name" name="member_name">
        <div id="name_check" class="check_font"></div>
      </div>
      
      <div class="form-group row">
        <label for="member_nickname" class="col-sm-4 col-form-label">닉네임</label>
        <input type="text" class="form-control col-sm-8" placeholder="NickName" id="member_nickname" name="member_nickname">
        <div id="nickname_check" class="check_font"></div>
      </div>
      
      <div class="form-group row">
        <label for="member_birth" class="col-sm-4 col-form-label">생년월일</label>
        <input type="text" class="form-control col-sm-8" placeholder="ex)19891004" id="member_birth" name="member_birth">
        <div id="birth_check" class="check_font"></div>
      </div>
      
      <div class="form-group row">
        <label for="member_phone" class="col-sm-4 col-form-label">휴대폰 번호</label>
        <input type="text" class="form-control col-sm-8" placeholder="('-'없이 번호만 입력해주세요.)" id="member_phone" name="member_phone">
        <div id="phone_check" class="check_font"></div>
      </div>

    </div>
    
    <div class="accept">
      <span></span>
      <input type="checkbox" id="agreeCheckBox">
      <span><span class="fontcolor">이용약관</span>에 동의합니다.</span>
    </div>
    
    <div class="submit">
      <button type="submit" class="btn btn-secondary">회원가입</button>
    </div>
    
  </form>
</body>
</html>
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

<title>Bookflix 내 정보 수정</title>
<link rel="stylesheet" href="/resources/css/member/modifyMember.css" />
<script src="/resources/js/member/modifyMember.js"></script>

</head>
<body>
  <div class="title">
    <h3>내 정보 수정</h3>
    <hr>
  </div>
  <form method="post" autocomplete="off" id="usercheck" name="member">
    <div class="wrap">
    
      <div class="form-group row">
        <label for="member_email" class="col-sm-4 col-form-label">E-Mail</label>
        <input type="text" class="form-control col-sm-8" value="${member.member_email}" id="member_email" name="member_email" readonly="readonly">
        <div id="email_check" class="check_font"></div>
      </div>
      
      <div class="form-group row">
        <label for="member_pwPre" class="col-sm-4 col-form-label">현재 비밀번호</label>
        <input type="password" class="form-control col-sm-8" id="member_pwPre" name="member_pwPre" placeholder="정보수정을 위해 반드시 입력">
        <div id="pw_checkPre" class="check_font"></div>
      </div>
      
      
      <div class="hide-form">
      
 
        <div class="form-group row">
          <label for="member_pw" class="col-sm-4 col-form-label">변경할 비밀번호</label>
          <input type="password" class="form-control col-sm-8" placeholder="Password" id="member_pw" name="member_pw">
          <div id="pw_check" class="check_font"></div>
        </div>
        
        <div class="form-group row">
          <label for="member_pwc" class="col-sm-4 col-form-label">비밀번호 확인</label>
          <input type="password" class="form-control col-sm-8" placeholder="Password" id="member_pwc" name="member_pwc">
          <div id="pwc_check" class="check_font"></div>
        </div>
        
        <div class="form-group row">
          <label for="member_name" class="col-sm-4 col-form-label">이름</label>
          <input type="text" class="form-control col-sm-8" value="${member.member_name}" id="member_name" name="member_name" readonly="readonly">
          <div id="name_check" class="check_font"></div>
        </div>
        
        <div class="form-group row">
          <label for="member_nickname" class="col-sm-4 col-form-label">닉네임</label>
          <input type="text" class="form-control col-sm-8" value="${member.member_nickname}" id="member_nickname" name="member_nickname">
          <div id="nickname_check" class="check_font"></div>
        </div>
        
        <div class="form-group row">
          <label for="member_birth" class="col-sm-4 col-form-label">생년월일</label>
          <input type="text" class="form-control col-sm-8" value="${member.member_birth}" id="member_birth" name="member_birth">
          <div id="birth_check" class="check_font"></div>
        </div>
        
        <div class="form-group row">
          <label for="member_phone" class="col-sm-4 col-form-label">휴대폰 번호</label>
          <input type="text" class="form-control col-sm-8" value="${member.member_phone}" id="member_phone" name="member_phone" placeholder="'-'없이 번호만 입력해주세요.">
          <div id="phone_check" class="check_font"></div>
        </div>
  
      </div>
    </div>
    <div class="submit">
      <button id="btna" class="btn btn-primary" type="button">확인</button> 
      <button id="btn_back" type="button" class="btn btn-secondary">돌아가기</button>
      <button id="btn_modify" type="submit" class="btn btn-primary">수정하기</button>
    </div>
    
  </form>
</body>
</html>
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
<meta name="author" content="천재헌" />
<meta name="description" content="회원탈퇴 페이지" />

<title>Bookflix 회원탈퇴</title>


<style type="text/css">
h3 {
  text-align: center;
}

body {
  background-color: #fff;
}

.wrap {
  max-width: 1200px;
  margin: 0 auto;
}

.form-group {
  display: flex;
  justify-content: space-between;
}

.form-group button {
  width: 49%;
}
</style>
</head>
<body>
  <h3>회원 탈퇴</h3>
  <br>
  <div class="wrap">
    <div class="usage">
      <p>${member.nickname}님의 이용내역</p>
      <p>남은 구독기간 : 00일</p>
    </div>
    <br>
    <div class="outnotice text-danger">
      <p>탈퇴시 유의사항</p>
      <p>정말 탈퇴하시겠습니까? 회원탈퇴를 하시면 지식 회원 약관 및 개인정보제공, 활용에 관한 약관 동의가 모두
        철회되며 모든 BOOKFLIX의 회원 서비스 및 웹사이트로부터 탈퇴 됩니다. 회원탈퇴를 하기 전에 아래에 있는 안내
        사항을 반드시 확인해 주세요.</p>
        
      <p>회원 탈퇴 시 유의사항</p>
      <p>탈퇴할 경우 가입할 때 입력하신 회원님의 개인정보는 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
        또한 BOOKFLIX에서 제공하고 있는 마이플랫폼에서도 로그인할 수 없습니다. 신중하게 고려하신 후
        선택하시기 바랍니다.</p>
        
      <p>회원 탈퇴 후 보존 안내사항</p>
      <p>BOOKFLIX 사이트의 다양한 페이지에 있는 게시글, 댓글, 설문, 후기 등은 탈퇴 시 자동으로
        삭제되지 않고 그대로 남아 있습니다. 삭제를 원하는 게시글이 있다면 반드시 탈퇴 전에 삭제하시기 바랍니다. 탈퇴
        후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.</p>
    </div>

    <form action="#">
      <div class="accept">
        <p>유의사항을 숙지 하였으며 탈퇴에 동의합니다.</p> <input type="checkbox">
      </div>
      <br>
      <div class="form-group">
        <button type="button" class="btn btn-primary">돌아가기</button>
        <button type="submit" class="btn btn-danger">다음</button>
      </div>
    </form>

  </div>
</body>
</html>
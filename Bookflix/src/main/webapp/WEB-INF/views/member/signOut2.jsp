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
<meta name="description" content="회원탈퇴 페이지2" />

<title>Bookflix 회원탈퇴2</title>


<style type="text/css">
h3 {
  text-align: center;
  font-weight: bold;
}

.wrap {
  max-width: 500px;
  margin: 0 auto;
}

.form-check {
  padding: 10px 0;
  font-weight: bold;
}

.text {
  width: 100%;
  margin: 10px 0;
}

.form-group {
  display: flex;
  justify-content: space-between;
}

.form-group button {
  width: 49%;
}
</style>

<script type="text/javascript">
$(document).ready(function () {
  
  // 돌아가기 버튼 클릭시 다시 마이페이지로 
  $('#btn_back').click(function () {
      location.href = "/myPage/Page";
  }); // #btn_back.click
  
});
</script>
</head>
<body>
  <br>
  <h3>회원 탈퇴</h3>
  <br>
  <div class="wrap">
    <form action="/member/signOut2" method="post">
    
      <div class="form-check">
        <label for="list1" class="form-check-label"> 자주 사용하지 않아서 </label>
        <input type="radio" class="form-control-input" name="Outlist" value="option1" id="list1" checked="checked">
      </div>
      
      <div class="form-check">
        <label for="list2" class="form-check-label"> 도서 컨텐츠가 부족해서 </label>
        <input type="radio" class="form-control-input" name="Outlist" value="option2" id="list2">
      </div>
      
      <div class="form-check">
        <label for="list3" class="form-check-label"> 잦은 시스템 오류 때문에 </label>
        <input type="radio" class="form-control-input" name="Outlist" value="option3" id="list3">
      </div>
      
      <div class="form-check">
        <label for="list4"  class="form-check-label"> 전반적으로 이용이 어려워서 </label>
        <input type="radio" class="form-control-input" name="Outlist" value="option4" id="list4">
      </div>
      
      <div class="form-check">
        <label for="list5" class="form-check-label"> 구독 요금이 비싸서 </label>
        <input type="radio" class="form-control-input" name="Outlist" value="option5" id="list5">
      </div>
      
      <div class="form-check">
        <label for="list6"  class="form-check-label"> 개인정보 및 보안 우려 때문에 </label>
        <input type="radio" class="form-control-input" name="Outlist" value="option6" id="list6">
      </div>
      
      <div class="form-check">
        <label for="list7" class="form-check-label"> 다른 아이디로 가입하고자 </label>
        <input type="radio" class="form-control-input" name="Outlist" value="option7" id="list7">
      </div>
      
      <div class="form-check">
        <label for="list8" class="form-check-label "> 기타(직접작성) </label>
        <input type="radio" class="form-control-input" name="Outlist" value="option8" id="list8">
        <input class="text form-control" type="text" placeholder="기타탈퇴사유">
      </div>
      
      <div class="form-group">
        <button type="button" id="btn_back" class="btn btn-primary">나중에하기</button>
        <button type="submit" id="btn_signOut" class="btn btn-danger">탈퇴하기</button>
      </div>

    </form>
  </div>
</body>
</html>
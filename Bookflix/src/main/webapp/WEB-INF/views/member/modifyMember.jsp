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

<style type="text/css">
body {
  background-color: #ccc;
}

.wrap {
  width: 500px;
  margin: auto;
}

.title {
  padding: 30px;
}

.fontcolor {
  color: dodgerblue;
}

.accept {
  text-align: center;
}

.submit {
  margin-top: 20px;
  display: flex;
  justify-content: center;
}

label {
  text-align: right;
}
</style>
<script type="text/javascript">

  //비밀번호 정규식 : 숫자, 문자 4~12자
  var pwJ = /^[A-Za-z0-9]{4,12}$/;
	//닉네임 정규식 : 한글, 영문, 숫자로 2~12자
	var nickJ = /^[가-힣a-zA-Z0-9]{2,12}$/;
	// 생년월일 : 19 or 20으로 시작, 1~12월, 01~31 숫자 8자
  var birthJ = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	// 휴대폰 번호 정규식
	var phoneJ = /^01(?:[0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
  
	$(document).ready(function () {
	  // 처음에는 숨겨놨다가 비밀번호 확인되면 보여줌.
    $('.hide-form').hide();
	  $('#btn_modify').hide();
	  
	  // 비밀번호 확인 AJAX
	  // 이메일 중복 확인 (1 = 중복 / 0 != 중복)
	  $("#member_pwPre").blur(function () {
             
        var member_pw=$('#member_pwPre').val();
      	
        $.ajax({
          url : "${pageContext.request.contextPath}/member/pwCheck?member_pw="+member_pw,
          type : 'get',
          success: function(data) {
            console.log("1은 o 그 외는 꽝" + data);
            // 1이 나와야 비밀번호 확인 완료
            if (data != 1) {
              $('#pw_checkPre').text('비밀번호가 틀렸습니다.');
              $('#pw_checkPre').css('color','red');
              $('#usercheck').attr("disabled",true);

            } else {
              $('#pw_checkPre').text('비밀번호가 맞습니다.');
           		// 맞으면 바로 readonly
              $('#member_pwPre').attr("readonly",true);
              $('#pw_checkPre').css('color','red');
              $('#usercheck').attr("disabled",true);
              // 폼 보이기
              $('.hide-form').show();
              $('#btn_modify').show();
            }
            
          }, error : function () {
            console.log("실패");
            
          } // error
        }); // ajax - pw

    }); // blur - pw
	  
 // 닉네임 중복 확인 (1 이상 중복o / 0 = 중복x)
    $("#member_nickname").blur(function () {
             
      	// 닉네임 ajax 중복 체크
        var member_nickname=$('#member_nickname').val();
      	
        $.ajax({
          url : '${pageContext.request.contextPath}/member/nickCheck?member_nickname='+member_nickname,
          type : 'get',
          success: function(data) {
            console.log("1보다 크면 중복, 0은 중복x" + data);
            // 0 보다 크면 이미 있는 거니까
            if (data > 0) {
              $('#nickname_check').text('이미 사용중인 닉네임 입니다.');
              $('#nickname_check').css('color','red');
              $('#usercheck').attr("disabled",true);
            } else {
           // 정규식 검사 true
              if (nickJ.test(member_nickname)) {
                $('#nickname_check').text('');
                $('#usercheck').attr("disabled",false);
                // 정규식검사 false에 비었을 경우
              } else if (member_nickname=='') {
                $('#nickname_check').text('닉네임을 입력해주세요.');
                $('#nickname_check').css('color','red');
                $('#usercheck').attr("disabled",true);
              } else {
                $('#nickname_check').text('이메일 형식에 맞지 않습니다.');
                $('#nickname_check').css('color','red');
                $('#usercheck').attr("disabled",true);
              }
            }
            
          }, error : function () {
            console.log("실패");
            
          } // error
        }); // ajax - nickname

    }); // blur
    
    // 정규식
    // pw 정규식 체크
	  $('#member_pw').blur(function(){
	    if (pwJ.test($('#member_pw').val())) {
        console.log('true');
        $('#pw_check').text('');
      } else {
				console.log('false');
				$('#pw_check').text('4~12 숫자, 문자만 사용 가능')
				$('#pw_check').css('color','red');
      }
	  });
	  
	  // pw 컨펌 체크
	  $('#member_pwc').blur(function(){
	    if ($('#member_pw').val() != $(this).val()) {
        $('#pwc_check').text('비밀번호가 일치하지 않습니다.');
        $('#pwc_check').css('color','red');
      } else {
				$('#pwc_check').text('');
      }
	  });
	// 닉네임 체크
	  $('#member_nickname').blur(function(){
	    if (nickJ.test($(this).val())) {
        console.log(nameJ.test($(this).val()));
        $('#nickname_check').text('');
      } else {
				$('#nickname_check').text('한글, 영문, 숫자로 2~12자')
				$('#nickname_check').css('color','red');
      }
	  });

	  // 생년월일 체크
	  $('#member_birth').blur(function(){
	    if (birthJ.test($(this).val())) {
        console.log(birthJ.test($(this).val()));
        $('#birth_check').text('');
      } else {
				$('#birth_check').text('- 빼고 숫자 6자 입력')
				$('#birth_check').css('color','red');
      }
	  });

	  // 휴대폰 번호 체크
	  $('#member_phone').blur(function(){
	    if (phoneJ.test($(this).val())) {
        console.log(phoneJ.test($(this).val()));
        $('#phone_check').text('');
      } else {
				$('#phone_check').text('- 빼고 입력')
				$('#phone_check').css('color','red');
      }
	  });
	  
    
	  // 돌아가기 버튼 클릭시 다시 마이페이지로 
	  $('#btn_back').click(function () {
	      location.href = "/myPage/Page";
	  }); // #btn_back.click
   
  }); // document ready
</script>
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
      <button id="btn_back" type="button" class="btn btn-secondary">돌아가기</button>
      <button id="btn_modify" type="submit" class="btn btn-primary">수정하기</button>
    </div>
    
  </form>
</body>
</html>
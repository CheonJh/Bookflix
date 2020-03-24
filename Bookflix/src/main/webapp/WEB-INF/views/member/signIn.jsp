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

	// 모든 공백 체크 정규식
	var empJ = /\s/g;
	// 이메일 검사 정규식
	var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 비밀번호 정규식 : 숫자, 문자 4~12자
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식 : 한글만 2~10자
	var nameJ = /^[가-힣]{2,10}$/;
	// 닉네임 정규식 : 한글, 영문, 숫자로 2~12자
	var nickJ = /^[가-힣a-zA-Z0-9]{2,12}$/;
	// 생년월일 : 숫자 6자만 
  var birthJ = /^[0-9]{6}$/;
	// 휴대폰 번호 정규식
	var phoneJ = /^01(?:[0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
	
	
	$(document).ready(function () {
    
	  // 이메일 중복 확인 (1 = 중복 / 0 != 중복)
	  $("#member_email").blur(function () {
             
      	// 이메일 ajax 중복 체크
        var member_email=$('#member_email').val();
      	
        $.ajax({
          url : '${pageContext.request.contextPath}/member/idCheck?member_email='+member_email,
          type : 'get',
          //data : member_email,
          //dataType: 'json',
          //contentType: "application/json; charset=UTF-8",
          success: function(data) {
            console.log("1보다 크면 중복, 0은 중복x" + data);
            // 0 보다 크면 이미 있는 거니까
            if (data > 0) {
              $('#email_check').text('이미 사용중인 이메일 입니다.');
              $('#email_check').css('color','red');
              $('#usercheck').attr("disabled",true);
            } else {
           // 정규식 검사 true
              if (emailJ.test(member_email)) {
                $('#email_check').text('');
                $('#usercheck').attr("disabled",false);
                // 정규식검사 false에 비었을 경우
              } else if (member_email=='') {
                $('#email_check').text('이메일을 입력해주세요.');
                $('#email_check').css('color','red');
                $('#usercheck').attr("disabled",true);
              } else {
                $('#email_check').text('이메일 형식에 맞지 않습니다.');
                $('#email_check').css('color','red');
                $('#usercheck').attr("disabled",true);
              }
            }
            
          }, error : function () {
            console.log("실패");
            
          } // error
        }); // ajax - email

    }); // blur
    
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
    
    
    
    // 폼 입력이 정확한지 검사, + 정규식 유효성 검사까지
	  $('form').on('submit',function(){
	    var inval_Arr = new Array(7).fill(false);
	    
	    if (emailJ.test($('#member_email').val())) {
        inval_Arr[0] = true;
      } else {
        inval_Arr[0] = false;
        alert('이메일을 확인');
        return false;
      }
	    // 비밀번호가 같은 경우 + 비밀번호 정규식
	    if (($('#member_pw').val() == ($('#member_pwc').val()))
	        && pwJ.test($('#member_pw').val())) {
        inval_Arr[1] = true;
      } else {
        inval_Arr[1] = false;
        alert('비밀번호를 확인하세요.');
        return false;
      }
	    // 이름 정규식
	    if (nameJ.test($('#member_name').val())) {
        inval_Arr[2] = true;
      } else {
				inval_Arr[2] = false;
				alert('이름을 확인하세요.');
				return false;
      }
	    // 닉네임 정규식
	    if (nickJ.test($('#member_nickname').val())) {
        inval_Arr[3] = true;
      } else {
				inval_Arr[3] = false;
				alert('닉네임을 확인하세요.');
				return false;
      }
	    // 생년월일 정규식
	    if (birthJ.test($('#member_birth').val())) {
	      inval_Arr[4] = true;
	    } else {
        inval_Arr[4] = false;
        alert('생년월일을 확인');
        return false;
      }
	    // 휴대폰 정규식
	    if (phoneJ.test($('#member_phone').val())) {
        inval_Arr[5] = true;
      } else {
				inval_Arr[5] = false;
				alert('휴대폰 번호 확인');
				return false;
      }
	    
	 		// 이용약관 체크
		  if ($('input:checkbox[id="agreeCheckBox"]').is(":checked")==true){
		    inval_Arr[6] = true;
		  } else {
        inval_Arr[6] = false;
        alert('이용약관 확인');
        return false;
      }
	    
	    // 전체 유효성 검사
	    var validAll = true;
	    
	    for (var i = 0; i < inval_Arr.length; i++) {
        if (inval_Arr[i] == false) {
          validAll = false;
        }
      }
	    if (validAll == true) { // 유효성 모두 통과
        alert('회원 가입을 환영');
      } else {
        alert('정보를 다시 확인');
      }
	    
	  }); // form on submit
	  
	  // email
	  $('#member_email').blur(function() {
	    if (emailJ.test($('#member_email').val())) {
        console.log('true');
        $('#email_check').text('');
      } else {
				console.log('false');
				$('#email_check').text('이메일 형식이 다릅니다.');
				$('#email_check').css('color','red');
      }
	  });
	  
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
	  
	  // 이름 체크
	  $('#member_name').blur(function(){
	    if (nameJ.test($(this).val())) {
        console.log(nameJ.test($(this).val()));
        $('#name_check').text('');
      } else {
				$('#name_check').text('2~10 한글만 사용 가능')
				$('#name_check').css('color','red');
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
				$('#phone_check').text('- 빼고 숫자 6자 입력')
				$('#phone_check').css('color','red');
      }
	  });
	  
	  
	  
	  
  }); // document ready
  

</script>
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
        <input type="text" class="form-control col-sm-8" placeholder="ex)891004" id="member_birth" name="member_birth">
        <div id="birth_check" class="check_font"></div>
      </div>
      
      <div class="form-group row">
        <label for="member_phone" class="col-sm-4 col-form-label">휴대폰 번호('-'없이 번호만 입력해주세요.)</label>
        <input type="text" class="form-control col-sm-8" placeholder="PhoneNumber" id="member_phone" name="member_phone">
        <div id="phone_check" class="check_font"></div>
      </div>

    </div>
    
    <div class="accept">
      <span>약관동의</span>
      <input type="checkbox" id="agreeCheckBox">
      <span><span class="fontcolor">이용약관</span>에 동의합니다.</span>
    </div>
    
    <div class="submit">
      <button type="submit" class="btn btn-secondary">회원가입</button>
    </div>
    
  </form>
</body>
</html>
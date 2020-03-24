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

<title>header</title>

<style type="text/css">

a { text-decoration: none; color: #222328;}

.clear:after {
  content: ''; clear: both; display: block;
}
.line {
  border-bottom: 1px solid #999;
}

/************************ 
      영역컬러링(삭제)
 ************************/
/* .topbar { background-color: #ccc;} */
/* .sns { background-color: blue;} */
/* .login { background-color: yellow;} */
/* .header { background-color: #ddd;} */
/* #nav { background-color: #eee;} */

/************************
      영역자리잡기
 ************************/
.wrap { width: 100%; height: 100%; }
.ho {
  float: left;
}
/* 탑바 */
.topbar { width: 1200px; height: 50px; margin: 0 auto;
position: relative;}
.sns {
  width: 340px; height: 50px;
}
.sns > div {
  width: 200px; height: 50px;
  margin: 0 auto;
}

/* SNS 버튼 */
.sns .container .col a {
  display: block;
  text-align: center;
  font-size: 2.5em;
}
.login {
  position: absolute;
  margin-top: -50px;
  height: 50px;
  right: 0;
  width: 860px;
}

.container div a {
  text-align: center;
  line-height: 50px;
  font-size: 1.2em;
  color: #222328;
}

/* 헤더 */
.header { width: 1200px; height: 100px; margin: 0 auto; position: relative;}
.logo img { height: 80px; margin: 10px;}

#nav {
  height: 60px; width: 60%;
  margin-top: 20px;
  position: absolute;
  right: 0;
}
#gnb li a {
  float: left;
  width: 25%;
  line-height: 60px;
  text-align: center;
  font-size: 1.5em;
}
</style>


</head>
<body>
  <div class="wrap">
    <header>
      <div class="line">
        <div class="topbar clear">
          <div class="sns">
            <div>
              <div class="container">
                <div class="row">
                  <div class="col">
                    <a href=""><i class="fa fa-facebook-official"></i></a>
                  </div>
                  <div class="col">
                    <a href=""><i class="fa fa-instagram"></i></a>
                  </div>
                  <div class="col">
                    <a href=""><i class="fa fa-twitter-square"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="login">
            <div class="container">
              <div class="row">
                <div class="col"></div>
                <div class="col"></div>
                <div class="col">
                  <div class="container logbtn">
                    <div class="row">
                      <div class="col">
                        <a href="#">로그인</a>
                      </div>
                      <div class="col">
                        <a href="#">회원가입</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="line">
        <div class="header clear">
          <div class="logo ho">
            <a href="#"><img src="/resources/imgs/common/logo.png" alt="logo"></a>
          </div>
          <div id="nav" class="ho">
            <ul id="gnb" class="clear">
              <li><a href="#">검 색</a></li>
              <li><a href="#">신 간</a></li>
              <li><a href="#">인 기</a></li>
              <li><a href="#">고객센터</a></li>
            </ul>
          </div>
        </div>
      </div>
    </header>
  </div>

</body>
</html>

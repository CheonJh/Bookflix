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
<meta name="description" content="기본 폼 예시 페이지" />

<title>임시 메인</title>

<!-- 메인 배너 슬라이드 CSS -->
<style>
/* * { margin: 0; padding: 0;}
a { text-decoration: none;}
li { list-style: none;} */
.clear:after {
  display: block;
  content: '';
  clear: both;
}

/* 슬라이드 버튼 */
.banner-wrap input, label {
  position: relative;
  margin: 0 auto;
  z-index: 1000;
  float: left;
}

.banner-wrap label {
  display: block;
  float: left;
  top: 470px;
  height: 10px;
  width: 10px;
  margin: 5px;
  border: 1px solid #666;
  border-radius: 10px;
  cursor: pointer;
}

.banner-wrap .btn1 {
  margin-left: 270px;
}
/* 라디오버튼 숨기기 */
.banner-wrap input {
  display: none;
}

.banner-wrap .banner-input1:checked ~ .btn1, .banner-wrap .banner-input2:checked 
  ~ .btn2, .banner-wrap .banner-input3:checked ~ .btn3 {
  background-color: #666;
}

/* 배너슬라이드 */
.banner-wrap {
  position: relative;
  width: 600px;
  height: 500px;
  margin: 0 auto;
  top: 20px;
  margin-bottom: 20px;
  border: 1px solid #fff;
  box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
  overflow: hidden;
}

/* 배너이미지 */
.banner-wrap ul.banner li {
  position: absolute;
  top: 0;
  left: 100%;
}

.banner-wrap ul.banner {
  position: absolute;
  width: 100%;
  height: 100%;
}

.banner-wrap ul.banner li a img {
  width: 600px;
  height: 500px;
}

/* 배너 이미지 보이기 */
.banner-wrap .banner-input1:checked ~ .banner li:nth-child(1),
  .banner-wrap .banner-input2:checked ~ .banner li:nth-child(2),
  .banner-wrap .banner-input3:checked ~ .banner li:nth-child(3) {
  left: 0;
  transition: all 0.6s ease-in-out;
  animation: none;
}

/* 애니메이션 */
@keyframes slideLeft {
  0% { left: 0;}
  100% {left: -100%;}
}

/* 현재 이미지를 왼쪽으로 슬라이딩 */
.banner-wrap input:checked ~ .banner li {
  animation: slideLeft 0.6s ease-in-out;
}
</style>
<!-- 메인배너 슬라이드 JS -->
<script>
  $(function() {
    var $btn = $('.banner-wrap input');
    var btnCount = $btn.length; //input 태그 개수
    var speed = 3500; //슬라이드 시간
    var i = 0; //INDEX

    function check() {
      if (i < btnCount) {
        i++;
        $btn.eq(i).click();
      } else {
        i = 0;
        $btn.eq(i).click();
      }
    }

    // speed ms 마다 check 실행
    var slide = setInterval(check, speed);
  });
</script>


<!-- 인기 신간 탭-->
<style>
.space { height: 20px; width: 100%;}
.favor-new-container {
  margin-top: 20px;
  width: 600px; height: 100%;
}
#myTab {
  width: 600px;
}
.container {
  width: 600px; height:100%;
  margin: 0;
  padding: 0;
  margin: 0 auto;
}
.container .tab-content {
  border: 1px solid #ddd;
  border-top: none;
  padding: 20px;
  width: 600px;
  height: 790px;
}

.container .tab-content > div {
  width: 100%; height: 100%;
}

.tab-content .favor-wrap .imgbox img {
  display: block;
  width: 170px;
  height: 240px;
}

.tab-content .favor-wrap div {
  float: left;
}

.book-info {
  width: 380px;
  padding: 20px;
}

.book-info .book-title {
  font-size: 1.4em;
  font-weight: bold;
}

.book-info .author, .publisher {
  font-size: 1.1em;
}
</style>

</head>
<body>
  <!-- 메인 슬라이드 -->
  <div class="banner-wrap">

    <input type="radio" name="banner" id="sel1" class="banner-input1"
      checked> <label for="sel1" class="btn1"></label> <input
      type="radio" name="banner" id="sel2" class="banner-input2">
    <label for="sel2" class="btn2"></label> <input type="radio"
      name="banner" id="sel3" class="banner-input3"> <label
      for="sel3" class="btn3"></label>


    <ul class="banner">
      <li><a href="#"><img src="resources/imgs/mainslide/1.jpg"
          alt=""></a></li>
      <li><a href="#"><img
          src="resources/imgs/mainslide/2.jpg" alt=""></a></li>
      <li><a href="#"><img
          src="resources/imgs/mainslide/3.jpg" alt=""></a></li>
    </ul>

  </div>
  
  <!-- 인기, 신규도서 탭 -->
   <div class="space"></div>
  <div class="container">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
  <!-- 탭 버튼 -->
      <li class="nav-item show active">
        <a class="nav-link " id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
          aria-selected="false">인기도서</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
          aria-selected="false">신규도서</a>
      </li>
    </ul>
    <div class="tab-content" id="myTabContent">
      <div class="tab-pane fade in show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
  <!-- 인기도서 탭 내부 내용 -->
    <c:forEach items="${favorite}" var="favorite">
      <div class="favor-wrap">
          <div class="imgbox">
            <a href="#"><img src="resources/imgs/book-imgs/${favorite.e_book_img_path }" alt="" /></a>
          </div>
          <div class="book-info">
            <p class="book-title">${favorite.e_book_title}</p>
            <p class="author">저자 : ${favorite.e_book_writer}</p>
            <p class="publisher">출판사 : ${favorite.e_book_publisher}</p>
            <p class="detail">Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur accusantium perspiciatis voluptas ab nihil ullam, quisquam omnis optio excepturi sint at distinctio sequi iure cumque, placeat earum vitae beatae dolorum.</p>
          </div>
        </div>
       
    </c:forEach>
      
     
      </div>
      <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
  <!-- 신규도서 탭 내부 내용 -->
    <c:forEach items="${newbook}" var="newbook">
      <div class="favor-wrap">
          <div class="imgbox">
            <a href="#"><img src="resources/imgs/book-imgs/${newbook.e_book_img_path }" alt="" /></a>
          </div>
          <div class="book-info">
            <p class="book-title">${newbook.e_book_title}</p>
            <p class="author">저자 : ${newbook.e_book_writer}</p>
            <p class="publisher">출판사 : ${newbook.e_book_publisher}</p>
            <p class="detail">Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur accusantium perspiciatis voluptas ab nihil ullam, quisquam omnis optio excepturi sint at distinctio sequi iure cumque, placeat earum vitae beatae dolorum.</p>
          </div>
        </div>
       
    </c:forEach>
  
      </div>
    </div>
  </div>
  <div class="space"></div>


</body>
</html>
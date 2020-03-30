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
<style>
.testPage {
  height: 400px;
  width: 1200px;
  margin: 0 auto;
}

.testPage li {
  font-size: 2rem;
}
</style>

<!-- 메인 슬라이드 CSS -->
<style>
  
.clear:after {
  content: '';
  clear: both;
  display: block;
}

@import url(font.css);

.container {
  max-width: 800px;
  margin: 0;
  padding: 0;
  margin: 0 auto;
  height: 100%;
}


 .container .nav li {
  width: 50%;
  height: 50px;
  border-left: 1px solid #777;
  border-top: 1px solid #777;
  border-bottom: 1px solid #777;
}

 .container .nav li:last-child {
  border-right: 1px solid #777;
}

 .container .nav li a {
  display: block;
  text-decoration: none;
  text-align: center;
  font-size: 1.1em;
  font-weight: bold;
  line-height: 50px;
  color: #222328;
}



/* 슬라이드 CSS */

.slide {
  width: 100%;
  height: 500px;
  border: 1px solid #777;
  border-top: none;
  position: relative;
  overflow: hidden;
}

.slide ul {
  position: absolute;
  top: 0;
  left: 0;
}

.slide ul li {
  float: left;
  margin: 0;
  padding: 0;
  list-style: none;
}

.slide ul li img {
  float: left;
  display: block;
  width: 400px;
  height: 500px;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
}
</style>

<!-- 메인 슬라이드 JS -->
<script>
$(document).ready(function () {

  var $slide = $(".slide").find("ul");

  var $slideWidth = $slide.children().outerWidth();
  var $slideHeight = $slide.children().outerHeight();
  var $slideLength = $slide.children().length;

    function rollingStart() {
      $slide.css("width", $slideWidth * $slideLength + "px");
      $slide.css("height", $slideHeight +"px");
      $slide.animate({left: - $slideWidth + "px"}, 1500, function(){

          $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
          $(this).find("li:first").remove();
          $(this).css("left",0);
      });
    }

    setInterval( rollingStart, 3000);

});
</script>


</head>
<body>

  <!-- 인기도서, 신간도서 탭 -->
  <div class="container">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#thumbup" data-toggle="tab">인기</a></li>
      <li><a href="#newbook" data-toggle="tab">신규</a></li>
    </ul>

    <div class="tab-content">
      <div class="tab-pane active" id="thumbup">
        <div class="slide">
          <ul>
            <c:forEach items="${favorite}" var="favorite">
              <li><a href="#"><img src="/resources/imgs/book-imgs/${favorite.e_book_img_path}.jpg" alt="$favorite.e_book_title"></a></li>
            </c:forEach>
          </ul>
        </div>
      </div>
      <div class="tab-pane" id="newbook">
        <div class="slide">
          <ul>
            <c:forEach items="${newbook}" var="newbook">
              <li><a href="#"><img src="/resources/imgs/book-imgs/${newbook.e_book_img_path}.jpg" alt="$newbook.e_book_title"></a></li>
            </c:forEach>
          </ul>
        </div>
      </div>
    </div>
  </div>

 

</body>
</html>
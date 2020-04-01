<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
  <style type="text/css">
  
 .main-slide {
   width: 600px;
   height: 800px;
   margin: 0 auto;
   position: relative;
   /* border: 1px solid; */
  }
  .slide-wrap {
    width: 675px; height: 900px;
    margin: 0 auto;
    position: relative;
    overflow: hidden;
  }

  .frame {
    width: 100%; height: 100%;
    position: relative;
 }
 /* .bg-1 {
   background-image: url(imgs/mainImage/main-1.png);
 }
 .bg-2 {
   background-image: url(imgs/mainImage/main-2.jpg);
 }
 .bg-3 {
   background-image: url(imgs/mainImage/main-3.jpg);
 } */
 .slide-item {
   position: absolute; 
   width: 600px; 
   /* height: 800px;  */
   top: 0; 
   left: 0;
   background-repeat: no-repeat;
   background-size: cover;
   background-position: center;
 }
  
  </style>
  <script type="text/javascript">
  $(function() {

    var item = $('.slide-wrap .slide-item');
    var c = item.length;
    // console.log(c + "길이");
    item.css({
      top : 0,
      display : 'none;'
    });
    item.eq(0).css({
      display : 'block'
    });

    var i = 0;

    function fade() {
      var n = (i + 1) % c;
      // console.log(n);
      item.eq(i).fadeOut(1000);
      item.eq(n).fadeIn(1000);
      i = n;
    }

    setInterval(fade, 1000);

  });
</script>
</head>
<body>

  <div class="box3">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
      <li class="nav-item"><a class="nav-link active" id="read-tab"
        data-toggle="tab" href="#read" role="tab" aria-controls="read"
        aria-selected="true">읽은 도서 목록</a></li>
      <li class="nav-item"><a class="nav-link" id="reservation-tab"
        data-toggle="tab" href="#reservation" role="tab"
        aria-controls="reservation" aria-selected="false">찜한 도서 목록</a></li>
      <li class="nav-item"><a class="nav-link" id="like-tab"
        data-toggle="tab" href="#like" role="tab" aria-controls="like"
        aria-selected="false">좋아요 한 도서 목록</a></li>
    </ul>


    <div class="tab-content" id="myTabContent">
      <div class="tab-pane fade show active" id="read" role="tabpanel"
        aria-labelledby="read">
        <!-- 읽은 도서 목록 -->
        <div class="content main-slide">
          <div class="slide-wrap">
            <div class="frame clear">
              <div class="slide-item bg-1">
                <img src="http://placehold.it/600x800" alt="">
              </div>
              <div class="slide-item bg-2">
                <img src="http://placehold.it/700x800" alt="">
              </div>
              <div class="slide-item bg-3">
                <img src="http://placehold.it/800x800" alt="">
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="tab-pane fade" id="reservation" role="tabpanel"
        aria-labelledby="reservation">
        <!-- 찜한 도서 목록 -->
        <div class="content main-slide">
          <div class="slide-wrap">
            <div class="frame clear">
              <div class="slide-item bg-1">
                <img src="imgs/mainImage/main-1.png" alt="">
              </div>
              <div class="slide-item bg-2">
                <img src="imgs/mainImage/main-2.jpg" alt="">
              </div>
              <div class="slide-item bg-3">
                <img src="imgs/mainImage/main-3.jpg" alt="">
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="tab-pane fade" id="like" role="tabpanel"
        aria-labelledby="like">
        <!-- 좋아요 한 도서 목록 -->
        <div class="content main-slide">
          <div class="slide-wrap">
            <div class="frame clear">
              <div class="slide-item bg-1">
                <img src="imgs/mainImage/main-1.png" alt="">
              </div>
              <div class="slide-item bg-2">
                <img src="imgs/mainImage/main-2.jpg" alt="">
              </div>
              <div class="slide-item bg-3">
                <img src="imgs/mainImage/main-3.jpg" alt="">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>

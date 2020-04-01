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
<meta name="author" content="성인규" />
<meta name="description" content="책 상세 페이지" />

<title>책 상세 페이지</title>

<!-- *************************************************** -->
<!-- 현재 페이지 CSS -->
<link rel="stylesheet"
  href="<%=request.getContextPath()%>/resources/css/book/book.css">


<script>
  // 좋아요버튼
	$( function () {
    var e_book_num = ${view.e_book_num};
    var thumbupcnt = ${view.e_book_thumbupcnt};
		var i;
		
    // 좋아요 +1 호출
     $('#thumbUp').click( function (){
       thumbUp(1);
       clicked(event);
       .attr("id", "#thumbDown");
     });
     $('#thumbDown').click( function (){
       thumbUp(-1);
       clicked(event);
       .attr( "id", "#thumbDown" );
     })
  
    function clicked(event){
      console.log("clicked");
      event.stopPropagation();
    }
    
 		// 좋아요 +1
    function thumbUp(i) {
      $.ajax({
        url : "/book/thumbUp?e_book_num=" + e_book_num,
        type : "POST",
        success : function() {
          thumbupcnt = thumbupcnt + i;
          $("#result").text(thumbupcnt);
          console.log("clicked");
        },
        error : function() {
          console.log("실패");
        },
      });
    }
    
    /* function login(){
      if(conform("로그인 페이지로 이동하시겠습니까?") == true){
        
      }
      else {
        
      } 
    }*/
	});
    
</script>
</head>
<body>
  <div class="wrap">
    <div class="container">
      <div class="row">
        <div class="col-sm-4 offset-sm-1 thumbnail">
          <a href="#"> <img src="http://via.placeholder.com/200X350"
            alt="#">
          </a>
        </div>
        <div class="col-sm-6 offset-sm-1 wrapinfo">
          <h4>${view.e_book_title}</h4>
          <br>
          <div>
            <div class="writer">저자 ${view.e_book_writer}</div>
            <div class="writer">역자 ${view.e_book_translater}</div>
            <div class="writer">출판사 ${view.e_book_publisher}</div>
            <br>
          </div>


          <div class="form-group">
            <button type="button" class="btn btn-primary">e-북
              읽기</button>

            <c:choose>
              <c:when test="${member eq null}">
                  <button type="button" class="btn btn-primary" 
                  onclick="location.href='/member/login' ">
                    좋아요 
                    <span id="result">
                        ${view.e_book_thumbupcnt} 
                    </span>
                  </button>
              </c:when>
              
              <c:otherwise>
                 <c:choose>
                  <c:when test="${thumbCheck == true}">
                    <button id="thumbUp" class="btn btn-primary" onclick="thumbUp(1);">
                      좋아요 <span id="result"> ${view.e_book_thumbupcnt}
                      </span>
                    </button>
                  </c:when>
                  
                  <c:otherwise>
                    <button id="thumbDown" class="btn btn-danger" onclick="thumbUp(-1);">
                      좋아요 <span id="result"> ${view.e_book_thumbupcnt}
                      </span>
                    </button>
                  </c:otherwise>
                  </c:choose> 
              </c:otherwise>
            </c:choose>
              
              

            <c:choose>
              <c:when test="${member ne null}">
                <button type="button" class="btn btn-primary">찜하기</button>
              </c:when>
              
              <c:when test="${member ne null}">
                <button type="button" class="btn btn-primary">찜하기</button>
              </c:when>
            </c:choose>
            
          </div>

        </div>
      </div>
    </div>
    <div class="wrapintro">
      <div class="summary">
        <h5>책 소개</h5>
        <hr>
        <p>${view.e_book_info}</p>
      </div>
      <br> <br>
      <div class="conlist">
        <h5>목차</h5>
        <hr>
        <p>${view.e_book_index}</p>
      </div>
    </div>
    <div class="recommend">
      <h5>관련도서</h5>
      <hr>
      <ul class="reclist">
        <li><a href="#"> <img
            src="http://via.placeholder.com/200X350" alt="#">

        </a>
          <div>책 제목</div>
      </ul>
    </div>
  </div>
  <a class="sidetop" href="#">TOP</a>

</body>
</html>
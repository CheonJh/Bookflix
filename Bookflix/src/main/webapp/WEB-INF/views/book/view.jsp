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
    
    var thumbCheck = '<c:out value="${thumbCheck}"/>';
		var i;		
		
		// 좋아요 버튼초기화
		if(thumbCheck == true){
		  $('.thumbUp').addClass("btn-danger selected");
		  $('.thumbUp').removeClass("btn-primary");
		  console.log("not click");
		}
		
		else {
      $('.thumbUp').addClass("btn-primary");
      $('.thumbUp').removeClass("btn-danger selected");
      console.log("not click");
		}
		
    // 좋아요 +1 호출
     $('.thumbUp').click( function (){
       if($(this).hasClass('selected')){
         thumbUp(-1);
         $(this).addClass("btn-primary");
         $(this).removeClass("btn-danger selected");
       }
       
       else{
         thumbUp(1);
         $(this).addClass("btn-danger selected");
         $(this).removeClass("btn-primary");
       }
     }); 
  
 		// 좋아요 +1
    function thumbUp(i) {
      $.ajax({
        url : "/book/thumbUp?e_book_num="+e_book_num,
        type : "POST",
        success : function() {
          thumbupcnt = thumbupcnt + i;
          $("#result").text(thumbupcnt);
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
          <a href="#">
          <img src="/book-imgs/${view.e_book_img_path }" alt="책 이미지">
          </a>
        </div>
        <div class="col-sm-6 offset-sm-1 wrapinfo">
          <h4>${view.e_book_title}</h4>
          <br>
          <div>
            <div class="writer">저자 ${view.e_book_writer}</div>
            <div class="writer">역자 ${view.e_book_translater}</div>
            <div class="writer">출판사 ${view.e_book_publisher}
            
            <%= request.getAttribute("boolean")
            %>
            
            </div>
            <br>
          </div>


          <div class="form-group">
            <button type="button" class="btn btn-primary">e-북
              읽기</button>

                  <button type="button" class="btn btn-primary thumbUp selected" >
                 <!--  onclick="location.href='/member/login' "> -->
                    좋아요 
                    <span id="result">
                        ${view.e_book_thumbupcnt} 
                    </span>
                  </button>
             
            <c:choose>
              <c:when test="${member2 ne null}">
                <button type="button" class="btn btn-primary">찜하기</button>
              </c:when>
              
              <c:when test="${member2 ne null}">
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
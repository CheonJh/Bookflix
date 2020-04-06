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
    var favoriteCheck = '<c:out value="${favoriteCheck}"/>';
		var i;
		
		// 좋아요 버튼 초기화
		if(thumbCheck == true){
		  $('.thumbUp').addClass("btn-primary selected");
		  $('.thumbUp').removeClass("btn-outline-primary");
		}
		
		else {
      $('.thumbUp').addClass("btn-outline-primary");
      $('.thumbUp').removeClass("btn-primary selected");
		}
		
		// 찜하기 버튼 초기화
		if(favoriteCheck == true){
		  $('.favorite').addClass("btn-danger selected");
		  $('.favorite').removeClass("btn-primary");
		}
		
		else {
      $('.favorite').addClass("btn-primary");
      $('.favorite').removeClass("btn-danger selected");
		}
		
    // 좋아요 +1 호출
     $('.thumbUp').click( function (){
       if($(this).hasClass('selected')){
         thumbUp(-1);
         $(this).addClass("btn-outline-primary");
         $(this).removeClass("btn-primary selected");
       }
       
       else{
         thumbUp(1);
         $(this).addClass("btn-outline-primary selected");
         $(this).removeClass("btn-primary");
       }
     }); 
    
    // 찜하기 클릭 이벤트
     $('.favorite').click(function(){
       var ye = confirm("찜하시겠습니까?");
       if(ye){
         favorite();
       }
       else{
         
       }
     });
  
 		// 좋아요 ajax
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
    
 		// 찜하기 ajax
    function favorite() {
      $.ajax({
        url : "/book/favorite?e_book_num="+e_book_num,
        type : "POST",        
        success : function(result) {          
          if(result == 1){
            alert("찜한 도서 목록에 등록되었습니다.")
          }else{
           	alert("이미 찜한 도서입니다.")
          }
        },
        error : function() {
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
<style>
  .btn{
    background-color: transparent;
    color: #007bff;
    border-color: #007bff;
  } 
  
  .btn:hover {
    font-weight: bold;  
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
  }
</style>
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
          <div>
            <h4>${view.e_book_title}</h4>
            <br>
            <div class="writer">저자 ${view.e_book_writer}</div>
            <div class="writer">역자 ${view.e_book_translater}</div>
            <div class="writer">출판사 ${view.e_book_publisher}</div>
            <br>
          </div>

          
          
          <div class="form-group">
            <button type="button" class="btn btn-primary">
            e-북 읽기</button>

            <button type="button" class="btn thumbUp btn-outline-primary selected" 
              <c:if test="${member eq null}">
                onclick="location.href='/member/login' "
              </c:if>
            >
                  좋아요 
                <span id="result">
                  ${view.e_book_thumbupcnt} 
                </span>
            </button>
             
            <button type="button" class="btn btn-outline-primary favorite"
            <c:if test="${member eq null}">
                onclick="location.href='/member/login' "
              </c:if>
            >
            찜하기</button>
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
</body>
</html>
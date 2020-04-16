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
	$( function () {
    var e_book_num = ${view.e_book_num};
    var thumbupcnt = ${view.e_book_thumbupcnt};
    var member = '<c:out value="${member}"/>';
    var memGrade = '<c:out value="${member.member_grade}"/>';
    
    var thumbCheck = '<c:out value="${thumbCheck}"/>';
    var favoriteCheck = '<c:out value="${favoriteCheck}"/>';
    var hadReadCheck = '<c:out value="${hadReadCheck}"/>';
		var i;
		
		// 책소개, 목차 크기 초기화
		var textEle = $('textarea');
		$('.bookInfo textarea').css('height', textEle[0].scrollHeight);
		$('.bookIndex textarea').css('height', textEle[1].scrollHeight);
		  
		$('.bookInfo div').css('max-height','100px');
		$('.bookIndex div').css('max-height','100px');
		  
		// 펼치기 버튼
	  $('.open').toggle(function(){
	  	$(this).prev('div').css('max-height','');
	  },
	  //접기
	  function(){
	  	$(this).prev('div').css('max-height','100px');
	  });
		
		// e-북 읽기버튼 초기화
	  if(hadReadCheck == true){
		  $('.hadread').addClass("btn-primary selected");
		  $('.hadread').removeClass("btn-outline-primary");
		}		
		else {
      $('.hadread').addClass("btn-outline-primary");
      $('.hadread').removeClass("btn-primary selected");
		}
		
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
		
		// e-북 읽기 버튼 이벤트
		$('.hadread').click( function (){
       if (member == null || member == ""){
         return false;
       }
       
       if(memGrade == 2){
         var ye = confirm("읽으시겠습니까?");
           
         if(ye){
           hadRead();
         }
         else{
           
         }
       }
       
       else if(memGrade == 1){
         alert("구독회원만 가능합니다");
       }
     }); 
		
    // 좋아요 버튼 이벤트
     $('.thumbUp').click( function (){
       if (member == null || member == ""){
         return false;
       }
       
       if($(this).hasClass('selected')){
         thumbUp(-1);
         $(this).addClass("btn-outline-primary");
         $(this).removeClass("btn-primary selected");
       }
       
       else{
         thumbUp(1);
         $(this).addClass("btn-primary selected");
         $(this).removeClass("btn-outline-primary");
       }
     }); 
    
    // 찜하기 버튼 이벤트
     $('.favorite').click(function(){
       if(member == null || member == ""){
         return false;
       }else{
         var ye = confirm("찜하시겠습니까?");
       }
                
       if(ye){
         favorite();
       }
       else{
         
       }
     });
    
    
  // e-북읽기 ajax
     function hadRead() {
       $.ajax({
         url : "/book/hadReadInsert?e_book_num="+e_book_num,
         type : "POST",        
         success : function() {
           console.log("HadRead!");
         },
         error : function() {
           console.log("실패");
         },
       });
     }
  
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
          console.log("실패");
        },
      });
    }
 
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
  
  .bookInfo div, .bookIndex div {
    display : block;
    width : 100%;
    overflow : hidden;
    white-space : nowrap;
    text-overflow: ellipsis;
  }
  textarea {
    resize : none;
    border : none;
    width : 100%;
  }
  
  .open{
    width : 100%;
  }
  
  img{
    width : 400px;
    height : 600px;
  }
  
  .related {
    text-align :center;
  }
  .related img {
    height : 350px;
    width : 100%;
  }
</style>
</head>
<body>

  <div class="wrap">
    <div class="container">
      <div class="row">
        <div class="col-sm-4 offset-sm-1 thumbnail">
          <img src="/book-imgs/${view.e_book_img_path }" alt="책 이미지">
        </div>
        <div class="col-sm-6 offset-sm-1 wrapinfo">
          <div>
            <h4>${view.e_book_title}</h4>
            <br>
            <div class="writer">저자 ${view.e_book_writer}</div>
            <c:if test="${view.e_book_translater ne ''}">
              <div class="writer">역자 ${view.e_book_translater}</div>
            </c:if>
            
            <div class="writer">출판사 ${view.e_book_publisher}</div>
            <div class="writer">출판일 ${view.e_book_date}</div>
            <br>
          </div>

          <div class="form-group">
          
          <!-- e-북 읽기 -->
            <button type="button" class="btn btn-outline-primary hadread"
              <c:if test="${member eq null}">
                onclick="location.href='/member/login' "
              </c:if>
            >
                  e-북 읽기 
            </button>

            <!-- 좋아요 -->
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
             
            <!-- 찜하기 -->
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
        <div class="bookInfo">
          <div>
            <textarea readonly="readonly">${view.e_book_info}
            </textarea>
          </div>
          <button class="open btn btn-light">펼치기</button>
        </div>
      </div>
      <br> 
      <br>
      <div class="conlist">
        <h5>목차</h5>
        <hr>
        <div class="bookIndex">
          <div>
            <textarea readonly="readonly">${view.e_book_index}
            </textarea>
          </div>
          <button class="open btn btn-light">펼치기</button>
        </div>
      </div>
    </div>
      
    <!-- 감성태그(카테고리) -->
    <br>
    <br>
    <h5>감성태그</h5>
    <hr>
    <div class="bookTag row">
    <c:forEach items="${tagArray}" var="tagArray" begin="1">
      <form id="searchForm" action="/search/search" method="post" role="search" class="center">
          <button type="submit" id="subBtn" class="btn btn-outline-secondary" value="${tagArray}" name="searchKeyword">
              #${tagArray}
          </button>
      </form>
    </c:forEach>
    </div>
    <!-- 관련도서 -->
    <br>
    <br>
    <h5>관련도서</h5>
    <hr>
    <div class="row related">
      <c:forEach items="${tagBooks}" var="tagBooks" varStatus="status" begin="1" end="7">
        <div class="col-sm-6 col-md-3 bookList-dv" >
          <a href="/book/view?e_book_num=${tagBooks.e_book_num}">
            <div class="bookContent">
              <img src="/resources/imgs/book-imgs/${tagBooks.e_book_img_path}"/>
              <h4>${tagBooks.e_book_title}</h4>
              <p>${tagBooks.e_book_writer}</p>
              
            </div>
          </a>
        </div>
      </c:forEach>
    </div>
  </div>
</body>
</html>
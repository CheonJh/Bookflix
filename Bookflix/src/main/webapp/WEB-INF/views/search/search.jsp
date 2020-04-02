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
<meta name="description" content="검색 페이지" />

<title>BOOKFLIX 검색</title>
<script type="text/javascript">
  $(function() {
    /* 키워드 존재 유무로 기본 도서 목록과 검색 도서 목록을 분류 */
    var keyword = $('#keyword').val();
    
    if (keyword == '') {
      $("#searchList-div").hide();
    } else {
      $("#bookList-div").hide();
      $("#basicBookList").empty();
    }
    
    
    
    //파라미터값에 있는 걸 잘라서 값으로 반환 해주는 함수 $.urlParam('keyword') 원하는 파람 쓰면 그 파람의 값넘어옴
    $.urlParam = function(name) {
      var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
      if (results == null) {
        return null;
      } else {
        return results[1] || 0;
      }
    } 
    
    // 전체 목록 더보기 버튼 - 클릭
    $("#bookList-more").on("click",function() {
      
      $.ajax({
        url : "${pageContext.request.contextPath}/search/search3",
        type : "post",
        dataType : "json",
        success : function(data) {
          // ajax 통신 확인
          console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ SUCCESS  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
          console.log(data);
          
          if (data != '') {
            
            var all = "";
            $.each(data, function(key, value) {
              all = all + "<div class='col-sm-6 col-md-3 bookList-dv'>"
              + "<a href='/book/view?e_book_num=" + value.e_book_num + "'>"
              + "<div class='bookContent'>"
              + "<img src='/resources/imgs/book-imgs/"+value.e_book_img_path + "'/>"
              + "<h4>" + value.e_book_title + "</h4>"
              + "<p>" + value.e_book_writer + "</p>" 
              + "</div></a>"
              +"</div>";
            }); //each  
          
            // 붙혀
            $("#basicBookList").append(all);
          
          } else {
            alert("없다");
            $("#bookList-more").hide();
          }
          
        
      }, error : function () {
        console.log("실패");
      }
    });// ajax - search
  });// moreinfo - click
    
  
    // 검색 목록 더보기 버튼 - 클릭
    
    $("#searchList-more").on("click",function() {
      
      keyword = $("#keyword").val();
      
      $.ajax({
        url : "${pageContext.request.contextPath}/search/search2?keyword="+keyword,
        type : "post",
        dataType : "json",
        success : function(data) {
          // ajax 통신 확인
          console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ SEARCH SUCCESS  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
          console.log(data);
          
          if (data != '') {
          
            var all = "";
            $.each(data, function(key, value) {
              all = all + "<div class='col-sm-6 col-md-3 bookList-dv'>"
              + "<a href='/book/view?e_book_num=" + value.e_book_num + "'>"
              + "<div class='bookContent'>"
              + "<img src='/resources/imgs/book-imgs/"+value.e_book_img_path + "'/>"
              + "<h4>" + value.e_book_title + "</h4>"
              + "<p>" + value.e_book_writer + "</p>" 
              + "</div></a>"
              +"</div>";
            }); //each  
             
            // 붙혀
            $("#searchBookList").append(all);
          } else {
            alert('없다');
          }
      }, error : function () {
        console.log("실패");
      }
    });// ajax - search
  });// moreinfo - click
  
  });
</script>

<style type="text/css">

#searchForm {
  margin-top: 3rem;
  margin-bottom: 3rem;
}

.bookContent{
  box-shadow: 5px 7px 20px -5px #8a8a8a;
  height: 350px;
  margin: 15px auto;
}

.bookContent img{
  border-radius: 50%;
  display : block;
  width: 250px;
  height: 250px;
  margin: 0 auto;
}

.bookList-dv:hover {
  border: solid 2px;
  border-top-color: orange;
  border-bottom-color: orange;
  border-left-color: #D02090;
  border-right-color: #D02090;
}

/* 더보기 버튼 */
.btn-search {
  margin-top: 3rem;
  margin-bottom: 3rem;
}

</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col">
      
        <!-- 검색 --> 
        <form id="searchForm" action="/search/search" method="post" role="search" class="center">
          <div class="input-group mb-3 input-group-lg">
            <input type="text" class="form-control" name="searchKeyword" placeholder="검색할 단어를 입력하세요." aria-describedby="subBtn" value="${keyword}">
            <div class="input-group-append">
              <button type="submit" id="subBtn" class="btn btn-outline-secondary">
                <i class="fa fa-search" aria-hidden="true"></i>
              </button>
            </div> 
          </div>
        </form>
        
      </div>   
    </div>
    
    
    <!-- 책 List View -->
    <!-- 책 이미지, 책번호, 책 제목, 책 저자 출력 -->
    <!-- e_book_img_path, e_book_num, e_book_title, e_book_writer -->
    <input type="hidden" name="keyword" value="${keyword}" id="keyword" />
    
    <!-- 기본 전체 목록 -->
    <div class="row bookList" id="basicBookList">
    
      <c:forEach items="${bookList}" var="bookList" varStatus="status">
        <div class="col-sm-6 col-md-3 bookList-dv" >
          <a href="/book/view?e_book_num=${bookList.e_book_num}">
            <div class="bookContent">
              <img src="/resources/imgs/book-imgs/${bookList.e_book_img_path}" />
              <h4>${bookList.e_book_title}</h4>
              <p>${bookList.e_book_writer}</p>
            </div>
          </a>
        </div>
      </c:forEach>
      
    </div>
    
    <!-- 검색 목록-->
    <c:if test="${searchList !=null}">
      <h4>'${keyword}' 검색</h4>
    </c:if>
    
    <div class="row bookList" id="searchBookList">
    
      <c:forEach items="${searchList}" var="searchList" varStatus="status">
        <div class="col-sm-6 col-md-3 bookList-dv">
          <a href="/book/view?e_book_num=${searchList.e_book_num}">
            <div class="bookContent">
              <img src="/resources/imgs/book-imgs/${searchList.e_book_img_path}" />
              <h4>${searchList.e_book_title}</h4>
              <p>${searchList.e_book_writer}</p>
            </div>
          </a>
        </div>
      </c:forEach>
      
    </div>
    
    <!-- 전체 책 리스트 더보기 버튼  -->
    <div class="row btn-search" id="bookList-div">
      <input type="button" value="기본 더보기" id="bookList-more" class="btn btn-block btn-lg"/>
    </div>

    <!-- 검색 책 리스트 더보기 버튼  -->
    <div class="row btn-search" id="searchList-div">
      <input type="button" value="검색 더보기" id="searchList-more" class="btn btn-block btn-lg"/>
    </div>
    
  </div>
</body>
</html>
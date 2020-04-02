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

<!-- css -->
<link rel="stylesheet" href="/resources/css/search/search.css" />
<!-- js -->
<script src="/resources/js/search/search.js"></script>

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
      <input type="button" value="더보기" id="bookList-more" class="btn btn-block btn-lg"/>
    </div>

    <!-- 검색 책 리스트 더보기 버튼  -->
    <div class="row btn-search" id="searchList-div">
      <input type="button" value="더보기" id="searchList-more" class="btn btn-block btn-lg"/>
    </div>
    
    <!-- TOP버튼 -->
    <a href="#" id="MOVE_TOP_BTN">TOP</a>
    
  </div>
</body>
</html>
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
<meta name="author" content="김지나" />
<meta name="description" content="기본 폼 예시 페이지" />

<title>TestPageForm</title>

<style>
  *{
  margin: 0;
  padding: 0;
}
li{
  list-style: none;
}

img {
  border-radius: 50%;
  margin-top: 40px;
  margin-bottom: 5%;
}

.box2{
  border: 1px solid rgb(187, 187, 187);
  margin-bottom: 5%;
  width: 33.3333%;
  border-radius: 5%;
  font-size: 20px;
}

.nav-item {
  width: 33.3333%;
  text-align: center;
}

.nav-item > a {
  font-weight: bold;
}

.table {
  text-align: center;
}

.num {
  width: 10%;
}
</style>
</head>
<body>
  <div class="container">

    <div class="box1">
      <img src="http://placehold.it/100x100" alt="">
    </div>

    <div class="box2">~의 서재</div>

    <div class="box3">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item"><a class="nav-link active"
          id="read-tab" data-toggle="tab" href="#read" role="tab"
          aria-controls="read" aria-selected="true">읽은 도서 목록</a></li>
        <li class="nav-item"><a class="nav-link"
          id="reservation-tab" data-toggle="tab" href="#reservation"
          role="tab" aria-controls="reservation" aria-selected="false">찜한
            도서 목록</a></li>
        <li class="nav-item"><a class="nav-link" id="like-tab"
          data-toggle="tab" href="#like" role="tab" aria-controls="like"
          aria-selected="false">좋아요 한 도서 목록</a></li>
      </ul>


      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="read" role="tabpanel"
          aria-labelledby="read">
           <!-- 읽은 도서 목록 -->
          <table class="table">
            <thead class="thead-dark">
              <tr>
                <th class="num" scope="col">번호</th>
                <th scope="col">읽은 도서</th>
                <th scope="col">날짜</th>

              </tr>
            </thead>
            <tbody>
              <c:forEach items="${list1}" var = "list1">
               <tr>
                <td>${list1.HADREAD_NUM }</td>
                <td>${list1.e_book_title}</td>
                <td><fmt:formatDate value ="${list1.HADREAD_DATE}" pattern="yyyy-MM-dd"/></td>
               </tr>
             </c:forEach>
            </tbody>
          </table>
        </div>
        <div class="tab-pane fade" id="reservation" role="tabpanel"
          aria-labelledby="reservation">
           <!-- 찜한 도서 목록 -->
          <table class="table">
            <thead class="thead-dark">
              <tr>
                <th class="num" scope="col">번호</th>
                <th scope="col">찜한 도서</th>
                <th scope="col">날짜</th>

              </tr>
            </thead>
            <tbody>
              <c:forEach items="${list2}" var = "list2">
               <tr>
                <td>${list2.FAVORITE_NUM }</td>
                <td>${list2.e_book_title}</td>
                <td><fmt:formatDate value ="${list2.FAVORITE_DATE}" pattern="yyyy-MM-dd"/></td>
               </tr>
             </c:forEach>
            </tbody>
          </table>
        </div>
        <div class="tab-pane fade" id="like" role="tabpanel"
          aria-labelledby="like">
          <!-- 좋아요 한 도서 목록 -->
          <table class="table">
            <thead class="thead-dark">
              <tr>
                <th class="num" scope="col">번호</th>
                <th scope="col">좋아요 한 도서</th>
                <th scope="col">날짜</th>

              </tr>
            </thead>
            <tbody>
             <c:forEach items="${list3}" var = "list3">
               <tr>
                <td>${list3.THUMBUP_NUM }</td>
                <td>${list3.e_book_title}</td>
                <td><fmt:formatDate value ="${list3.THUMBUP_DATE}" pattern="yyyy-MM-dd"/></td>
               </tr>
             </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>

  </div>
</body>
</html>
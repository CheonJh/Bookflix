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
<meta name="description" content="내 서재 페이지" />

<title>mylib</title>
<link rel="stylesheet" href="/resources/css/myPage/mylib.css?" />
</head>
<body>

  <div class="title">
    <h3>내서재 관리</h3>
    <a href="/myPage/Page" id="back"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
    <hr>
  </div>

  <div class="container">

    <div class="img">
      <div class="box1">
       <%-- <form method="post"
            enctype="multipart/form-data">
            <img src="/resources/imgs/member_img/${member.member_img}" alt=""> <input
              type="file" name="file" /> <input type="submit" value="전송">
          </form> --%>

        <c:if test="${ab != 0}">
        <form method="post" enctype="multipart/form-data">
          <img src="/resources/imgs/member_img/${member.member_img}"
            alt="새로고침 해주세요" class="member_img">
        </form>
        </c:if>
        <c:if test="${ab == 0}">
          <form method="post"
            enctype="multipart/form-data">
            <img src="http://placehold.it/100x100" alt="" class="member_img" > <input
              type="file" name="file" /> <input type="submit" value="전송">
          </form>
        </c:if>

      </div>

      <h6>서재명</h6>
      <div class="box2">
        <p>${member.member_nickname}의서재</p>
      </div>
    </div>

    <div class="box3">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item"><a class="nav-link" id="read-tab"
          data-toggle="tab" href="#read" role="tab" aria-controls="read"
          aria-selected="true"> 읽은 도서 목록 </a></li>
        <li class="nav-item"><a class="nav-link active"
          id="reservation-tab" data-toggle="tab" href="#reservation"
          role="tab" aria-controls="reservation" aria-selected="false">
            찜한 도서 목록 </a></li>
        <li class="nav-item"><a class="nav-link" id="like-tab"
          data-toggle="tab" href="#like" role="tab" aria-controls="like"
          aria-selected="false"> 좋아요 한 도서 목록 </a></li>
      </ul>

      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade" id="read" role="tabpanel"
          aria-labelledby="read">
          <!-- 읽은 도서 목록 -->
          <table class="table">
            <thead class="thead">
              <tr>
                <th class="num" scope="col">번호</th>
                <th class="readbook" scope="col">읽은 도서</th>
                <th scope="col">날짜</th>
              </tr>
            </thead>
            <tbody>
              <c:if test="${tt1 != 0}">
                <c:forEach items="${list1}" var="list1"
                  varStatus="status">
                  <tr>
                    <td>${status.count}</td>
                    <td>${list1.e_book_title}</td>
                    <td><fmt:formatDate
                        value="${list1.hadread_date}"
                        pattern="yyyy-MM-dd" /></td>
                  </tr>
                </c:forEach>
              </c:if>
              <c:if test="${tt1 == 0}">
                <tr class="tr">
                  <td class="not"></td>
                  <td class="not">읽은 도서 내역이 없습니다.</td>
                  <td class="not"></td>
                </tr>
              </c:if>
            </tbody>
          </table>
        </div>
        <div class="tab-pane fade show active" id="reservation"
          role="tabpanel" aria-labelledby="reservation">
          <!-- 찜한 도서 목록 -->
          <table class="table">
            <thead class="thead">
              <tr>
                <th class="num" scope="col">번호</th>
                <th class="readbook" scope="col">찜한 도서</th>
                <th scope="col">날짜</th>
              </tr>
            </thead>
            <tbody>
              <!-- 찜한도서가 있을 때 -->
              <c:if test="${tt2 != 0}">
                <c:forEach items="${list2}" var="list2"
                  varStatus="status">
                  <tr>
                    <td>${status.count }</td>
                    <td>${list2.e_book_title}</td>
                    <td><fmt:formatDate
                        value="${list2.favorite_date}"
                        pattern="yyyy-MM-dd" /></td>
                  </tr>
                </c:forEach>
              </c:if>
              <!-- 찜한도서가 없을 때 -->
              <c:if test="${tt2 == 0}">
                <tr class="tr">
                  <td class="not"></td>
                  <td class="not">찜한 도서 내역이 없습니다.</td>
                  <td class="not"></td>
                </tr>
              </c:if>
            </tbody>
          </table>
        </div>
        <div class="tab-pane fade" id="like" role="tabpanel"
          aria-labelledby="like">
          <!-- 좋아요 한 도서 목록 -->
          <table class="table">
            <thead class="thead">
              <tr>
                <th class="num" scope="col">번호</th>
                <th class="readbook" scope="col">좋아요 한 도서</th>
                <th scope="col">날짜</th>
              </tr>
            </thead>
            <tbody>
              <c:if test="${tt3 != 0}">
                <c:forEach items="${list3}" var="list3"
                  varStatus="status">
                  <tr>
                    <td>${status.count }</td>
                    <td>${list3.e_book_title}</td>
                    <td><fmt:formatDate
                        value="${list3.thumbup_date}"
                        pattern="yyyy-MM-dd" /></td>
                  </tr>
                </c:forEach>
              </c:if>
              <c:if test="${tt3 == 0}">
                <tr class="tr">
                  <td class="not"></td>
                  <td class="not">좋아요 한 도서 내역이 없습니다.</td>
                  <td class="not"></td>
                </tr>
              </c:if>
            </tbody>
          </table>
        </div>
      </div>
    </div>

  </div>
</body>
</html>
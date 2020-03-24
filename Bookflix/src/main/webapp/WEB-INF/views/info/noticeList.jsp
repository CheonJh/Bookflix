<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="김성훈" />
<meta name="description" content="공지사항 목록 페이지" />

<title>TestPageForm</title>

<style type="text/css">
#notignb {
  width: 100%;
  height: 200px;
  margin: 0 auto;
}

#notignb ul {
 padding-top: 15px;
 
}

#notignb ul li {
  display: inline;
  font: bold 25px;
}


li {
  list-style: none;
  
}

.active {
  background-color: lightgrey;
}

.container {
  margin: 40px auto;
}

.tbFAQ td, .tbFAQ th {
  margin: 0;
  padding: 0;
  height: 30px;
  line-height: 30px;
  text-align: center;
  max-width: 600px;
}

.tb-nb{
  width: 100px;
}

.tb-ct {
  width: 100px;
}

.tb-ap {
  width: 200px;
}

a, a:hover {
  color: black;
  text-decoration: none;
}

.page-link {
  color: black;
  text-decoration: none;
}
</style>
</head>
<body>
 
  <div id="notignb">
    <ul class="clearfix">
      <li><a href="/info/noticeList?num=1?cat=1">공지사항</a></li>
      <li><a href="/info/noticeList?num=1?cat=2">업데이트</a></li>
      <li><a href="/info/noticeList?num=1?cat=3">이벤트</a></li>
    </ul>
  </div>

  <div class="container">
    <table class="table table-bordered tbFAQ">
      <thead>
        <tr class="active">
          <th class="tb-nb">번호</th>
          <th class="tb-ct">항목</th>
          <th class="tb-cl">내용</th>
          <th class="tb-ap">등록일</th>
        </tr>
      </thead>
      <c:forEach items="${list}" var="list">
        <tr>
          <td>${list.notice_num}</td>
          <td>${list.notice_category}</td>
          <td><a
            href="/info/notice?notice_num=${list.notice_num}">${list.notice_title}</a></td>
          <td><fmt:formatDate value="${list.notice_date}"
              pattern="yyyy-MM-dd"></fmt:formatDate></td>
        </tr>
      </c:forEach>
    </table>
    </div>
  <div>
  <c:if test="${prev}">
    <span>[<a href="/info/noticeList?num=${startPageNum -1}">이전</a>]</span>
  </c:if>
  
  <c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
    <span>
      <c:if test="${select != num}">
        <a href="/info/noticeList?num=${num}">${num}</a>
       </c:if>
       
       <c:if test="${select == num}">
          <b>${num}</b>
       </c:if>
    </span>
  </c:forEach>
  
  <c:if test="${next}">
    <span>[<a href="/info/noticeList?num=${endPageNum +1}">다음</a>]</span>
  </c:if>
  </div>
</body>
</html>
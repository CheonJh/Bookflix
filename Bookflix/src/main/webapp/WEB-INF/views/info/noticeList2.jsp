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

<!-- *************************************************** -->
<link rel="stylesheet" href="/resources/css/info/NoticeList.css?" />
<!-- *************************************************** -->

</head>
<body>
  <div class="notignb">
    <ul class="notinav-con">
      <li class="notinav-item1"><a class="ab1" href="/info/noticeList?num=1">전체보기</a></li>
      <li class="notinav-item2"><a class="ab2" href="/info/noticeList2?num=1">공지사항</a></li>
      <li class="notinav-item3"><a class="ab3" href="/info/noticeList3?num=1">업데이트</a></li>
      <li class="notinav-item4"><a class="ab4" href="/info/noticeList4?num=1">이벤트</a></li>
    </ul>
  </div>

  <div class="ntcontainer">
    <table class="table table-bordered tbFAQ">
      <thead>
        <tr class="tb-ttl">
          <th class="tb-nb">번호</th>
          <th class="tb-ct">항목</th>
          <th class="tb-cl">내용</th>
          <th class="tb-vc">조회수</th>
          <th class="tb-ap">등록일</th>
        </tr>
      </thead>
      <c:forEach items="${notiList2}" var="notiList2">
        <tr>
          <td>${notiList2.notice_num}</td>
          <td>${notiList2.notice_category}</td>
          <td><a
            href="/info/viewCnt?notice_num=${notiList2.notice_num}">${notiList2.notice_title}</a></td>
          <td><c:out value="${notiList2.notice_viewcnt}" /></td>
          <td><fmt:formatDate value="${notiList2.notice_date}"
              pattern="yyyy-MM-dd"></fmt:formatDate></td>
        </tr>
      </c:forEach>
    </table>
  </div>

  <div class="row" id="box4">
    <div id="nt-pagenaiton">
      <ul class="pagination">
        <c:if test="${prev}">
          <li class="page-item"><a class="page-link" id="page-link"
            href="/info/noticeList2?num=${startPageNum -1}">이전</a></li>
        </c:if>

        <c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
          <c:if test="${select != num}">
            <li class="page-item"><a class="page-link"
              id="page-link" href="/info/noticeList2?num=${num}">${num}</a></li>
          </c:if>
          <c:if test="${select == num}">
            <li class="page-item active"><a class="page-link"
                  id="page-link">${num}</a></li>
          </c:if>

        </c:forEach>
        <c:if test="${next}">
          <li class="page-item"><a class="page-link" id="page-link"
            href="/info/noticeList2?num=${endPageNum +1}">다음</a></li>
        </c:if>
      </ul>
    </div>
  </div>
</body>
</html>
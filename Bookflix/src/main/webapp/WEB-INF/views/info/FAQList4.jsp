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
<meta name="description" content="FAQ 목록 페이지" />

<title>TestPageForm</title>

<!-- *************************************************** -->
<link rel="stylesheet" href="/resources/css/info/FAQList.css?" />
<!-- *************************************************** -->

</head>
<body>
 
  <div id="notignb">
    <ul class="notinav-con">
      <li class="notinav-item1"><a class="ab1" href="/info/FAQList?num=1">전체보기</a></li>
      <li class="notinav-item2"><a class="ab2" href="/info/FAQList2?num=1">이용방법</a></li>
      <li class="notinav-item3"><a class="ab3" href="/info/FAQList3?num=1">구독</a></li>
      <li class="notinav-item4"><a class="ab4" href="/info/FAQList4?num=1">자주하는 질문</a></li>
    </ul>
  </div>

  <div class="ntcontainer">
    <table class="table table-bordered tbFAQ">
      <thead>
        <tr class="tb-ttl">
          <th class="tb-nb">번호</th>
          <th class="tb-ct">항목</th>
          <th class="tb-cl">내용</th>
        </tr>
      </thead>
      <c:forEach items="${FaqList4}" var="FaqList4">
        <tr>
          <td>${FaqList4.faq_num}</td>
          <td>${FaqList4.faq_category}</td>
          <td><a
            href="/info/FAQ?faq_num=${FaqList4.faq_num}">${FaqList4.faq_title}</a></td>
        </tr>
      </c:forEach>
    </table>
    </div>
    
  <div class="row" id="box4">
    <div id="nt-pagenaiton">
      <ul class="pagination">
        <c:if test="${prev}">
          <li class="page-item"><a class="page-link" id="page-link"
            href="/info/FAQList4?num=${startPageNum -1}">이전</a></li>
        </c:if>

        <c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
          <c:if test="${select != num}">
            <li class="page-item"><a class="page-link"
              id="page-link" href="/info/FAQList4?num=${num}">${num}</a></li>
          </c:if>
          <c:if test="${select == num}">
            <li class="page-item active"><a class="page-link"
                  id="page-link">${num}</a></li>
          </c:if>

        </c:forEach>
        <c:if test="${next}">
          <li class="page-item"><a class="page-link" id="page-link"
            href="/info/FAQList4?num=${endPageNum +1}">다음</a></li>
        </c:if>
      </ul>
    </div>
  </div>
</body>
</html>
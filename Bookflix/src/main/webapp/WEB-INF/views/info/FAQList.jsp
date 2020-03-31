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

<style type="text/css">
#notignb {
  width: 100%;
  height: 50px;
  margin: 0 auto;
  text-align: center;
  padding-top: 10px;
}

#notignb ul {
 padding-top: 15px;
 
}

#notignb ul li {
  display: inline;
  font: bold 35px;
  margin: 10px;
}


.active {
  background-color: lightgrey;
}

.ntcontainer {
  margin: 40px auto;
  width: 80%;
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
.tb-vc {
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

.nt-page{
  text-align: center;
}
</style>
</head>
<body>
 
  <div id="notignb">
    <ul class="clearfix">
      <li><a href="/info/FAQList?num=1">전체보기</a></li>
      <li><a href="/info/FAQList2?num=1">이용방법</a></li>
      <li><a href="/info/FAQList3?num=1">구독</a></li>
      <li><a href="/info/FAQList4?num=1">자주하는 질문</a></li>
    </ul>
  </div>

  <div class="ntcontainer">
    <table class="table table-bordered tbFAQ">
      <thead>
        <tr class="active">
          <th class="tb-nb">번호</th>
          <th class="tb-ct">항목</th>
          <th class="tb-cl">내용</th>
        </tr>
      </thead>
      <c:forEach items="${FaqList}" var="FaqList">
        <tr>
          <td>${FaqList.faq_num}</td>
          <td>${FaqList.faq_category}</td>
          <td><a
            href="/info/FAQ?faq_num=${FaqList.faq_num}">${FaqList.faq_title}</a></td>
        </tr>
      </c:forEach>
    </table>
    </div>
  <div class="nt-page">
  <c:if test="${prev}">
    <span>[<a href="/info/FAQList?num=${startPageNum -1}">이전</a>]</span>
  </c:if>
  
  <c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
    <span>
      <c:if test="${select != num}">
        <a href="/info/FAQList?num=${num}">${num}</a>
       </c:if>
       
       <c:if test="${select == num}">
          <b>${num}</b>
       </c:if>
    </span>
  </c:forEach>
  
  <c:if test="${next}">
    <span>[<a href="/info/FAQList?num=${endPageNum +1}">다음</a>]</span>
  </c:if>
  </div>
</body>
</html>
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

.notinav-con {
  display: flex;
  flex-direction: row;
  width: 40%;
  margin-left: 10%; padding : 0;
  background-color: #77ace1;
  list-style-type: none;
  padding: 0;
}

.notinav-item {
  padding: 15px;
  cursor: pointer;
  width: 25%;
  text-align: center;
}

.notinav-item:hover {
  background-color: skyblue;
}

.notinav-item a {
  text-align: center;
  text-decoration: none;
  color: white;
}

.active {
  background-color: lightgrey;
}

.ntcontainer {
  margin: 20px auto;
  width: 80%;
}

.tb-ttl {
  background-color: #e8e9f9;
}

.tbFAQ td, .tbFAQ th {
  margin: 0;
  padding: 0;
  height: 30px;
  line-height: 30px;
  text-align: center;
  max-width: 600px;
}

.tb-nb {
  width: 100px;
}

.tb-ct {
  width: 200px;
}

.page-link {
  color: black;
  text-decoration: none;
}

#box4{
  margin: 0.5rem 0;
}

#nt-pagenaiton {
  margin: 0 auto;
}

a:hover{
text-decoration: none;
}

</style>
</head>
<body>
 
  <div id="notignb">
    <ul class="notinav-con">
      <li class="notinav-item"><a href="/info/FAQList?num=1">전체보기</a></li>
      <li class="notinav-item"><a href="/info/FAQList2?num=1">이용방법</a></li>
      <li class="notinav-item"><a href="/info/FAQList3?num=1">구독</a></li>
      <li class="notinav-item"><a href="/info/FAQList4?num=1">자주하는 질문</a></li>
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
    
  <div class="row" id="box4">
    <div id="nt-pagenaiton">
      <ul class="pagination">
        <c:if test="${prev}">
          <li class="page-item"><a class="page-link" id="page-link"
            href="/info/FAQList2?num=${startPageNum -1}">이전</a></li>
        </c:if>

        <c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
          <c:if test="${select != num}">
            <li class="page-item"><a class="page-link"
              id="page-link" href="/info/FAQList2?num=${num}">${num}</a></li>
          </c:if>
          <c:if test="${select == num}">
            <li class="page-item active"><a class="page-link"
                  id="page-link">${num}</a></li>
          </c:if>

        </c:forEach>
        <c:if test="${next}">
          <li class="page-item"><a class="page-link" id="page-link"
            href="/info/FAQList2?num=${endPageNum +1}">다음</a></li>
        </c:if>
      </ul>
    </div>
  </div>
</body>
</html>
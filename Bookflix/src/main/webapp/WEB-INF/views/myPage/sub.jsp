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
<!-- css 연결 -->
<link rel="stylesheet" href="/resources/css/myPage/sub1.css" />
<!-- js 연결 -->
<script src="/resources/js/myPage/sub.js"></script>
</head>
<body>

  <div class="title">
    <h3>구독 관리</h3>
    <hr>
  </div>

  <div class="container">
    <div class="box2">
      <table class="table">

        <thead class="thead">
          <tr>
            <th id="sub1" scope="col" colspan="3">구독 내역</th>
          </tr>
          <tr>
            <th class="num" scope="col" class="num">번호</th>
            <th class="date" scope="col">구독 일시</th>
            <th class="fee" scope="col">구독 금액</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${list4}" var="list4" varStatus="status">
            <tr>
              <td>${status.count}</td>
              <td><fmt:formatDate value="${list4.subscribe_date}"
                  pattern="yyyy-MM-dd" /></td>
              <td>${list4.subscribe_fee}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

    <div class="box3">
      <c:if test="${member.member_grade==2}">
        <button type="button" class="btn btn-primary btn-lg btn-block"
          id="unsub">구독 해지</button>
      </c:if>
    </div>

  </div>
</body>
</html>
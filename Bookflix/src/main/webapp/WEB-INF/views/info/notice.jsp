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
<meta name="description" content="공지사항 상세 페이지" />

<title>TestPageForm</title>

<!-- *************************************************** -->
<link rel="stylesheet" href="/resources/css/info/InfoList.css" />
<!-- *************************************************** -->

</head>
<body>
  <form method="post">

    <div class="container">
      <table class="table table-bordered tbFAQ">

        <tr>
          <th class="tb-ttl">제목</th>
          <th>${notice.notice_title}</th>
        </tr>
        <tr>
          <td class="tb-ttl">날짜</td>
          <td><fmt:formatDate value="${notice.notice_date}"
              pattern="yyyy-MM-dd"></fmt:formatDate></td>
        </tr>
      </table>

      <p>Q:${notice.notice_title}</p>
      <p>${notice.notice_contents}</p>

      <p>조회수 : ${notice.notice_viewcnt}</p>

      <hr>

      <button type="button" class="btn btn-back">
        <a href="javascript:history.back()">이전페이지</a>
      </button>
      <button type="button" class="btn btn-page">
        <a href="/info/noticeList?num=1">목록페이지</a>
      </button>

    </div>
  </form>
</body>
</html>
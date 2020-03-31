<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="김성훈" />
<meta name="description" content="공지사항 상세 페이지" />

<title>TestPageForm</title>

  <style type="text/css">

.table{
  top: 100px;
  
}

.active{
  background-color: lightgray;
  width: 200px;
}

.tbFAQ td, .tbFAQ th{
  margin: 0;
  padding: 0;
 height: 30px;
 line-height: 30px;
 text-align: center;
 max-width: 600px;

}

li, a{
  list-style: none;
}

.btn-secondary{
  float: right;
}</style>
</head>
<body>
<form method="post">
  
  <div class="container">
  <table class="table table-bordered tbFAQ">
  
    <tr>
      <th class="active">제목</th>
      <th>${FAQ.faq_title}</th>
    </tr>
    <tr>

  </table>

  <p>Q:${FAQ.faq_title}</p>
  <p>${FAQ.faq_contents}</p>
  
  <hr>

  <button type="button" class="btn btn-light">이전페이지</button>
  <button type="button" class="btn btn-secondary">목록페이지</button>

  </div>
  </form>
</body>
</html>
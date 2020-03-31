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
<meta name="author" content="천재헌" />
<meta name="description" content="기본 폼 예시 페이지" />

<title>TestPageForm</title>

<!-- *************************************************** -->
<link rel="stylesheet" href="/resources/css/adminInfo/admFAQMod.css" />
<!-- *************************************************** -->
</head>
<body>
  <div class="container">
    <h1 class="text-primary" id="title">F A Q</h1>
    <form method="post">
      <!-- 제목 -->
      <div class="form-group row">
        <label for="tilte" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="tilte"
            name="faq_title" value="${view.faq_title}" required/>
        </div>
      </div>
      <!-- 내용 -->
      <div class="form-group row">
        <label for="validationTextarea" class="col-sm-2 col-form-label">내용</label>
        <div class="col-sm-10">
          <textarea class="form-control" id="validationTextarea"  name="faq_contents"
            required>${view.faq_contents}</textarea>

        </div>
      </div>
      <!-- 말머리 -->
      <div class="form-group row">
        <label for="validationTextarea" class="col-sm-2 col-form-label">분류</label>
        <div class="col-sm-2">
          <select class="custom-select" name="faq_category" >
            <option value="이용방법" <c:if test="${view.faq_category eq '이용방법'}">selected</c:if>>이용방법</option>
            <option value="구독" <c:if test="${view.faq_category eq '구독'}">selected</c:if>>구독</option>
            <option value="자주하는 질문" <c:if test="${view.faq_category eq '자주하는 질문'}">selected</c:if>>자주하는 질문</option>
          </select>
        </div>
      </div>
      <!-- 등록버튼 -->
      <div class="form-group row">
        <div class="col-sm-2 offset-5">
          <button type="submit" class="btn btn-primary">수정</button>
        </div>
      </div>
    </form>
  </div>
</body>
</html>
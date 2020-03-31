<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="천재헌" />
<meta name="description" content="기본 폼 예시 페이지" />

<title>admFAQList</title>


  <!-- *************************************************** -->
  <link rel="stylesheet" href="/resources/css/adminInfo/admFAQList.css" />
<script src="/resources/js/adminInfo/admFAQList.js"></script>
  <!-- *************************************************** -->
  
</head>
<body>

  <div class="container">
    <h2 style="text-align: center;" class="text-primary" id="title">공지사항 관리</h2>
    <!-- 검색창 -->
     <div class="col-md-6" id="box1">
      <div class="input-group mb-3">
        <select class="custom-select col-md-3"
          aria-label="Example select with button addon"
          name="searchType" id="searchType">
          <option value="title" selected>제목</option>
          <option value="category">분류</option>
          <option value="contents">내용</option>
        </select> <input type="text" class="form-control"
          aria-label="Text input with dropdown button"
          placeholder="검색할 단어를 입력하세요." id="keyword" name="keyword">
        <div class="input-group-append">
          <button class="btn btn-outline-secondary" type="button"
            id="btnSearch" name="btnSearch">
            <i class="fa fa-search" aria-hidden="true"></i>
          </button>
        </div>
      </div>
    </div>
    <!-- FAQ 목록 -->
    <div class="row" id="box2">
      <table class="table table-striped">
        <thead>
          <tr>
            <th style="width: 1%;"><div class="allCheck">
                <input type="checkbox" name="allCheck" id="allCheck" /><label
                  for="allCheck"></label>

              </div></th>
            <th>번호</th>
            <th>말머리</th>
            <th>제목</th>

          </tr>
        </thead>
        <tbody>
          <c:forEach items="${list}" var="list">
            <tr>
              <td>
                <div class="checkBox">
                  <input type="checkbox" name="chBox" class="chBox"
                    data-faqNum="${list.faq_num}"
                    value="${list.faq_num}" />
                </div>
              </td>
              <td>${list.faq_num}</td>
              <td>${list.faq_category}</td>
              <td class="nt">${list.faq_title}</td>
            </tr>
          </c:forEach>
        </tbody>

      </table>
    </div>
    <!-- 삭제,수정,등록 버튼 -->
    <div class="row btn-toolbar" id="box3">
      <div class="btn-group mr-2">
        <button type="button"
          class="btn btn-outline-primary selectDelete_btn">삭제</button>
      </div>
      <div class="btn-group mr-2">
        <button class="btn btn-primary selectModify_btn">수정</button>
      </div>
      <div class="btn-group mr-2 offset-md-8 col">
        <button class="btn btn-primary col-sm-12"
          onclick="location.href='admFAQReg'">등록</button>
      </div>
    </div>
    <!-- 페이지 네이션 -->
      <div class="row" id="box4">
      <div id="pagination">
        <ul class="pagination">
          <!-- 검색시 페이지 네이션 -->
          <c:if test="${kw ne null}">
            <c:if test="${prev}">
              <li class="page-item"><a class="page-link"
                id="page-link" tabindex="-1"
                href="/adminInfo/admFAQList?num=${startPageNum - 1}&searchType=${st}&keyword=${kw}">Previous</a>
              </li>
            </c:if>

            <c:forEach begin="${startPageNum}" end="${endPageNum}"
              var="num">
              <c:if test="${select != num}">
                <li class="page-item"><a class="page-link"
                  id="page-link"
                  href="/adminInfo/admFAQList?num=${num}&searchType=${st}&keyword=${kw}">${num}</a></li>
              </c:if>
              <c:if test="${select == num}">
                <li class="page-item active"><a class="page-link"
                  id="page-link"
                  href="/adminInfo/admFAQList?num=${num}&searchType=${st}&keyword=${kw}">${num}</a></li>
              </c:if>

            </c:forEach>

            <c:if test="${next}">
              <li class="page-item"><a class="page-link"
                id="page-link"
                href="/adminInfo/admFAQList?num=${endPageNum + 1}&searchType=${st}&keyword=${kw}">Next</a></li>
            </c:if>
          </c:if>
          <!-- 검색하지 않고 평상시 페이지 네이션 -->
          <c:if test="${kw eq null}">
            <c:if test="${prev}">
              <li class="page-item"><a class="page-link"
                id="page-link" tabindex="-1"
                href="/adminInfo/admFAQList?num=${startPageNum - 1}">Previous</a>
              </li>
            </c:if>

            <c:forEach begin="${startPageNum}" end="${endPageNum}"
              var="num">
              <c:if test="${select != num}">
                <li class="page-item"><a class="page-link"
                  id="page-link"
                  href="/adminInfo/admNoticeList?num=${num}">${num}</a></li>
              </c:if>
              <c:if test="${select == num}">
                <li class="page-item active"><a class="page-link"
                  id="page-link"
                  href="/adminInfo/admFAQList?num=${num}">${num}</a></li>
              </c:if>

            </c:forEach>

            <c:if test="${next}">
              <li class="page-item"><a class="page-link"
                id="page-link"
                href="/adminInfo/admFAQList?num=${endPageNum + 1}">Next</a></li>
            </c:if>
          </c:if>
        </ul>
      </div>
    </div>
  </div>
</body>
</html>
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

<title>admNoticeList</title>

<!-- *************************************************** -->

<style type="text/css">
.container {
  width: 1000px;
}

#title {
  margin: 3rem 0;
}

#box1 {
  padding: 0%;
}

#box3, #box4 {
  margin: 0.5rem 0;
}

#pagination {
  margin: 0 auto;
}
</style>

<script>
  $(document).ready(function() {

    /* 모두 선택 체크박스에 체크를 하게되면, 
    개별 체크박스(.chBox)들도 모두 체크가 되는 스크립트 */

    $("#allCheck").click(function() {
      var chk = $("#allCheck").prop("checked");
      if (chk) {
        $(".chBox").prop("checked", true);
      } else {
        $(".chBox").prop("checked", false);
      }
    });

    /* 개별 체크박스가 선택되거나 선택해제되면 
    모두 선택 체크박스가 해체되는 스크립트 */

    $(".chBox").click(function() {
      $("#allCheck").prop("checked", false);
    });

    /* 삭제 버튼 실행하는 스크립트 */
/* 
    $(".selectDelete_btn").click(function() {
      var confirm_val = confirm("정말 삭제하시겠습니까?");

      if (confirm_val) {
        var checkArr = new Array();

        $("input[class='chBox']:checked").each(function() {
          checkArr.push($(this).attr("data-noticeNum"));
        });

        $.ajax({
          url : "/adminInfo/deleteNotice",
          type : "post",
          data : {
            chbox : checkArr
          },
          success : function() {
            location.href = "/adminInfo/admNoticeList";
          }
        });
      }
    });
 */
  });
</script>
<!-- *************************************************** -->
</head>

<body>

  <div class="container">
    <h2 style="text-align: center;" class="text-primary" id="title">공지사항
      관리</h2>
    <!-- 검색창 -->
    <div class="col-md-6" id="box1">
      <div class="input-group mb-3">
        <select class="custom-select col-md-3" id="inputGroup"
          aria-label="Example select with button addon">
          <option selected>선택</option>
          <option value="1">제목</option>
          <option value="2">말머리</option>
        </select> <input type="text" class="form-control"
          aria-label="Text input with dropdown button"
          placeholder="검색할 단어를 입력하세요.">
        <div class="input-group-append">
          <button class="btn btn-outline-secondary" type="button">
            <i class="fa fa-search" aria-hidden="true"></i>
          </button>
        </div>
      </div>
    </div>
    <!-- 공지사항 목록 -->
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
            <th>조회수</th>
            <th>작성일</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${list}" var="list">
            <tr>
              <td>
                <div class="checkBox">
                  <input type="checkbox" name="chBox" class="chBox"
                    data-noticeNum="${list.notice_num}" />

                </div>
              </td>
              <td>${list.notice_num}</td>
              <td>${list.notice_category}</td>
              <td>${list.notice_title}</td>
              <td>${list.notice_viewcnt}</td>
              <td><fmt:formatDate value="${list.notice_date}"
                  pattern="yyyy.MM.dd" /></td>
            </tr>
          </c:forEach>
        </tbody>

      </table>
    </div>
    <!-- 삭제,수정,등록 버튼 -->
    <div class="row btn-toolbar" id="box3">
      <div class="btn-group mr-2">
        <button type="button" class="btn btn-outline-primary selectDelete_btn">삭제</button>
      </div>
      <div class="btn-group mr-2">
        <button class="btn btn-primary">수정</button>
      </div>
      <div class="btn-group mr-2 offset-md-8 col">
        <button class="btn btn-primary col-sm-12"
          onclick="location.href='admNoticeReg'">등록</button>
      </div>
    </div>
    <!-- 페이지 네이션 -->
    <div class="row" id="box4">
      <div id="pagination">
        <ul class="pagination">
          <c:if test="${prev}">
            <li class="page-item"><a class="page-link"
              tabindex="-1"
              href="/adminInfo/admNoticeList?num=${startPageNum - 1}">Previous</a>
            </li>
          </c:if>

          <c:forEach begin="${startPageNum}" end="${endPageNum}"
            var="num">
            <c:if test="${select != num}">
              <li class="page-item"><a class="page-link"
                href="/adminInfo/admNoticeList?num=${num}">${num}</a></li>
            </c:if>
            <c:if test="${select == num}">
              <li class="page-item active"><a class="page-link"
                href="/adminInfo/admNoticeList?num=${num}">${num}</a></li>
            </c:if>

          </c:forEach>

          <c:if test="${next}">
            <li class="page-item"><a class="page-link"
              href="/adminInfo/admNoticeList?num=${endPageNum + 1}">Next</a></li>
          </c:if>

        </ul>
      </div>
    </div>
  </div>
</body>
</html>
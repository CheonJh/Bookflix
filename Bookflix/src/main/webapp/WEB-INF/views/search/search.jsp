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
<meta name="description" content="검색 페이지" />

<title>Bookfilx 검색</title>

<!-- *************************************************** -->

<!-- jQuery 연결 -->
<script
  src="<%=request.getContextPath()%>/resources/common/jQuery/jquery-1.12.4.min.js"></script>
<script
  src="<%=request.getContextPath()%>/resources/common/jQuery/jquery-migrate-1.4.1.min.js"></script>

<!-- bootstrap 연결 -->
<link rel="stylesheet"
  href="<%=request.getContextPath()%>/resources/common/bootstrap/css/bootstrap.min.css">
<script
  src="<%=request.getContextPath()%>/resources/common/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- font-awesome 연결 -->
<link rel="stylesheet"
  href="<%=request.getContextPath()%>/resources/common/font-awesome/css/font-awesome.min.css">

<!-- 공통 CSS 연결 -->
<link rel="stylesheet"
  href="<%=request.getContextPath()%>/resources/css/commonStyle.css">

<!-- *************************************************** -->
<style type="text/css">
#box1 {
  margin-top: 3rem;
  margin-bottom: 3rem;
}

#title {
  text-align: center;
  width: 100%;
}

img {
  border-radius: 50%;
  margin-top: 40px;
  margin-bottom: 5%;
}

.table {
  text-align: center;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col" id="box1">
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <button class="btn btn-outline-secondary dropdown-toggle"
              type="button" data-toggle="dropdown" aria-haspopup="true"
              aria-expanded="false">선택</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">제목</a> <a
                class="dropdown-item" href="#">글쓴이</a> <a
                class="dropdown-item" href="#">출판사</a>
            </div>
          </div>
          <input type="text" class="form-control"
            aria-label="Text input with dropdown button"
            placeholder="검색할 단어를 입력하세요.">
          <button class="btn btn-outline-secondary" type="button">
            <i class="fa fa-search" aria-hidden="true"></i>
          </button>
        </div>
      </div>
    </div>
    <div class="row">
      <table class="table">
        <tbody>
          <tr>
            <td><img src="http://placehold.it/100x100" alt=""></td>
            <td><img src="http://placehold.it/100x100" alt=""></td>
            <td><img src="http://placehold.it/100x100" alt=""></td>
            <td><img src="http://placehold.it/100x100" alt=""></td>
          </tr>
          <tr>
            <td>책 제목</td>
            <td>책 제목</td>
            <td>책 제목</td>
            <td>책 제목</td>
          </tr>
          <tr>
            <td><img src="http://placehold.it/100x100" alt=""></td>
            <td><img src="http://placehold.it/100x100" alt=""></td>
            <td><img src="http://placehold.it/100x100" alt=""></td>
            <td><img src="http://placehold.it/100x100" alt=""></td>
          </tr>
          <tr>
            <td>책 제목</td>
            <td>책 제목</td>
            <td>책 제목</td>
            <td>책 제목</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="row">
      <h1 id="title">베스트 도서 보러가기</h1>
    </div>
    <div class="row">
      <table class="table">
        <tbody>
          <tr>
            <td><img src="http://placehold.it/100x100" alt=""></td>
            <td><img src="http://placehold.it/100x100" alt=""></td>
            <td><img src="http://placehold.it/100x100" alt=""></td>
            <td><img src="http://placehold.it/100x100" alt=""></td>
          </tr>
          <tr>
            <td>책 제목</td>
            <td>책 제목</td>
            <td>책 제목</td>
            <td>책 제목</td>
          </tr>
          <tr>
            <td><img src="http://placehold.it/100x100" alt=""></td>
            <td><img src="http://placehold.it/100x100" alt=""></td>
            <td><img src="http://placehold.it/100x100" alt=""></td>
            <td><img src="http://placehold.it/100x100" alt=""></td>
          </tr>
          <tr>
            <td>책 제목</td>
            <td>책 제목</td>
            <td>책 제목</td>
            <td>책 제목</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
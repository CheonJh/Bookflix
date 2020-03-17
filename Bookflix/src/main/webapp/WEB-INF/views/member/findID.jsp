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
<meta name="description" content="아이디 찾기 페이지" />

<title>Bookflix 아이디 찾기 페이지</title>

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
html, body {
  height: 100%;
}

#title {
  text-align: center;
}

h1 {
  margin-bottom: 3rem;
}

.container {
  height: 100%;
}

.container>.row {
  height: 100%;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row align-items-center">
      <div class="col">
        <form>
          <h1 class="text-primary" id="title">이메일 찾기</h1>
          <div class="form-group row ">
            <label for="name" class="col-sm-2 offset-3 col-form-label">이름</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" id="name"
                placeholder="내용을 입력하세요." required>
            </div>
          </div>
          <div class="form-group row">
            <label for="phonenumber"
              class="col-sm-2 offset-3 col-form-label">연락처</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" id="phonenumber"
                placeholder="- 제외하고 입력해주세요." required>
            </div>
          </div>
          <!-- 등록버튼 -->
          <div class="form-group row">
            <div class="col-sm-2 offset-5">
              <button type="submit" class="btn btn-primary">찾기</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
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
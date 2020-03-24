<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="김지나" />
<meta name="description" content="기본 폼 예시 페이지" />

<title>TestPageForm</title>

<style>
  *{
  margin: 0;
  padding: 0;
}
li{
  list-style: none;
}

.box1 > h2 {
  padding: 30px;
  text-align: center;
}

#sub1 {
  text-align: center;
  background-color: rgb(143, 143, 143);
}


.num {
  width: 10%;
}

.box2 {
  text-align: center;
  margin-bottom: 10%;
}
</style>
</head>
<body>
  <div class="container">

    <div class="box1">
      <h2>구독 관리</h2>
    </div>

    <div class="box2">
      <table class="table">
        
        <thead class="thead-light">
          <tr>
            <th id = "sub1" scope="col" colspan="3">구독 내역</th>
          </tr>
          <tr>
            <th scope="col"  class="num" >번호</th>
            <th scope="col">구독 일시</th>
            <th scope="col">구독 금액</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>2019.08</td>
            <td>10000</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>2019.09</td>
            <td>1400000</td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td>2019.09</td>
            <td>1500000</td>
          </tr>
          <tr>
            <th scope="row">4</th>
            <td>2019.12</td>
            <td>17000</td>
          </tr>
          <tr>
            <th scope="row">5</th>
            <td>2020.01</td>
            <td>20000</td>
          </tr>
        </tbody>
      </table>
    </div>

    <div class="box3">
      <button type="button" class="btn btn-primary btn-lg btn-block">구독 해지</button>
    </div>

  </div>
</body>
</html>
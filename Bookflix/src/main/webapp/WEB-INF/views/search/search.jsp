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

<title>BOOKFLIX 검색</title>
<!--  
<script type="text/javascript">
  $(function() {
    var keyword = '';
    var cnt = 1;

    //파라미터값에 있는 걸 잘라서 값으로 반환 해주는 함수 $.urlParam('keyword') 원하는 파람 쓰면 그 파람의 값넘어옴
    $.urlParam = function(name) {
      var results = new RegExp('[\?&]' + name + '=([^&#]*)')
          .exec(window.location.href);
      if (results == null) {
        return null;
      } else {
        return results[1] || 0;
      }
    }

    $("#moreinfo").on("click",function() {
      keyword = $("#keyword").val();
      $.ajax({
        url : "/fleamarket/productajax/searchall?keyword="+ 
        keyword,
        type : "post",
        dataType : "json",
        success : function(data) {

        //alert(cnt+":카운트값"); var all = "<tr>";
        var all = "";
        $.each(data,function(key, value) {
          all = all + "<div class='col-sm-6 col-md-3'>";
//          if (cnt == 1 || cnt % 4 == 1) {
//             all = all + "<tr>";
//          }
//           var td = "<td>"
//           + "<a href=/fleamarket/maindetail/detailAction?itemboard_no="
//           + value.itemboard_No
//           + ">"
//           + "<img src=/fleamarket/resources/product/upload"+value.thumImg+"/><br>"
//           + value.itemboard_Title + "<br>"
//           + value.item_Price + "<br>"
//           + value.itemboard_Local + "<br></a>"
//           + "</td>";
          
          //  썸네일변환
          var div = "<div class='thumbnail' style='box-shadow: 5px 7px 20px -5px #8a8a8a;'>"
          + "<a href=/book/book/detail?e_book_num="
          + value.itemboard_No + ">"
          + "<img src=/fleamarket/resources/product/upload"+value.thumImg
          +" class='img'/>"
          + "<div class='caption text-center'>"
          + "<h4>" + value.itemboard_Title + "</h4>"
          + "<p>" + value.item_Price + "원</p>"
          + "<p>" + value.itemboard_Local + "</p>"
          + "</div></a></div>";

          all = all + div;
          /* if(cnt%4 == 0 ){
            all = all + "<tr>";
          } */

//           if (cnt % 4 == 0) {
            all = all + "</div>";
//           }
          
//           cnt = cnt + 1;

        }); //each END

        $(".itemtab").append(all);
      //alert("**********"+all+"--------------------------------------------------"+cnt);
      }//success END
    });//AJAX END
  });//moreinfo click END
});//function END
</script>
-->
<style type="text/css">
#box1 {
  margin-top: 3rem;
  margin-bottom: 3rem;
}

img {
  border-radius: 50%;
  margin-top: 40px;
  margin-bottom: 5%;
}

.table {
  text-align: center;
}

.thumbnailImg{
  box-shadow: 5px 7px 20px -5px #8a8a8a;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col" id="box1">
        <div class="input-group mb-3">
          <!--
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
          -->
          
          <!-- 검색 -->
          <form id="searchForm" action="" method="post" role="search">
            <div class="form-group">
              <input type="text" class="form-control" name="searchKeyword" placeholder="검색할 단어를 입력하세요.">
              <button type="submit" id="subBtn" class="btn btn-outline-secondary">
                <i class="fa fa-search" aria-hidden="true"></i>
              </button>
            </div>
          </form>
          
        </div>
      </div>
    </div>
    <!-- 책 List View -->
    <!-- 책 이미지, 책번호, 책 제목, 책 저자 출력 -->
    <!-- e_book_img_name, e_book_num, e_book_title, e_book_writer -->

    <h4>'${keyword}' 검색</h4>
    <input type="hidden" name="keyword" value="${keyword}" id="keyword" />
    
    <div class="row">
    <c:forEach items="${bookList}" var="tmp" varStatus="status">
      <div class="col-sm-6 col-md-3">
        <a href="#">
          <div class="thumbnailImg">
            <img src="http://placehold.it/100x100"  />
            <h4>${bookList.e_book_title}</h4>
            <p>${bookList.e_book_writer}</p>
          </div>
        </a>
      </div>
    </c:forEach>
      <!-- <table class="table">
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
      </table> -->
    </div>
    
    <!-- 더보기 버튼  -->
    <div class="row">
      <input type="button" value="더보기" id="moreInfo" class="btn btn-info"/>
    </div>
    
    <!-- OR 스크롤 끝에 내려오면 자동 AJAX -->
  </div>
</body>
</html>
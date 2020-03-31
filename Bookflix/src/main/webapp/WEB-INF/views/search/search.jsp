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
<script type="text/javascript">
 
  $(function() {
    /* 검색 후 전체 목록 숨기기 */
    $("#subBtn").click(function() {
      $("#basicBookList").hide();
    });
    
    
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
        url : "/search/searchAjax?keyword="+keyword,
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
//           + "<a href=/book/book?e_book_num="
//           + value.e_book_num
//           + ">"
//           + "<img src=/resources/igs/book-imgs/"+value.e_book_img_name+"/><br>"
//           + value.e_book_title + "<br>"
//           + value.e_book_writer + "<br></a>"
//           + "</td>";
          
          //  썸네일변환
          var div = "<div class='thumbnail' style='box-shadow: 5px 7px 20px -5px #8a8a8a;'>"
          + "<a href=/book/book/detail?e_book_num="
          + value.e_book_num + ">"
          + "<img src=/fleamarket/resources/product/upload"+value.thumImg
          +" class='img'/>"
          + "<div class='caption text-center'>"
          + "<h4>" + value.e_book_itle + "</h4>"
          + "<p>" + value.e_book_writer + "</p>"
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

<style type="text/css">
#searchForm {
  margin-top: 3rem;
  margin-bottom: 3rem;
}

/* img {

  margin-top: 40px;
  margin-bottom: 5%;
} */

.table {
  text-align: center;
}

.thumbnailImg{
  box-shadow: 5px 7px 20px -5px #8a8a8a;
  height: 350px;
  margin: 15px auto;
}

.thumbnailImg img{
  border-radius: 50%;
  display : block;
  width: 250px;
  height: 250px;
  margin: 0 auto;
}

.bookList-dv:hover {
  border: solid 2px orange;
}

</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col">
        <!-- 검색 --> 
        <form id="searchForm" action="/search/search" method="post" role="search" class="center">
          <div class="input-group mb-3 input-group-lg">
            <input type="text" class="form-control" name="searchKeyword" placeholder="검색할 단어를 입력하세요." aria-describedby="subBtn" value="${keyword}">
            <div class="input-group-append">
              <button type="submit" id="subBtn" class="btn btn-outline-secondary">
                <i class="fa fa-search" aria-hidden="true"></i>
              </button>
            </div>
          </div>
        </form>
      </div>   
    </div>
    <!-- 책 List View -->
    <!-- 책 이미지, 책번호, 책 제목, 책 저자 출력 -->
    <!-- e_book_img_path, e_book_num, e_book_title, e_book_writer -->
    <%-- <input type="hidden" name="keyword" value="${keyword}" id="keyword" /> --%>
    
    <!-- 기본 전체 목록 -->
    <div class="row bookList" id="basicBookList">
      <c:forEach items="${bookList}" var="bookList" varStatus="status">
        <div class="col-sm-6 col-md-3 bookList-dv" >
          <a href="/book/book?e_book_num=${bookList.e_book_num}">
            <div class="thumbnailImg">
              <img src="/resources/imgs/book-imgs/${bookList.e_book_img_path}" />
              <h4>${bookList.e_book_title}</h4>
              <p>${bookList.e_book_writer}</p>
            </div>
          </a>
        </div>
      </c:forEach>
    </div>
    
    <!-- 검색 목록-->
    <c:if test="${searchList !=null}">
      <h4>'${keyword}' 검색</h4>
    </c:if>
    <div class="row bookList" id="searchBookList">>
      <c:forEach items="${searchList}" var="searchList" varStatus="status">
        <div class="col-sm-6 col-md-3 bookList-dv">
          <a href="/book/book?e_book_num=${searchList.e_book_num}">
            <div class="thumbnailImg">
              <img src="/resources/imgs/book-imgs/${searchList.e_book_img_path}" />
              <h4>${searchList.e_book_title}</h4>
              <p>${searchList.e_book_writer}</p>
            </div>
          </a>
        </div>
      </c:forEach>
    </div>
    
    <!-- 더보기 버튼  -->
    <div class="row">
      <input type="button" value="더보기" id="moreInfo" class="btn btn-info btn-lg btn-block"/>
    </div>
    
    <!-- OR 스크롤 끝에 내려오면 자동 AJAX -->
    
  </div>
</body>
</html>
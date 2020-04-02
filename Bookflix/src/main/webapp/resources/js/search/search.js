  $(function() {
    /* 키워드 존재 유무로 기본 도서 목록과 검색 도서 목록을 분류 */
    var keyword = $('#keyword').val();
    
    if (keyword == '') {
      $("#searchList-div").fadeOut();
    } else {
      $("#bookList-div").fadeOut();
      // $("#basicBookList").empty();
      $("#basicBookList").fadeOut();
    }
    
    
    
    //파라미터값에 있는 걸 잘라서 값으로 반환 해주는 함수 $.urlParam('keyword') 원하는 파람 쓰면 그 파람의 값넘어옴
    $.urlParam = function(name) {
      var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
      if (results == null) {
        return null;
      } else {
        return results[1] || 0;
      }
    } 
    
    // 전체 목록 더보기 버튼 - 클릭
    $("#bookList-more").on("click",function() {
      
      $.ajax({
        url : "/search/search3",
        type : "post",
        dataType : "json",
        success : function(data) {
          // ajax 통신 확인
          console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ SUCCESS  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
          console.log(data);
          
          if (data != '') {
            
            var all = "";
            $.each(data, function(key, value) {
              all = all + "<div class='col-sm-6 col-md-3 bookList-dv'>"
              + "<a href='/book/view?e_book_num=" + value.e_book_num + "'>"
              + "<div class='bookContent'>"
              + "<img src='/resources/imgs/book-imgs/"+value.e_book_img_path + "'/>"
              + "<h4>" + value.e_book_title + "</h4>"
              + "<p>" + value.e_book_writer + "</p>" 
              + "</div></a>"
              +"</div>";
            }); //each  
            var all2 = $(all).hide().fadeIn();
            // 붙혀
            $("#basicBookList").append(all2);
          
          } else {
            alert("다음 목록이 없습니다.");
            $("#bookList-more").fadeOut();
          }
          
        
      }, error : function () {
        console.log("실패");
      }
    });// ajax - search
  });// moreinfo - click
    
  
    // 검색 목록 더보기 버튼 - 클릭
    
    $("#searchList-more").on("click",function() {
      
      keyword = $("#keyword").val();
      
      $.ajax({
        url : "/search/search2?keyword="+keyword,
        type : "post",
        dataType : "json",
        success : function(data) {
          // ajax 통신 확인
          console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ SEARCH SUCCESS  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
          console.log(data);
          
          if (data != '') {
          
            var all = "";
            $.each(data, function(key, value) {
              all = all + "<div class='col-sm-6 col-md-3 bookList-dv'>"
              + "<a href='/book/view?e_book_num=" + value.e_book_num + "'>"
              + "<div class='bookContent'>"
              + "<img src='/resources/imgs/book-imgs/"+value.e_book_img_path + "'/>"
              + "<h4>" + value.e_book_title + "</h4>"
              + "<p>" + value.e_book_writer + "</p>" 
              + "</div></a>"
              +"</div>";
            }); //each  
            var all2 = $(all).hide().fadeIn();
            // 붙혀
            $("#searchBookList").append(all2);
          } else {
            alert('다음 목록이 없습니다.');
            $("#searchList-more").fadeOut();
          }
      }, error : function () {
        console.log("실패");
      }
    });// ajax - search
  });// moreinfo - click
  
  /* TOP 버튼 */
    $(window).scroll(function() {
      if ($(this).scrollTop() > 500) {
          $('#MOVE_TOP_BTN').fadeIn();
      } else {
          $('#MOVE_TOP_BTN').fadeOut();
      }
  });
  
  $("#MOVE_TOP_BTN").click(function() {
      $('html, body').animate({
          scrollTop : 0
      }, 400);
      return false;
  });
  
  });
/**
 * 구독하기
 */

$(document).ready(function() {
    
    //구독하기 버튼 
    $('#sub').click(function() {
      
    //ajax
    $.ajax({
      url:"/myPage/doSub",
      type: "get",
      success: function() {
        location.href = "/myPage/Page";
      },
      error: function () {
        console.log("실패");
      }
      
    }); // ajax

  }); // .click

  
  });

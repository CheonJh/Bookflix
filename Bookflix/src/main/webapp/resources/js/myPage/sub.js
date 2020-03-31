/**
 * 구독취소
 */

$(document).ready(function() {

    //구독해지 버튼 
    $('#unsub').click(function() {

      //ajax
      $.ajax({
        url : "/myPage/unSub",
        type : "get",
        success : function() {
          location.href = "/myPage/Page";
        },
        error : function() {
          console.log("실패");
        }

      }); // ajax

    }); // .click

  });


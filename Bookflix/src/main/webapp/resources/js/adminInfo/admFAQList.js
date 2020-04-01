

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

    $(".selectDelete_btn").click(function() {

      //변수 타입(boolean)
      var confirm_val = confirm("정말 삭제하시겠습니까?");

      if (confirm_val) {
        var checkArr = new Array();

        $("input[class='chBox']:checked").each(function() {
          checkArr.push($(this).attr("data-faqNum"));
        });

        $.ajax({
          url : "/adminInfo/deleteFAQ",
          type : "post",
          data : {
            chbox : checkArr
          },
          success : function() {
            location.href = "/adminInfo/admFAQList";
          }
        });
      }
    });

    /* 수정 버튼 실행되는 스크립트*/
    $(".selectModify_btn").click(function() {

      //체크박스에 체크 된 value값 가져와 변수에 넣어주기
      var faq_num = $("input[class='chBox']:checked").val();

      if ($("input[class='chBox']:checked").length == 1) {
        location.href = "/adminInfo/admFAQMod?faq_num=" + faq_num;
      } else {
        alert('체크박스를 하나만 선택해주세요.')
      }
    });

  });
 
 /* 검색 버튼 클릭시 실행되는 스크립트 */
 $(document).on('click', '#btnSearch', function(e) {
   e.preventDefault();
   var url = "/adminInfo/admFAQList";
   url = url + "?searchType=" + $('#searchType').val();
   url = url + "&keyword=" + $('#keyword').val();

   location.href = url;
   console.log(url);
  
 });
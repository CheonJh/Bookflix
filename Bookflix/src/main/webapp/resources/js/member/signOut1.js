/**
 * 
 */

$(document).ready(function () {

  // 다음 버튼 클릭시 체크박스에 체크 됐는지 확인하고 넘기기
  $('#btn_next').click(function () {
    if ($('input:checkbox[id="chk_agree"]').is(":checked")==true){
      location.href = "/member/signOut2";
    } else {
      alert("유의사항을 체크해주세요.");
      //return false;
    }
  }); // #btn_next.click
  
  // 돌아가기 버튼 클릭시 다시 마이페이지로 
  $('#btn_back').click(function () {
      location.href = "/myPage/Page";
  }); // #btn_back.click
  
});

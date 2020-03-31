/**
 * 
 */
//등록 버튼 클릭시 폼 데이터 확인 후 전송 스크립트
  function check() {
    if ($("#cateSt option:selected").val() == "0") {
      alert('말머리를 선택하세요.')
      return false;
    } else {
      return true;
    }
  }
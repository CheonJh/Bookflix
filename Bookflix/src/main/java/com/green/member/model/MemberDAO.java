package com.green.member.model;

import com.green.member.domain.MemberDTO;

public interface MemberDAO {
  
  // 1) 회원 로그인 체크
  public boolean loginCheck(MemberDTO memberDTO) throws Exception;
  

}

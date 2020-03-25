package com.green.member.model;

import com.green.member.domain.MemberDTO;

public interface MemberDAO {
  
  // 1-1) 회원 가입
  public void register(MemberDTO dto) throws Exception;
  
  // 1-2) 아이디 중복 체크 - AJAX
  public int idCheck(String member_email) throws Exception;

  // 1-3) 아이디 중복 체크 - AJAX
  public int nickCheck(String member_nickname) throws Exception;
  
  // 2) 회원 로그인 체크
  public MemberDTO login(MemberDTO memberDTO) throws Exception;
  

}

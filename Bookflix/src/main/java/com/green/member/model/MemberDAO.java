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
  
  // 3-1) 회원 탈퇴, 구독잔여일수 가져오기
  public int signOut1(int member_num) throws Exception;
  
  // 3-2 회원 탈퇴
  public void signOut2(int member_num) throws Exception;
  
  // 4-1) 회원 정보 수정
  public void modifyMember(MemberDTO dto) throws Exception;
  
  // 4-2) 회원 정보 수정 전 비밀번호 체크
  public int pwCheck(MemberDTO dto) throws Exception;
  
  //비번찾기
  public String findPW(MemberDTO dto) throws Exception;
  
  //아디찾기
  public String findID(MemberDTO dto) throws Exception;

}

package com.green.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.member.domain.MemberDTO;
import com.green.member.model.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

  // DAO
  @Inject
  private MemberDAO dao;

  // 1-1) 회원가입
  @Override
  public void register(MemberDTO dto) throws Exception {
    dao.register(dto);
  }

  // 1-2) 이메일 중복 확인
  @Override
  public int idCheck(String member_email) throws Exception {
    int result = dao.idCheck(member_email);
    return result;
  }
  
  // 1-3) 닉네임 중복 확인
  @Override
  public int nickCheck(String member_nickname) throws Exception {
    return dao.nickCheck(member_nickname);
  }
  
  // 2) 회원 로그인 체크
  @Override
  public MemberDTO login(MemberDTO memberDTO) throws Exception {
    return dao.login(memberDTO);
  }

}

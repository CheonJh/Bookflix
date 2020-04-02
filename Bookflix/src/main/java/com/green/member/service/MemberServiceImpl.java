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

  // 3-1) 회원 탈퇴, 구독 잔여일수 가져오기
  @Override
  public int signOut1(int member_num) throws Exception {
    return dao.signOut1(member_num);
  }
  
  // 3-2) 회원 탈퇴
  @Override
  public void signOut2(int member_num) throws Exception {
    dao.signOut2(member_num);
  }
  
  // 4-1) 회원정보수정
  @Override
  public void modifyMember(MemberDTO dto) throws Exception {
    dao.modifyMember(dto);
  }
  
  // 4-2) 회원정보 수정 전 비밀번호 체크
  @Override
  public int pwCheck(MemberDTO dto) throws Exception {
    return dao.pwCheck(dto);
  }
  //비번찾기
  @Override
  public String findPW(MemberDTO dto) throws Exception {

    String phone = dto.getMember_phone();
    String phoneTmp[] = new String[3];

    if (phone.length()==11) {
      phoneTmp[0] = phone.substring(0,3);
      phoneTmp[1] = phone.substring(3,7);
      phoneTmp[2] = phone.substring(7);
    } else {
      phoneTmp[0] = phone.substring(0,3);
      phoneTmp[1] = phone.substring(3,6);
      phoneTmp[2] = phone.substring(6);
    }
    dto.setMember_phone(phoneTmp[0]+"-"+phoneTmp[1]+"-"+phoneTmp[2]);
    
    return dao.findPW(dto);
  }

  @Override
  public String findID(MemberDTO dto) throws Exception {
    
    String phone = dto.getMember_phone();
    String phoneTmp[] = new String[3];

    if (phone.length()==11) {
      phoneTmp[0] = phone.substring(0,3);
      phoneTmp[1] = phone.substring(3,7);
      phoneTmp[2] = phone.substring(7);
    } else {
      phoneTmp[0] = phone.substring(0,3);
      phoneTmp[1] = phone.substring(3,6);
      phoneTmp[2] = phone.substring(6);
    }
    dto.setMember_phone(phoneTmp[0]+"-"+phoneTmp[1]+"-"+phoneTmp[2]);
    
    return dao.findID(dto);
  }

}

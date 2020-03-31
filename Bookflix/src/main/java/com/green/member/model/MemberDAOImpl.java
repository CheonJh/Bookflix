package com.green.member.model;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.member.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

  // 마이바티스
  @Inject
  private SqlSession sql;

  // 매퍼
  private static String namespace = "com.green.mapper.memberMapper";

  // 1-1) 회원가입
  @Override
  public void register(MemberDTO dto) throws Exception {
    // 생년월일 "-" 추가
    //
    // 1989 10 04 // length : 8
    // 0123 45 67
    // 1989-10-04 // length : 10
    // 0123456789
    String birth = dto.getMember_birth();
    String birthTmp[] = new String[3];
      
    birthTmp[0] = birth.substring(0,4);
    birthTmp[1] = birth.substring(4,6);
    birthTmp[2] = birth.substring(6);
    
    dto.setMember_birth(birthTmp[0]+"-"+birthTmp[1]+"-"+birthTmp[2]);
    // 휴대폰번호 "-" 추가
    // 
    // 010 9059 6579
    // 012 3456 789
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

    sql.insert(namespace + ".register", dto);
  }

  // 1-2) 아이디 중복 확인 - AJAX
  @Override
  public int idCheck(String member_email) throws Exception {
    return sql.selectOne(namespace + ".idCheck", member_email);
  }

  // 1-3) 닉네임 중복 확인 - AJAX
  @Override
  public int nickCheck(String member_nickname) throws Exception {
    return sql.selectOne(namespace + ".nickCheck", member_nickname);
  }
  
  // 2) 회원 로그인 체크
  @Override
  public MemberDTO login(MemberDTO memberDTO) throws Exception {
    return sql.selectOne(namespace+".login",memberDTO);
  }
  
  // 3-1) 회원 탈퇴 - 구독 잔여일수
  @Override
  public int signOut1(int member_num) throws Exception {
    return sql.selectOne(namespace+".signOut1",member_num);
  }
  
  // 3-2) 회원탈퇴
  @Override
  public void signOut2(int member_num) throws Exception {
    sql.delete(namespace+".signOut2",member_num);
  }
  
  // 4-1) 회원정보수정
  @Override
  public void modifyMember(MemberDTO dto) throws Exception {
    // 생년월일 "-" 추가
    //
    // 1989 10 04 // length : 8
    // 0123 45 67
    // 1989-10-04 // length : 10
    // 0123456789
    
    String birth = dto.getMember_birth();
    
    // 수정 안했으면 -가 남은상태라 길이가 10 이므로
    if (birth.length()==10) {
      // split를 이용해서 -를 모두 제거하고
      String birthArr[] = birth.split("-");
      // 다시 합치고
      birth = birthArr[0]+birthArr[1]+birthArr[2];
    }
      // 다시 똑같이 나눈다.
      String birthTmp[] = new String[3];
      
      birthTmp[0] = birth.substring(0,4);
      birthTmp[1] = birth.substring(4,6);
      birthTmp[2] = birth.substring(6);
    
    dto.setMember_birth(birthTmp[0]+"-"+birthTmp[1]+"-"+birthTmp[2]);
    
    // 휴대폰번호 "-" 추가
    // 
    // 010-9059-6579 // length : 13 
    // 010 9059 6579
    // 012 3456 789
    String phone = dto.getMember_phone();
    
    // 수정 안했으면 -가 남은상태라 길이가 13 이므로
    if (phone.length()==13) {
      // split를 이용해서 -를 모두 제거하고
      String phoneArr[] = phone.split("-");
      // 다시 합치고
      phone = phoneArr[0]+phoneArr[1]+phoneArr[2];
    }
    
    String phoneTmp[] = new String[3];

    if (phone.length()==11) {
      phoneTmp[0] = phone.substring(0,3);
      phoneTmp[1] = phone.substring(3,7);
      phoneTmp[2] = phone.substring(7);
    } else {
      // 가운데 자리가 3자리일 때
      phoneTmp[0] = phone.substring(0,3);
      phoneTmp[1] = phone.substring(3,6);
      phoneTmp[2] = phone.substring(6);
    }

    dto.setMember_phone(phoneTmp[0]+"-"+phoneTmp[1]+"-"+phoneTmp[2]);
    
    sql.update(namespace+".modifyMember", dto);
  }
  
  // 4-2) 회원정보수정 전 비밀번호 체크
  @Override
  public int pwCheck(MemberDTO dto) throws Exception {
    return sql.selectOne(namespace+".pwCheck", dto);
  }
}

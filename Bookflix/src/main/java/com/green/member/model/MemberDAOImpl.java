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
    sql.update(namespace+".modifyMember", dto);
  }
  
  // 4-2) 회원정보수정 전 비밀번호 체크
  @Override
  public int pwCheck(MemberDTO dto) throws Exception {
    return sql.selectOne(namespace+".pwCheck", dto);
  }
}

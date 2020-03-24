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
}

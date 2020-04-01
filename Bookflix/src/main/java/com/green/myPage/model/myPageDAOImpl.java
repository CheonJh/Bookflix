package com.green.myPage.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.member.domain.MemberDTO;
import com.green.myPage.domain.myPageDTO;

@Repository
public class myPageDAOImpl implements myPageDAO {

  @Inject
  private SqlSession sql;

  private static String namespace = "com.green.mapper.myPageMapper";

  // 읽은 도서 목록
  @Override
  public List<myPageDTO> list1(int member_num) throws Exception {
    return sql.selectList(namespace + ".list1", member_num);
  }

  // 찜한 도서 목록
  @Override
  public List<myPageDTO> list2(int member_num) throws Exception {
    return sql.selectList(namespace + ".list2", member_num);
  }

  // 좋아요 한 도서 목록
  @Override
  public List<myPageDTO> list3(int member_num) throws Exception {
    return sql.selectList(namespace + ".list3", member_num);
  }

  // 잔여 구독일 수
  @Override
  public int date(int member_num) throws Exception {
    return sql.selectOne(namespace + ".date", member_num);
  }

  // 구독 내역 보기
  @Override
  public List<myPageDTO> list4(int member_num) throws Exception {
    return sql.selectList(namespace + ".list4", member_num);
  }

  // 구독하기 1
  @Override
  public void sub1(int member_num) throws Exception {
    sql.update(namespace + ".sub1", member_num);
  }

  // 구독하기 2
  @Override
  public void sub2(int member_num) throws Exception {
    sql.insert(namespace + ".sub2", member_num);
  }

  // 구독해지
  @Override
  public void sub3(int member_num) throws Exception {
    sql.update(namespace + ".sub3", member_num);
  }

  // 파일 업로드
  @Override
  public void file(MemberDTO dto) throws Exception {
    sql.update(namespace+ ".fileupload", dto);
  }
}

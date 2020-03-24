package com.green.myPage.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.myPage.domain.myPageDTO;

@Repository
public class myPageDAOImpl implements myPageDAO {

  @Inject
  private SqlSession sql;
  
  private static String namespace = "com.green.mapper.myPageMapper";
 
  //읽은 도서 목록
  @Override
  public List<myPageDTO> list1() throws Exception {
    return sql.selectList(namespace+ ".list1");
  }
  
  //찜한 도서 목록
  @Override
  public List<myPageDTO> list2() throws Exception {
    return sql.selectList(namespace+ ".list2");
  }

  //좋아요 한 도서 목록
  @Override
  public List<myPageDTO> list3() throws Exception {
    return sql.selectList(namespace+ ".list3");
  }

}

package com.green.search.model;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAOImpl implements SearchDAO {
  
  // 마이바티스
  @Inject
  private SqlSession sql;

  // 매퍼
  private static String namespace = "com.green.mapper.searchMapper";
  
  
}

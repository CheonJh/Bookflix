package com.green.search.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.adminBook.domain.AdminBookDTO;

@Repository
public class SearchDAOImpl implements SearchDAO {
 
  // 마이바티스
  @Inject
  private SqlSession sql;

  // 매퍼
  private static String namespace = "com.green.mapper.searchMapper";

  // 1) 책 검색
  @Override
  public List<AdminBookDTO> searchBookList(String keyword) throws Exception {
    return sql.selectList(namespace + ".searchBookList", keyword);
  }

}

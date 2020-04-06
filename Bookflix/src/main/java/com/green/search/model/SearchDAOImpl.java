package com.green.search.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
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
  
  // 1) 전체 책
  // RowBounds를 쓰려면 세번째 매개변수에 넣어 줘야 하기때문에 가운데 null 추가함.
  @Override
  public List<AdminBookDTO> booklist(int startRow, int rowSize) throws Exception {
    return sql.selectList(namespace+".bookList", null, new RowBounds(startRow, rowSize));
  }
  
  // 2) 책 검색
  // RowBounds : 마이바티스 자동으로 offset, limit 처리
  @Override
  public List<AdminBookDTO> searchBookList(String keyword, int startRow, int rowSize) throws Exception {
    return sql.selectList(namespace + ".searchBookList", keyword, new RowBounds(startRow, rowSize));
  }
  

}

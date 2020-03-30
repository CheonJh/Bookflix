package com.green.search.model;

import java.util.List;

import com.green.adminBook.domain.AdminBookDTO;

public interface SearchDAO {
  
  // 1) 검색 책 리스트
  public List<AdminBookDTO> searchBookList(String keyword) throws Exception;

}

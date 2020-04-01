package com.green.search.service;

import java.util.List;

import com.green.adminBook.domain.AdminBookDTO;

public interface SearchService {
  
  // 1) 전체 책 리스트
  public List<AdminBookDTO> BookList() throws Exception;
  
  // 2) 검색 책 리스트
  public List<AdminBookDTO> searchBookList(String keyword, int stratRow, int rowSize) throws Exception;
  

}

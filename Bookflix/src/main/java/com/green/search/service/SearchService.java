package com.green.search.service;

import java.util.List;

import com.green.book.domain.BookDTO;

public interface SearchService {
  
  // 1) 검색 책 리스트
  public List<BookDTO> searchBookList(String keyword) throws Exception;

}

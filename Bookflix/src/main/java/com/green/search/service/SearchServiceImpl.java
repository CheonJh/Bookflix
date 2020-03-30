package com.green.search.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.book.domain.BookDTO;
import com.green.search.model.SearchDAO;


@Service
public class SearchServiceImpl implements SearchService {
  // DAO
  @Inject
  private SearchDAO dao;
  
  // 1) 검색 책 리스트
  @Override
  public List<BookDTO> searchBookList(String keyword) throws Exception {
    return dao.searchBookList(keyword);
  }
}

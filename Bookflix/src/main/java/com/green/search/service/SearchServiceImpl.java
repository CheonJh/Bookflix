package com.green.search.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.adminBook.domain.AdminBookDTO;
import com.green.search.model.SearchDAO;


@Service
public class SearchServiceImpl implements SearchService {
  // DAO
  @Inject
  private SearchDAO dao;
  
  // 1) 전체 책 리스트
  @Override
  public List<AdminBookDTO> BookList(int startRow, int rowSize) throws Exception {
    return dao.booklist(startRow, rowSize);
  }
  
  // 2) 검색 책 리스트
  @Override
  public List<AdminBookDTO> searchBookList(String keyword, int startRow, int rowSize) throws Exception {
    return dao.searchBookList(keyword, startRow, rowSize);
  }
  
}

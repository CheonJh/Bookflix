package com.green.book.service;

import java.util.List;

import com.green.book.domain.BookDTO;
import com.green.book.domain.FavoriteDTO;
import com.green.book.domain.HadReadDTO;
import com.green.book.domain.ThumbDTO;


public interface BookService {  
  
  //책 정보 테이블 가져오기
  public BookDTO view(Integer e_book_num) throws Exception;
  
  //좋아요 테이블 가져오기
  public ThumbDTO thumbDTO(ThumbDTO thumbParam) throws Exception;
  
  public FavoriteDTO favoriteDTO(FavoriteDTO favoriteParam) throws Exception;
 
  public HadReadDTO hadReadDTO(HadReadDTO hadReadParam) throws Exception;
  
  //좋아요 +1
  public void thumbUp(int e_book_num) throws Exception;
  
//좋아요 -1
  public void thumbDown(int e_book_num) throws Exception;
  
  // thumbup테이블 insert
  public void thumbInsert(ThumbDTO thumbDTO) throws Exception;

  public void thumbDelete(ThumbDTO thumbDTO) throws Exception;

  public void favoriteInsert(FavoriteDTO favoriteParam) throws Exception;

  public void favoriteDelete(FavoriteDTO favoriteParam) throws Exception;

  public List<BookDTO> tagBooks(String[] tagArray) throws Exception;

  public void hadReadInsert(HadReadDTO hadReadParam) throws Exception;

}

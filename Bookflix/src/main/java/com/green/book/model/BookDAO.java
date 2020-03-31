package com.green.book.model;

import com.green.book.domain.BookDTO;
import com.green.book.domain.FavoriteDTO;
import com.green.book.domain.ThumbDTO;

  public interface BookDAO {
    // 책 정보 가져오기
    public BookDTO view(Integer e_book_num) throws Exception;
    
    public ThumbDTO thumbDTO(ThumbDTO thumbParam) throws Exception;
    
    public FavoriteDTO favoriteDTO(FavoriteDTO favoriteParam) throws Exception;
    
    // 좋아요 +1
    public void thumbUp(int e_book_num) throws Exception;
    
    // 좋아요 -1
    public void thumbDown(int e_book_num) throws Exception;

    public void thumbInsert(ThumbDTO thumbDTO) throws Exception;

    public void thumbDelete(ThumbDTO thumbDTO) throws Exception;

    public void favoriteInsert(FavoriteDTO favoriteParam) throws Exception;

    public void favoriteDelete(FavoriteDTO favoriteParam) throws Exception;

  }
 
  

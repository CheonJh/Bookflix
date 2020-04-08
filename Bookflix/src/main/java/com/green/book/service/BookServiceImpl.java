package com.green.book.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.green.book.domain.BookDTO;
import com.green.book.domain.FavoriteDTO;
import com.green.book.domain.HadReadDTO;
import com.green.book.domain.ThumbDTO;
import com.green.book.model.BookDAO;

@Service
public class BookServiceImpl implements BookService {

  @Inject
  private BookDAO bookDao;

  // 책정보 불러오기
  @Override
  public BookDTO view(Integer e_book_num) throws Exception {
    return bookDao.view(e_book_num);
  }
  
  public ThumbDTO thumbDTO(ThumbDTO thumbParam) throws Exception{
    return bookDao.thumbDTO(thumbParam);
  }
  
  public FavoriteDTO favoriteDTO(FavoriteDTO favoriteParam) throws Exception{
    return bookDao.favoriteDTO(favoriteParam);
  }
  
  public HadReadDTO hadReadDTO(HadReadDTO hadReadParam) throws Exception {
    return bookDao.hadReadDTO(hadReadParam);
  }
  

  // 좋아요 +1
  @Override
  public void thumbUp(int e_book_num) throws Exception {
    bookDao.thumbUp(e_book_num);
  }
  
  // thumbup 테이블 삽입
  public void thumbInsert(ThumbDTO thumbParam) throws Exception{
    bookDao.thumbInsert(thumbParam);
  }

  // 좋아요 -1
  @Override
  public void thumbDown(int e_book_num) throws Exception {
    bookDao.thumbDown(e_book_num);
  }
  
//thumbup 테이블 삽입
  public void thumbDelete(ThumbDTO thumbParam) throws Exception{
    bookDao.thumbDelete(thumbParam);
 }

  @Override
  public void favoriteInsert(FavoriteDTO favoriteParam) throws Exception {
    bookDao.favoriteInsert(favoriteParam);
  }

  @Override
  public void favoriteDelete(FavoriteDTO favoriteParam) throws Exception {
    bookDao.favoriteDelete(favoriteParam);
  }

  @Override
  public List<BookDTO> tagBooks(@Param("tagArray") String[] tagArray) throws Exception {
    return bookDao.tagBooks(tagArray);
  }

  @Override
  public void hadReadInsert(HadReadDTO hadReadParam) throws Exception {
    bookDao.hadReadInsert(hadReadParam);
  }
  
}

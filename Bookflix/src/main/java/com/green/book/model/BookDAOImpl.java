package com.green.book.model;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.book.domain.BookDTO;
import com.green.book.domain.FavoriteDTO;
import com.green.book.domain.ThumbDTO;

@Repository
public class BookDAOImpl implements BookDAO {

  @Inject
  private SqlSession sql;

  private static String namespace = "com.green.mapper.bookMapper";

  // 책정보 불러오기
  @Override
  public BookDTO view(Integer e_book_num) throws Exception {
    return sql.selectOne(namespace + ".view", e_book_num);
  }
  
  // 좋아요 테이블 가져오기
  public ThumbDTO thumbDTO(ThumbDTO thumbParam) throws Exception{
    return sql.selectOne(namespace + ".thumbDTO", thumbParam);
  }
  
  // 찜하기 테이블 가져오기
  public FavoriteDTO favoriteDTO(FavoriteDTO favoriteParam) throws Exception{
    return sql.selectOne(namespace + ".favoriteDTO", favoriteParam);
  }
  
  // 좋아요 +1
  @Override
  public void thumbUp(int e_book_num) throws Exception {
    sql.update(namespace + ".thumbup", e_book_num);
  }
  
  // 좋아요 테이블 삽입
  public void thumbInsert(ThumbDTO thumbDTO) throws Exception {
    sql.insert(namespace + ".thumbinsert", thumbDTO);
  }

  //좋아요 -1
  @Override
  public void thumbDown(int e_book_num) throws Exception {
    sql.update(namespace + ".thumbdown", e_book_num);
  }
  
  // 좋아요 테이블 삭제
  public void thumbDelete(ThumbDTO thumbDTO) throws Exception {
    sql.delete(namespace + ".thumbdelete", thumbDTO);
  }

  // 찜하기 삽입
  @Override
  public void favoriteInsert(FavoriteDTO favoriteParam) throws Exception {
    sql.insert(namespace + ".favoritedelete", favoriteParam);
  }

  // 찜하기 삭제
  @Override
  public void favoriteDelete(FavoriteDTO favoriteParam) throws Exception {
    sql.delete(namespace + ".favoritedelete", favoriteParam);
  }
}
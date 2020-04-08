package com.green.book.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.book.domain.BookDTO;
import com.green.book.domain.FavoriteDTO;
import com.green.book.domain.HadReadDTO;
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
  
  // e-북 읽기
  public HadReadDTO hadReadDTO(HadReadDTO hadReadParam) throws Exception{
    return sql.selectOne(namespace + ".hadReadDTO", hadReadParam);
  }
  
  // 좋아요 +1
  @Override
  public void thumbUp(int e_book_num) throws Exception {
    sql.update(namespace + ".thumbUp", e_book_num);
  }
  
  // 좋아요 테이블 삽입
  public void thumbInsert(ThumbDTO thumbDTO) throws Exception {
    sql.insert(namespace + ".thumbInsert", thumbDTO);
  }

  //좋아요 -1
  @Override
  public void thumbDown(int e_book_num) throws Exception {
    sql.update(namespace + ".thumbDown", e_book_num);
  }
  
  // 좋아요 테이블 삭제
  public void thumbDelete(ThumbDTO thumbDTO) throws Exception {
    sql.delete(namespace + ".thumbDelete", thumbDTO);
  }

  // 찜하기 삽입
  @Override
  public void favoriteInsert(FavoriteDTO favoriteParam) throws Exception {
    sql.insert(namespace + ".favoriteInsert", favoriteParam);
  }

  // 찜하기 삭제
  @Override
  public void favoriteDelete(FavoriteDTO favoriteParam) throws Exception {
    sql.delete(namespace + ".favoriteDelete", favoriteParam);
  }

  // 관련도서 
  @Override
  public List<BookDTO> tagBooks(@Param("tagArray") String[] tagArray) throws Exception {
    return sql.selectList(namespace + ".tagBooks", tagArray);
  }
  
  // e-북 읽기
  @Override
  public void hadReadInsert(HadReadDTO hadReadParam) throws Exception {
    sql.insert(namespace + ".hadReadInsert", hadReadParam);
  }

}
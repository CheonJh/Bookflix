package com.green.book.model;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.book.domain.BookDTO;

@Repository
public class BookDAOImpl implements BookDAO {

 @Inject
 private SqlSession sql;
 
 private static String namespace = "com.green.mapper.bookMapper";
 
 @Override
 public BookDTO book(Integer e_book_num) throws Exception { 
  
  return sql.selectOne(namespace + ".book", e_book_num);
 }

}
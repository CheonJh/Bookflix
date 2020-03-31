package com.green.adminBook.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.adminBook.domain.AdminBookDTO;
import com.green.util.Search;

@Repository
public class AdminBookDAOImpl implements AdminBookDAO {

  @Inject
  private SqlSession sql;
  
  private static String namespace="com.green.mapper.adminBookMapper";

  @Override
  public int adminBookCount(Search search) throws Exception {
    return sql.selectOne(namespace+".adminBookCount", search);
  }


  @Override
  public List adminBookList(Search search) throws Exception {
    
    return sql.selectList(namespace+".adminBookList", search);
  }


  @Override
  public void adminBookReg(AdminBookDTO DTO) throws Exception {
    sql.insert(namespace+".adminBookReg", DTO);
  }


  @Override
  public AdminBookDTO adminBookView(int e_book_num) throws Exception {
    return sql.selectOne(namespace+".adminBookView", e_book_num);
  }


  @Override
  public void adminBookModify(AdminBookDTO DTO) throws Exception {
    // TODO Auto-generated method stub
    sql.selectOne(namespace+".adminBookModify", DTO);
  }


  @Override
  public void adminBookDelete(AdminBookDTO DTO) throws Exception {
    sql.delete(namespace+".adminBookDelete", DTO);
  }


}

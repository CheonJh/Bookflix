package com.green.adminBook.model;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.adminBook.domain.AdminBookDTO;

@Repository
public class AdminBookDAOImpl implements AdminBookDAO {

  @Inject
  private SqlSession sql;
  
  private static String namespace="com.green.mapper.adminBookMapper";

  @Override
  public int adminBookCount() throws Exception {
    return sql.selectOne(namespace+".adminBookCount");
  }


  @Override
  public List adminBookList(int displayPost, int postNum) throws Exception {
    HashMap postData = new HashMap();
    
    postData.put("displayPost", displayPost);
    postData.put("postNum", postNum);
    
    return sql.selectList(namespace+".adminBookList", postData);
  }


  @Override
  public void adminBookReg(AdminBookDTO DTO) throws Exception {
    sql.insert(namespace+".adminBookReg", DTO);
  }


}

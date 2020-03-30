package com.green.main.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.main.domain.MainDTO;

@Repository
public class MainDAOImpl implements MainDAO {

  @Inject
  private SqlSession sql;

  private static String namespace = "com.green.mapper.mainMapper";

  // 인기도서 목록
  @Override
  public List<MainDTO> favorite() throws Exception {

    return sql.selectList(namespace + ".favorite");
  }
  
  // 신간도서 목록
  @Override
  public List<MainDTO> newbook() throws Exception {
   
    return sql.selectList(namespace + ".newbook");
  }

}

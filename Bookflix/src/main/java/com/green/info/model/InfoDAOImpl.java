package com.green.info.model;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.info.domain.InfoNoticeDTO;

@Repository
public class InfoDAOImpl implements InfoDAO {

  @Inject
  private SqlSession sql;

  private static String namespace = "com.green.mapper.infoMapper";

  @Override
  public List<InfoNoticeDTO> list() throws Exception {

    return sql.selectList(namespace + ".list");
  }

  
  public InfoNoticeDTO notice(int notice_num) throws Exception {
    // TODO Auto-generated method stub
    return sql.selectOne(namespace + ".notice", notice_num);
  }
  
  @Override
  public int count() throws Exception {
    // TODO Auto-generated method stub
    return sql.selectOne(namespace + ".count");
  }
  
  @Override
  public List<InfoNoticeDTO> noticePage(int displayPost, int postNum) throws Exception {

    HashMap data = new HashMap();
    
    data.put("displayPost", displayPost);
    data.put("postNum", postNum);
    
    return sql.selectList(namespace + ".noticePage", data);
  }
  
  
  
}

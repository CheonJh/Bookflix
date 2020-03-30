package com.green.info.model;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.info.domain.InfoFaqDTO;
import com.green.info.domain.InfoNoticeDTO;

@Repository
public class InfoDAOImpl implements InfoDAO {

  @Inject
  private SqlSession sql;

  private static String namespace = "com.green.mapper.infoMapper";

  @Override
  public List<InfoNoticeDTO> notiList() throws Exception {
    return sql.selectList(namespace + ".notiList");
  }
  
  public InfoNoticeDTO notice(int notice_num) throws Exception {
    // TODO Auto-generated method stub
    return sql.selectOne(namespace + ".notice", notice_num);
  }
  
  @Override
  public int notiCount() throws Exception {
    // TODO Auto-generated method stub
    return sql.selectOne(namespace + ".notiCount");
  }
  
  @Override
  public List<InfoNoticeDTO> noticePage(int displayPost, int postNum) throws Exception {

    HashMap<String, Integer> data = new HashMap<String, Integer>();
    
    data.put("displayPost", displayPost);
    data.put("postNum", postNum);
    
    
    return sql.selectList(namespace + ".noticePage", data);
  }
  
  @Override
  public List<InfoNoticeDTO> noticePage2(int displayPost, int postNum) throws Exception {

    HashMap<String, Integer> data = new HashMap<String, Integer>();
    
    data.put("displayPost", displayPost);
    data.put("postNum", postNum);
    
    
    return sql.selectList(namespace + ".noticePage2", data);
  }
  
  @Override
  public List<InfoNoticeDTO> noticePage3(int displayPost, int postNum) throws Exception {

    HashMap<String, Integer> data = new HashMap<String, Integer>();
    
    data.put("displayPost", displayPost);
    data.put("postNum", postNum);
    
    
    return sql.selectList(namespace + ".noticePage3", data);
  }
  
  @Override
  public List<InfoNoticeDTO> noticePage4(int displayPost, int postNum) throws Exception {

    HashMap<String, Integer> data = new HashMap<String, Integer>();
    
    data.put("displayPost", displayPost);
    data.put("postNum", postNum);
    
    
    return sql.selectList(namespace + ".noticePage4", data);
  }

  @Override
  public void viewCnt(int notice_num) throws Exception {
       sql.update(namespace + ".viewCnt", notice_num);
  }


  @Override
  public List<InfoFaqDTO> FaqList() throws Exception {
    
    return sql.selectList(namespace + ".FaqList");
  }


  @Override
  public List<InfoFaqDTO> FaqPage(int displayPost, int postNum) throws Exception {
    HashMap<String, Integer> data = new HashMap<String, Integer>();
    
    data.put("displayPost", displayPost);
    data.put("postNum", postNum);
    
    return sql.selectList(namespace + ".FaqPage", data);
  }
  
  @Override
  public List<InfoFaqDTO> FaqPage2(int displayPost, int postNum) throws Exception {
    HashMap<String, Integer> data = new HashMap<String, Integer>();
    
    data.put("displayPost", displayPost);
    data.put("postNum", postNum);
    
    return sql.selectList(namespace + ".FaqPage2", data);
  }
  
  @Override
  public List<InfoFaqDTO> FaqPage3(int displayPost, int postNum) throws Exception {
    HashMap<String, Integer> data = new HashMap<String, Integer>();
    
    data.put("displayPost", displayPost);
    data.put("postNum", postNum);
    
    return sql.selectList(namespace + ".FaqPage3", data);
  }
  
  @Override
  public List<InfoFaqDTO> FaqPage4(int displayPost, int postNum) throws Exception {
    HashMap<String, Integer> data = new HashMap<String, Integer>();
    
    data.put("displayPost", displayPost);
    data.put("postNum", postNum);
    
    return sql.selectList(namespace + ".FaqPage4", data);
  }


  @Override
  public InfoFaqDTO FAQ(int faq_num) throws Exception {
    
    return sql.selectOne(namespace + ".FAQ", faq_num);
  }


  @Override
  public int faqCount() throws Exception {
    
    return sql.selectOne(namespace + ".faqCount");
  }
  
}

package com.green.info.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.green.info.domain.InfoFaqDTO;
import com.green.info.domain.InfoNoticeDTO;
import com.green.info.model.InfoDAO;

@Service
public class InfoServiceImpl implements InfoService {
  @Inject
  private InfoDAO dao;

  @Override
  public List<InfoNoticeDTO> notiList() throws Exception {
    return dao.notiList();
  }
  
  public InfoNoticeDTO notice(int notice_num) throws Exception {
    return dao.notice(notice_num);
  }

  @Override
  public int notiCount() throws Exception {
    return dao.notiCount();
  }

  @Override
  public List<InfoNoticeDTO> noticePage(int displayPost, int postNum) throws Exception {
    return dao.noticePage(displayPost, postNum);
  }
  
  @Override
  public List<InfoNoticeDTO> noticePage2(int displayPost, int postNum) throws Exception {
    return dao.noticePage2(displayPost, postNum);
  }
  
  @Override
  public List<InfoNoticeDTO> noticePage3(int displayPost, int postNum) throws Exception {
    return dao.noticePage3(displayPost, postNum);
  }
  
  @Override
  public List<InfoNoticeDTO> noticePage4(int displayPost, int postNum) throws Exception {
    return dao.noticePage4(displayPost, postNum);
  }

  @Override
  public void viewCnt(int notice_num) throws Exception {
    dao.viewCnt(notice_num);
  }

  @Override
  public List<InfoFaqDTO> FaqList() throws Exception {
    // TODO Auto-generated method stub
    return dao.FaqList();
  }

  @Override
  public List<InfoFaqDTO> FaqPage(int displayPost, int postNum) throws Exception {
    // TODO Auto-generated method stub
    return dao.FaqPage(displayPost, postNum);
  }
  
  @Override
  public List<InfoFaqDTO> FaqPage2(int displayPost, int postNum) throws Exception {
    // TODO Auto-generated method stub
    return dao.FaqPage2(displayPost, postNum);
  }
  
  @Override
  public List<InfoFaqDTO> FaqPage3(int displayPost, int postNum) throws Exception {
    // TODO Auto-generated method stub
    return dao.FaqPage3(displayPost, postNum);
  }
  
  @Override
  public List<InfoFaqDTO> FaqPage4(int displayPost, int postNum) throws Exception {
    // TODO Auto-generated method stub
    return dao.FaqPage4(displayPost, postNum);
  }

  @Override
  public InfoFaqDTO FAQ(int faq_num) throws Exception {
    // TODO Auto-generated method stub
    return dao.FAQ(faq_num);
  }

  @Override
  public int faqCount() throws Exception {
    // TODO Auto-generated method stub
    return dao.faqCount();
  }
  

  }


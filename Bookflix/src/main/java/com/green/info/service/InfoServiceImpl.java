package com.green.info.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.info.domain.InfoNoticeDTO;
import com.green.info.model.InfoDAO;

@Service
public class InfoServiceImpl implements InfoService {
  @Inject
  private InfoDAO dao;

  @Override
  public List<InfoNoticeDTO> list() throws Exception {
    // TODO Auto-generated method stub
    return dao.list();
  }

  public InfoNoticeDTO notice(int notice_num) throws Exception {
    // TODO Auto-generated method stub
    return dao.notice(notice_num);
  }
  
  @Override
  public int count() throws Exception {
    // TODO Auto-generated method stub
    return dao.count();
  }
  
  @Override
  public List<InfoNoticeDTO> noticePage(int displayPost, int postNum) throws Exception {
    // TODO Auto-generated method stub
    return dao.noticePage(displayPost, postNum);
  }
}

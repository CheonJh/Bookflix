package com.green.info.model;

import java.util.List;

import com.green.info.domain.InfoNoticeDTO;

public interface InfoDAO {
  
  public List<InfoNoticeDTO> list() throws Exception;
  
  public InfoNoticeDTO notice(int notice_num) throws Exception;
  
  public int count() throws Exception;
  
  public List<InfoNoticeDTO> noticePage(int displayPost, int postNum) throws Exception;
  
}

package com.green.info.model;

import java.util.List;

import com.green.info.domain.InfoFaqDTO;
import com.green.info.domain.InfoNoticeDTO;

public interface InfoDAO {
  
  public List<InfoNoticeDTO> notiList() throws Exception;

  public List<InfoFaqDTO> FaqList() throws Exception;
  
  public InfoNoticeDTO notice(int notice_num) throws Exception;
  
  public InfoFaqDTO FAQ(int faq_num) throws Exception;
  
  public int notiCount() throws Exception;
  
  public int faqCount() throws Exception;
  
  public List<InfoNoticeDTO> noticePage(int displayPost, int postNum) throws Exception;
  
  public List<InfoNoticeDTO> noticePage2(int displayPost, int postNum) throws Exception;
  
  public List<InfoNoticeDTO> noticePage3(int displayPost, int postNum) throws Exception;
  
  public List<InfoNoticeDTO> noticePage4(int displayPost, int postNum) throws Exception;
 
  public List<InfoFaqDTO> FaqPage(int displayPost, int postNum) throws Exception;
  
  public List<InfoFaqDTO> FaqPage2(int displayPost, int postNum) throws Exception;
  
  public List<InfoFaqDTO> FaqPage3(int displayPost, int postNum) throws Exception;
  
  public List<InfoFaqDTO> FaqPage4(int displayPost, int postNum) throws Exception;
  
  public void viewCnt(int notice_num) throws Exception;



  


}

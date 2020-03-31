package com.green.adminInfo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.adminInfo.domain.AdminInfoDTO;
import com.green.adminInfo.model.AdminInfoDAO;

@Service
public class AdminInfoServiceImpl implements AdminInfoService {

  @Inject
  private AdminInfoDAO dao;

  // 공지사항 총 갯수

  @Override
  public int countNotice(AdminInfoDTO dto) throws Exception {
    return dao.countNotice(dto);
  }

  // 공지사항 목록

  @Override
  public List<AdminInfoDTO> noticelistPage(int displayPost, int postNum, AdminInfoDTO dto) throws Exception {
    return dao.noticelistPage(displayPost, postNum, dto);
  }

  // 공지사항 작성
  @Override
  public void writeNotice(AdminInfoDTO dto) throws Exception {
    dao.writeNotice(dto);
  }

  // 공지사항 삭제
  @Override
  public void deleteNotice(AdminInfoDTO dto) throws Exception {
    dao.deleteNotice(dto);
  }

  // 공지사항 수정(내용 불러오기)
  @Override
  public AdminInfoDTO viewNotice(int notice_num) throws Exception {
    return dao.viewNotice(notice_num);
  }

  // 공지사항 수정
  @Override
  public void modifyNotice(AdminInfoDTO dto) throws Exception {
    dao.modifyNotice(dto);
  }

  // FAQ 총 갯수
  @Override
  public int countFAQ(AdminInfoDTO dto) throws Exception {
    return dao.countFAQ(dto);
  }

  // FAQ 목록
  @Override
  public List<AdminInfoDTO> faqlistPage(int displayPost, int postNum, AdminInfoDTO dto) throws Exception {
    return dao.faqlistPage(displayPost, postNum, dto);
  }

  // FAQ 작성
  @Override
  public void writeFAQ(AdminInfoDTO dto) throws Exception {
    dao.writeFAQ(dto);
  }

  // FAQ 삭제
  @Override
  public void deleteFAQ(AdminInfoDTO dto) throws Exception {
    dao.deleteFAQ(dto);
  }
  
// FAQ 수정(내용 불러오기)
 @Override
 public AdminInfoDTO viewFAQ(int faq_num) throws Exception {
   return dao.viewFAQ(faq_num);
 }

 // FAQ 수정
 @Override
 public void modifyFAQ(AdminInfoDTO dto) throws Exception {
   dao.modifyFAQ(dto);
 }
}

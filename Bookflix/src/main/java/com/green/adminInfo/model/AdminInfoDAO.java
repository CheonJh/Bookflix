package com.green.adminInfo.model;

import java.util.List;

import com.green.adminInfo.domain.AdminInfoDTO;

public interface AdminInfoDAO {

  // 공지사항 총 갯수
  public int countNotice(AdminInfoDTO dto) throws Exception;

  // 공지사항 목록
  public List<AdminInfoDTO> noticelistPage(int displayPost, int postNum, AdminInfoDTO dto) throws Exception;

  // 공지사항 작성
  public void writeNotice(AdminInfoDTO dto) throws Exception;

  // 공지사항 삭제
  public void deleteNotice(AdminInfoDTO dto) throws Exception;

  // 공지사항 수정(내용 불러오기)
  public AdminInfoDTO viewNotice(int notice_num) throws Exception;

  // 공지사항 수정
  public void modifyNotice(AdminInfoDTO dto) throws Exception;

  // FAQ 총 갯수
  public int countFAQ(AdminInfoDTO dto) throws Exception;

  // FAQ 목록
  public List<AdminInfoDTO> faqlistPage(int displayPost, int postNum, AdminInfoDTO dto) throws Exception;

  // FAQ 작성
  public void writeFAQ(AdminInfoDTO dto) throws Exception;
  
  // FAQ 삭제
  public void deleteFAQ(AdminInfoDTO dto) throws Exception;

  // FAQ 수정(내용 불러오기)
  public AdminInfoDTO viewFAQ(int faq_num) throws Exception;

  // FAQ 수정
  public void modifyFAQ(AdminInfoDTO dto) throws Exception;
}

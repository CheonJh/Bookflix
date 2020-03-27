package com.green.adminInfo.service;

import java.util.List;

import com.green.adminInfo.domain.AdminInfoDTO;


public interface AdminInfoService {

  // 공지사항 총 갯수
  public int count(AdminInfoDTO dto) throws Exception;

  // 공지사항 목록
  public List<AdminInfoDTO> listPage(int displayPost, int postNum, AdminInfoDTO dto) throws Exception;

  // 공지사항 작성
  public void write(AdminInfoDTO dto) throws Exception;

  // 공지사항 삭제
  public void deleteNotice(AdminInfoDTO dto) throws Exception;

  // 공지사항 수정(내용 불러오기)
  public AdminInfoDTO view(int notice_num) throws Exception;

  // 공지사항 수정
  public void modify(AdminInfoDTO dto) throws Exception;

}

package com.green.adminInfo.model;

import java.util.List;

import com.green.adminInfo.domain.AdminInfoDTO;

public interface AdminInfoDAO {
  
  //공지사항 총 갯수
  public int count() throws Exception;
  
  //공지사항 목록
  public List listPage(int displayPost, int postNum) throws Exception;
  
  //공지사항 작성
  public void write(AdminInfoDTO dto) throws Exception;
}

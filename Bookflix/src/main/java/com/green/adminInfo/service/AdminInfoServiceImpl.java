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
  public int count(AdminInfoDTO dto) throws Exception {
    return dao.count(dto);
  }

  // 공지사항 목록

  @Override
  public List<AdminInfoDTO> listPage(int displayPost, int postNum, AdminInfoDTO dto) throws Exception {
    return dao.listPage(displayPost, postNum, dto);
  }

  // 공지사항 작성
  @Override
  public void write(AdminInfoDTO dto) throws Exception {
    dao.write(dto);
  }

  // 공지사항 삭제
  @Override
  public void deleteNotice(AdminInfoDTO dto) throws Exception {
    dao.deleteNotice(dto);
  }

  // 공지사항 수정(내용 불러오기)
  @Override
  public AdminInfoDTO view(int notice_num) throws Exception {
    return dao.view(notice_num);
  }

  // 공지사항 수정
  @Override
  public void modify(AdminInfoDTO dto) throws Exception {
    dao.modify(dto);
  }

}

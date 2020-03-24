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
  public int count() throws Exception {
    return dao.count();
  }

  // 공지사항 목록
  @Override
  public List listPage(int displayPost, int postNum) throws Exception {
    return dao.listPage(displayPost, postNum);
  }

  // 공지사항 작성
  @Override
  public void write(AdminInfoDTO dto) throws Exception {
    dao.write(dto);

  }

}

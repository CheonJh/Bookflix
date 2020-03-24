package com.green.adminBook.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.green.adminBook.domain.AdminBookDTO;
import com.green.adminBook.model.AdminBookDAO;

@Repository
public class AdminBookServiceImpl implements AdminBookService {
  
  @Inject
  private AdminBookDAO dao;
  
  @Override
  public List adminBookList(int displayPost, int postNum) throws Exception {
    return dao.adminBookList(displayPost, postNum);
  }
  
  @Override
  public int adminBookCount() throws Exception {
    return dao.adminBookCount();
  }

  @Override
  public void adminBookReg(AdminBookDTO DTO) throws Exception {
    dao.adminBookReg(DTO);
  }




}

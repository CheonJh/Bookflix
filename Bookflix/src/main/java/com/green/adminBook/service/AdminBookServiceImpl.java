package com.green.adminBook.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.green.adminBook.domain.AdminBookDTO;
import com.green.adminBook.model.AdminBookDAO;
import com.green.util.Search;

@Repository
public class AdminBookServiceImpl implements AdminBookService {
  
  @Inject
  private AdminBookDAO dao;
  
  @Override
  public List adminBookList(Search search) throws Exception {
    return dao.adminBookList(search);
  }
  
  @Override
  public int adminBookCount(Search search) throws Exception {
    return dao.adminBookCount(search);
  }

  @Override
  public void adminBookReg(AdminBookDTO DTO) throws Exception {
    dao.adminBookReg(DTO);
  }

  @Override
  public AdminBookDTO adminBookView(int e_book_num) throws Exception {
    return dao.adminBookView(e_book_num);
  }

  @Override
  public void adminBookModify(AdminBookDTO DTO) throws Exception {
    dao.adminBookModify(DTO);
  }

  @Override
  public void adminBookDelete(AdminBookDTO DTO) throws Exception {
    dao.adminBookDelete(DTO);
  }

}

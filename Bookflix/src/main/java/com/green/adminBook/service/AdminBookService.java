package com.green.adminBook.service;

import java.util.List;

import com.green.adminBook.domain.AdminBookDTO;

public interface AdminBookService {
  
  public List adminBookList(int displayPost, int postNum) throws Exception;
    
  public int adminBookCount() throws Exception;
  
  public void adminBookReg(AdminBookDTO DTO) throws Exception;


}
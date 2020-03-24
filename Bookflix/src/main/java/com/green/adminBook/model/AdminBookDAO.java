package com.green.adminBook.model;

import java.util.List;

import com.green.adminBook.domain.AdminBookDTO;

public interface AdminBookDAO {
    
  public int adminBookCount() throws Exception;
  
  public List adminBookList(int displayPost, int postNum) throws Exception;
  
  public void adminBookReg(AdminBookDTO DTO) throws Exception;
  
}

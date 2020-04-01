package com.green.adminBook.model;

import java.util.List;

import com.green.adminBook.domain.AdminBookDTO;
import com.green.util.Search;

public interface AdminBookDAO {
  
  public List adminBookList(Search search) throws Exception;
    
  public int adminBookCount(Search search) throws Exception;
  
  public void adminBookReg(AdminBookDTO DTO) throws Exception;
  
  public AdminBookDTO adminBookView(int e_book_num) throws Exception;
  
  public void adminBookModify(AdminBookDTO DTO) throws Exception;
  
  public void adminBookDelete(AdminBookDTO DTO) throws Exception;

  
}
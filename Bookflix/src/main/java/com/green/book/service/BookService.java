package com.green.book.service;

import com.green.book.domain.BookDTO;


public interface BookService {  
  
  public BookDTO book(Integer e_book_num) throws Exception;
}

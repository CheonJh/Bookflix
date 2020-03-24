package com.green.book.model;

import com.green.book.domain.BookDTO;

public interface BookDAO {

 public BookDTO book(Integer e_book_num) throws Exception; 

}
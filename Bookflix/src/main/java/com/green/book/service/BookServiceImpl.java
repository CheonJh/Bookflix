package com.green.book.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.book.model.BookDAO;
import com.green.book.domain.BookDTO;

@Service
public class BookServiceImpl implements BookService {

  @Inject
  private BookDAO bookDao;
  
  @Override
  public BookDTO book(Integer e_book_num) throws Exception {

    return bookDao.book(e_book_num);
  }

}

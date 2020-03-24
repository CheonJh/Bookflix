package com.green.book.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.book.domain.BookDTO;
import com.green.book.service.BookService;

@Controller
@RequestMapping("/book/*")
public class BookController {
  
  @Inject
  private BookService service;
  
  @RequestMapping(value = "/book", method = RequestMethod.GET)
  public void getBook(@RequestParam("e_book_num") int e_book_num, Model model) 
      throws Exception {
     BookDTO bookDTO = service.book(e_book_num);
     
     model.addAttribute("book", bookDTO);
  }
}

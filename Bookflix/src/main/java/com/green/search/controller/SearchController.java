package com.green.search.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.book.domain.BookDTO;
import com.green.member.controller.MemberController;
import com.green.search.service.SearchService;

/**
 * @author 천재헌
 * @since 2020.03.27
 *
 *        search 관련 url 컨트롤러
 */
@Controller
@RequestMapping("/search/*")
public class SearchController {

  // 로깅을 위한 변수
  private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

  // 서비스
  @Inject
  SearchService service;

  // 1-1) 검색페이지
  @RequestMapping(value = "/search", method = RequestMethod.GET)
  public void getSearch() throws Exception {
    logger.info("get search");
  }
  
  // 1-2) 검색페이지 검색
  @RequestMapping(value="/search", method=RequestMethod.POST)
  public void postSearch(@RequestParam("searchKeyword")String keyword, Model model) throws Exception{
    logger.info("post search");
    
    // 키워드 넣은 값으로 검색한 책 정보들 불러와서 리스트에 넣고
    List<BookDTO> bookList = service.searchBookList(keyword);
    
    // 가져온 책 리스트 넘겨
    model.addAttribute(bookList);
    model.addAttribute(keyword);
        
  }
  
  // 1-3) 검색페이지 검색 - AJAX
  

}

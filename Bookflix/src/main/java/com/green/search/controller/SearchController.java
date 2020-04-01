package com.green.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.adminBook.domain.AdminBookDTO;
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
  private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

  // 서비스
  @Inject
  SearchService service;
  
  // 책 페이지네이션
  public static final int ROWSIZE = 4; // test: 4, 나중에 더미데이터 늘리고 16개씩으로 변환
  public static int startRow = 0; // 시작 로우 값

  // 1-1) 검색페이지 - 기본 전체 책 리스트 
  @RequestMapping(value = "/search", method = RequestMethod.GET)
  public void getSearch(@RequestParam(required=false) String keyword, Model model) throws Exception {
    logger.info("get search");
    
    // 전체 책 리스트 로드
    List<AdminBookDTO> bookList = service.BookList();
    
    // List<AdminBookDTO> searchList = service.searchBookList(keyword, startRow, ROWSIZE);
    
    model.addAttribute("bookList", bookList);
  }
  
  // 1-2) 검색페이지 - 키워드 검색
  @RequestMapping(value="/search", method=RequestMethod.POST)
  public void postSearch(@RequestParam("searchKeyword")String keyword, Model model) throws Exception{
    logger.info("post search");
    
    startRow = 0;
    
    // 키워드 넣은 값으로 검색한 책 정보들 불러와서 리스트에 넣고
    List<AdminBookDTO> searchList = service.searchBookList(keyword, startRow, ROWSIZE);
    
    // 가져온 책 리스트 넘겨
    model.addAttribute("searchList", searchList);
    model.addAttribute("keyword", keyword);
    
    startRow = ROWSIZE;
        
  }
  
  // 1-3) 검색페이지 검색 - AJAX
  @RequestMapping(value="/search2", method=RequestMethod.POST, produces = "application/text; charset=utf8")
  @ResponseBody
  public List<AdminBookDTO> ajaxSearch(@RequestParam(required=false)String keyword, HttpSession session, Model model) throws Exception{
    logger.info("ajax search");

    // 시작 사이즈가 같으면 페이지 처음 들어온거니까 세션 초기화
    if (SearchController.startRow == SearchController.ROWSIZE) {
      session.setAttribute("searchStartRow", SearchController.startRow);
    }
    // 세션에 올려논 현재 개수 받고
    int startRow =(Integer)session.getAttribute("searchStartRow");
    // 목록 리스트에 담고
    List<AdminBookDTO> searchList = service.searchBookList(keyword, SearchController.startRow, ROWSIZE);
    
    SearchController.startRow = startRow+SearchController.ROWSIZE;
    session.setAttribute("searchStartRow", startRow+SearchController.ROWSIZE);
    
    return searchList;
  }
  
/*  
 * @RequestMapping(value="/search2", method=RequestMethod.POST, produces = "application/text; charset=utf8")
  @ResponseBody
  public ResponseEntity<List<AdminBookDTO>> ajaxSearch(@RequestParam(required=false)String keyword, HttpSession session, Model model) throws Exception{
    logger.info("ajax search");
    
    ResponseEntity<List<AdminBookDTO>> entity = null;
    
    // 시작 사이즈가 같으면 페이지 처음 들어온거니까 세션 초기화
    if (SearchController.startRow == SearchController.ROWSIZE) {
      session.setAttribute("searchStartRow", SearchController.startRow);
    }
    
    int startRow =(Integer)session.getAttribute("searchStartRow");
    
    // 가져온 책 리스트 넘겨
     Map<String, Object> searchMap = new HashMap<String, Object>();
    
    searchMap.put("searchList", searchList);
    searchMap.put("code", "OK");
    try {
      List<AdminBookDTO> searchList = service.searchBookList(keyword, SearchController.startRow, ROWSIZE);
      entity = new ResponseEntity<>(searchList,HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    SearchController.startRow = startRow+SearchController.ROWSIZE;
    session.setAttribute("searchStartRow", startRow+SearchController.ROWSIZE);
    
    return entity;
  }
*/
}

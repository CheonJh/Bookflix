package com.green.adminBook.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.adminBook.service.AdminBookService;
import com.green.adminBook.domain.AdminBookDTO;

@Controller
@RequestMapping("/adminBook/*")

public class AdminBookController {
  @Inject
  AdminBookService service;
  
  @RequestMapping(value="/adminBookList", method=RequestMethod.GET)
  public void getAdminBookList(Model model, @RequestParam(defaultValue="1") int num) throws Exception {
    //디폴트 값을 줘야만 움직임?
    int count = service.adminBookCount(); //총 게시물 숫자
    
    int postNum = 10; //sql에서 지정한 한 페이지에 표시될 게시물 숫자
    
    int pageNum = (int)Math.ceil((double)count/postNum); //총 페이징 갯수
    
    int displayPost= (num-1)*postNum; //sql에서 지정하는 페이지 게시물 번호
    
    int pageNum_cnt = 10; // 표시될 페이징 갯수
        
    int endPageNum = (int)Math.ceil( (double)num/(double)pageNum_cnt)*pageNum_cnt; //표시되는 번호중 마지막 번호
    
    int startPageNum = endPageNum - (pageNum_cnt -1); //한 페이징에서 표시되는 번호중 첫번쨰
    
    int endPageNum_tmp = (int)Math.ceil( (double)count / (double)pageNum_cnt );
        
    if(endPageNum > endPageNum_tmp) {
      endPageNum = endPageNum_tmp;
    }
    
    boolean prev = startPageNum == 1 ? false : true ; 
    //삼항 연산자 페이지네이션 시작페이지가 1과 같다면 false반환
    boolean next = endPageNum *pageNum_cnt >= count ? false : true;
    //공식을 모르겠다
    //페이지네이션 마지막 페이지 * 표시되는 페이징 값이 총 게시물수와 크거나 같다면 false 반환
    
    
    List list = null;
    
    list=service.adminBookList(displayPost, postNum);
    model.addAttribute("list", list);
    model.addAttribute("pageNum", pageNum);
    
    model.addAttribute("startPageNum", startPageNum);
    model.addAttribute("endPageNum", endPageNum);
    model.addAttribute("prev", prev);
    model.addAttribute("next", next);
    
    model.addAttribute("select", num);
  }

  @RequestMapping(value="/adminBookReg", method=RequestMethod.GET)
  public void getAdminBookReg() throws Exception {
    
  }
  
  @RequestMapping(value="/adminBookReg", method=RequestMethod.POST)
  public void postAdminBookReg(AdminBookDTO DTO) throws Exception {
    service.adminBookReg(DTO);
  }
  
  @RequestMapping(value="/adminBookMod", method=RequestMethod.GET)
  public void getAdminBookMod() throws Exception {
    
  }
  
  
  
}
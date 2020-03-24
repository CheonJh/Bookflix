package com.green.myPage.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.green.myPage.domain.myPageDTO;
import com.green.myPage.service.myPageService;

@Controller
@RequestMapping("/myPage/*")
public class myPageController {

  @Inject
  myPageService service;
  
  @RequestMapping(value="/mylib", method = RequestMethod.GET)
  public void getList1(Model model) throws Exception {
    
    //읽은 도서 목록
    List<myPageDTO> list1 = null;
    list1 = service.list1();
    
    model.addAttribute("list1", list1);
    
    //찜한 도서 목록
    List<myPageDTO> list2 = null;
    list2 = service.list2();
    
    model.addAttribute("list2", list2);
    
    //좋아요 한 도서 목록
    List<myPageDTO> list3 = null;
    list3 = service.list3();
    
    model.addAttribute("list3", list3);
  }
  
    //구독 잔여일
    @RequestMapping(value = "/Page", method = RequestMethod.GET)
    public void getPage(Model model) throws Exception {
      
      int date;
      
      date = service.date();
      
      model.addAttribute("date", date);
    }
}

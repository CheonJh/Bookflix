package com.green.myPage.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.green.member.domain.MemberDTO;
import com.green.myPage.domain.myPageDTO;
import com.green.myPage.service.myPageService;

@Controller
@RequestMapping("/myPage/*")
public class myPageController {

  @Inject
  myPageService service;
  
  @RequestMapping(value="/mylib", method = RequestMethod.GET)
  public void getList1(Model model, HttpServletRequest rq) throws Exception {
    
    HttpSession session = rq.getSession();
    
    MemberDTO dto = (MemberDTO)session.getAttribute("member");
    
    int member_num = dto.getMember_num();
    
    System.out.println("멤버넘"+member_num);
    
    //읽은 도서 목록
    List<myPageDTO> list1 = null;
    list1 = service.list1(member_num);
    
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
}

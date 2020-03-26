package com.green.myPage.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.member.domain.MemberDTO;
import com.green.myPage.domain.myPageDTO;
import com.green.myPage.service.myPageService;

@Controller
@RequestMapping("/myPage/*")
public class myPageController {

  @Inject
  myPageService service;

  
  @RequestMapping(value = "/mylib", method = RequestMethod.GET)
  public void getList1(Model model, HttpSession session) throws Exception {

    MemberDTO dto = (MemberDTO)session.getAttribute("member");
    
    int member_num = dto.getMember_num();

    // 읽은 도서 목록
    List<myPageDTO> list1 = null;
    list1 = service.list1(member_num);

    model.addAttribute("list1", list1);

    // 찜한 도서 목록
    List<myPageDTO> list2 = null;
    list2 = service.list2(member_num);

    model.addAttribute("list2", list2);

    // 좋아요 한 도서 목록
    List<myPageDTO> list3 = null;
    list3 = service.list3(member_num);

    model.addAttribute("list3", list3);

  }
  
  //구독 내역 보기
  @RequestMapping(value = "/sub", method = RequestMethod.GET)
  public void getList4(Model model, HttpSession session) throws Exception {
    
    MemberDTO dto = (MemberDTO)session.getAttribute("member");
    
    int member_num = dto.getMember_num();
    
    // 구독 내역 보기
    List<myPageDTO> list4 = null;
    list4 = service.list4(member_num);

    model.addAttribute("list4", list4);
  }
  
  // 구독 잔여일
  @RequestMapping(value = "/Page", method = RequestMethod.GET)
  public void getPage(Model model, HttpSession session) throws Exception {

    MemberDTO dto = (MemberDTO)session.getAttribute("member");
    
    if (dto.getMember_grade()==2) {
      int member_num = dto.getMember_num();
      int date;
      date = service.date(member_num);
      model.addAttribute("date", date);
    }
  }
  
  // 구독 하기 
  @ResponseBody
  @RequestMapping(value = "/doSub", method = RequestMethod.GET)
  public void getSub(Model model, HttpSession session) throws Exception {
    
    MemberDTO dto = (MemberDTO)session.getAttribute("member");
    
    int member_num = dto.getMember_num();
    
    service.sub1(member_num);
    service.sub2(member_num);
    
    dto.setMember_grade(2);
    
    session.setAttribute("member", dto);
    
//   return "redirect:/myPage/Page";
  }
  
  // 구독 해지
  @ResponseBody
  @RequestMapping(value = "/unSub", method = RequestMethod.GET)
  public void getunSub(Model model, HttpSession session) throws Exception {
    
    MemberDTO dto = (MemberDTO)session.getAttribute("member");
    
    int member_num = dto.getMember_num();
    
    service.sub3(member_num);
    
    
    dto.setMember_grade(1);
    
    session.setAttribute("member", dto);
  }
}

package com.green.myPage.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.green.member.domain.MemberDTO;
import com.green.myPage.domain.myPageDTO;
import com.green.myPage.service.myPageService;
import com.green.util.fileUpload;

@Controller
@RequestMapping("/myPage/*")
public class myPageController {

  @Inject
  myPageService service;
  
  @Resource(name="uploadPath2")
  private String uploadPath;
  
  @RequestMapping(value = "/mylib", method = RequestMethod.GET)
  public void getList1(Model model, HttpSession session) throws Exception {

    MemberDTO dto = (MemberDTO)session.getAttribute("member");
    
    int member_num = dto.getMember_num();

    String ab = dto.getMember_img();
    
    if (ab == null) {
      model.addAttribute("ab",0);
    } else {
      model.addAttribute("ab",1);
      
    }
/*    
    dto.setMember_img(ab);
    session.setAttribute("member_img", ab);*/
    
    
    // 읽은 도서 목록
    List<myPageDTO> list1 = null;
    list1 = service.list1(member_num);
    
    if (list1.isEmpty()) {
      model.addAttribute("tt1",0);
    } else {
      model.addAttribute("tt1",1);
    }
    
    model.addAttribute("list1", list1);

    // 찜한 도서 목록
    List<myPageDTO> list2 = null;
    list2 = service.list2(member_num);
    
    if (list2.isEmpty()) {
      model.addAttribute("tt2",0);
    } else {
      model.addAttribute("tt2",1);
    }

    model.addAttribute("list2", list2);

    // 좋아요 한 도서 목록
    List<myPageDTO> list3 = null;
    list3 = service.list3(member_num);
    
    if (list3.isEmpty()) {
      model.addAttribute("tt3",0);
    } else {
      model.addAttribute("tt3",1);
    }

    model.addAttribute("list3", list3);

  }
  
  //구독 내역 보기
  @RequestMapping(value = "/sub", method = RequestMethod.GET)
  public void getList4(Model model, HttpSession session) throws Exception {
    
    MemberDTO dto = (MemberDTO)session.getAttribute("member");
    
    int member_num = dto.getMember_num();
    
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
  
  //파일 업로드
  @RequestMapping(value = "/mylib", method = RequestMethod.POST)
  public String postList1(MemberDTO dto, Model model, MultipartFile file, HttpSession session) throws Exception {
    
    String imguploadPath = uploadPath + File.separator;
    String filename = null;
    
    if (file != null) {
      filename = fileUpload.fileupload(imguploadPath, file.getOriginalFilename(), file.getBytes());
    } else {
      filename = uploadPath + File.separator + "images" + File.separator + "none.png";
    }
    
    // 세션
    MemberDTO member = (MemberDTO)session.getAttribute("member");
    int member_num = member.getMember_num();
    
    dto.setMember_img(filename);
    dto.setMember_num(member_num);
    
    member.setMember_img(filename);
    
    service.file(dto);
    session.setAttribute("member", member);
    
    return "redirect:/myPage/mylib";
  }
}

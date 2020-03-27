package com.green.adminInfo.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.adminInfo.domain.AdminInfoDTO;
import com.green.adminInfo.service.AdminInfoService;

@Controller
@RequestMapping("/adminInfo/*")
public class AdminInfoController {

  @Inject
  private AdminInfoService service;

  // 공지사항 목록
  @RequestMapping(value = "/admNoticeList", method = RequestMethod.GET)
  public void getAdmNoticeList(Model model, @RequestParam(defaultValue = "1") int num,
      @RequestParam(required = false, defaultValue = "title") String searchType
      , @RequestParam(required = false) String keyword,@ModelAttribute("AdminInfoDTO") AdminInfoDTO dto
  ) throws Exception {
    
    dto.setSearchType(searchType);
    dto.setKeyword(keyword);
    
    // 게시물 총 갯수
    int count = service.count(dto);

    // 한 페이지에 출력할 게시물 갯수
    int postNum = 10;

    // 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
    int pageNum = (int) Math.ceil((double) count / postNum);

    // 출력할 게시물
    int displayPost = (num - 1) * postNum;

    // 한번에 표시할 페이징 번호의 갯수
    int pageNum_cnt = 10;

    // 표시되는 페이지 번호 중 마지막 번호
    int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt)) * pageNum_cnt;

    // 표시되는 페이지 번호 중 첫 번호
    int startPageNum = (endPageNum - pageNum_cnt) + 1;

    // 마지막 번호 재계산
    int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

    if (endPageNum_tmp < endPageNum) {
      endPageNum = endPageNum_tmp;
    }

    boolean prev = startPageNum == 1 ? false : true;
    boolean next = endPageNum * pageNum_cnt >= count ? false : true;

    // 시작 및 끝 번호
    model.addAttribute("startPageNum", startPageNum);
    model.addAttribute("endPageNum", endPageNum);

    // 이전 및 다음
    model.addAttribute("prev", prev);
    model.addAttribute("next", next);

    // 현재 페이지
    model.addAttribute("select", num);

    List<AdminInfoDTO> list = null;
    list = service.listPage(displayPost, postNum, dto);
    model.addAttribute("list", list);
    model.addAttribute("pageNum", pageNum);
    model.addAttribute("count",count);
    
    String kw = dto.getKeyword();
    String st = dto.getSearchType();

    model.addAttribute("kw",kw);
    model.addAttribute("st",st);
    
    
  }

  // 공지사항 작성
  @RequestMapping(value = "/admNoticeReg", method = RequestMethod.GET)
  public void getAdmNoticeReg() throws Exception {

  }

  // 공지사항 작성
  @RequestMapping(value = "/admNoticeReg", method = RequestMethod.POST)
  public String postWrite(AdminInfoDTO dto) throws Exception {
    service.write(dto);

    return "redirect:/adminInfo/admNoticeList";
  }

  // 공지사항 삭제
  @ResponseBody
  @RequestMapping(value = "/deleteNotice", method = RequestMethod.POST)
  public void deleteNotice(@RequestParam(value = "chbox[]") List<String> chArr, AdminInfoDTO dto) throws Exception {

    int noticeNum = 0;

    for (String i : chArr) {
      noticeNum = Integer.parseInt(i);
      dto.setNotice_num(noticeNum);
      service.deleteNotice(dto);
    }
  }

  // 공지사항 수정(내용 불러오기)
  @RequestMapping(value = "/admNoticeMod", method = RequestMethod.GET)
  public void getAdmNoticeMod(@RequestParam("notice_num") int notice_num, Model model) throws Exception {

    AdminInfoDTO dto = service.view(notice_num);

    model.addAttribute("view", dto);
  }

  // 공지사항 수정
  @RequestMapping(value = "/admNoticeMod", method = RequestMethod.POST)
  public String postAdmNoticeMod(AdminInfoDTO dto) throws Exception {

    service.modify(dto);

    return "redirect:/adminInfo/admNoticeList";
  }
}

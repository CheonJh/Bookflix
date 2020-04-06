package com.green.info.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.info.domain.InfoFaqDTO;
import com.green.info.domain.InfoNoticeDTO;
import com.green.info.service.InfoService;

@Controller
@RequestMapping("/info/*")
public class InfoController {

  @Inject
  InfoService service;
  
  @RequestMapping(value = "/notiList", method = RequestMethod.GET)
  public void getNotiList(Model model)throws Exception{
    
    List<InfoNoticeDTO> notiList = null;
    notiList = service.notiList();
    model.addAttribute("notiList", notiList);
  }
  
  @RequestMapping(value = "/notiList2", method = RequestMethod.GET)
  public void getNotiList2(Model model)throws Exception{
    
    List<InfoNoticeDTO> notiList2 = null;
    notiList2 = service.notiList2();
    model.addAttribute("notiList2", notiList2);
  }
  
  @RequestMapping(value = "/notiList3", method = RequestMethod.GET)
  public void getNotiList3(Model model)throws Exception{
    
    List<InfoNoticeDTO> notiList3 = null;
    notiList3 = service.notiList3();
    model.addAttribute("notiList3", notiList3);
  }
  
  @RequestMapping(value = "/notiList4", method = RequestMethod.GET)
  public void getNotiList4(Model model)throws Exception{
    
    List<InfoNoticeDTO> notiList4 = null;
    notiList4 = service.notiList4();
    model.addAttribute("notiList4", notiList4);
  }
  
  @RequestMapping(value = "/FaqList", method = RequestMethod.GET)
  public void getFaqList(Model model)throws Exception{
    
    List<InfoFaqDTO> FaqList = null;
    FaqList = service.FaqList();
    model.addAttribute("FaqList", FaqList);
  }
  @RequestMapping(value = "/FaqList2", method = RequestMethod.GET)
  public void getFaqList2(Model model)throws Exception{
    
    List<InfoFaqDTO> FaqList2 = null;
    FaqList2 = service.FaqList2();
    model.addAttribute("FaqList2", FaqList2);
  }
  @RequestMapping(value = "/FaqList3", method = RequestMethod.GET)
  public void getFaqList3(Model model)throws Exception{
    
    List<InfoFaqDTO> FaqList3 = null;
    FaqList3 = service.FaqList3();
    model.addAttribute("FaqList3", FaqList3);
  }
  @RequestMapping(value = "/FaqList4", method = RequestMethod.GET)
  public void getFaqList4(Model model)throws Exception{
    
    List<InfoFaqDTO> FaqList4 = null;
    FaqList4 = service.FaqList4();
    model.addAttribute("FaqList4", FaqList4);
  }
  
  //조회수 증가
  @RequestMapping(value = "/viewCnt", method = RequestMethod.GET)
  public String getViewCnt(@RequestParam("notice_num") int notice_num) throws Exception {
    service.viewCnt(notice_num);
    return "redirect:/info/notice?notice_num=" + notice_num;
  }

  @RequestMapping(value = "/notice", method = RequestMethod.GET)
  public void getNotice(@RequestParam("notice_num") int notice_num, Model model) throws Exception {
    // 공지사항 상세 조회
    InfoNoticeDTO dto = service.notice(notice_num);

    model.addAttribute("notice", dto);
  }

  @RequestMapping(value = "/FAQ", method = RequestMethod.GET)
  public void getFaq(@RequestParam("faq_num") int faq_num, Model model) throws Exception {
    // FAQ 상세 조회
    InfoFaqDTO dto = service.FAQ(faq_num);

    model.addAttribute("FAQ", dto);
  }

  @RequestMapping(value = "/noticeList", method = RequestMethod.GET)
  public void getNoticePage(Model model, @RequestParam("num") int num) throws Exception {
    // 페이지네이션
    int count = service.notiCount();

    int postNum = 10;

    int pageNum = (int) Math.ceil((double) count / postNum);

    int displayPost = (num - 1) * postNum;

    int pageNum_cnt = 10;

    int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

    int startPageNum = endPageNum - (pageNum_cnt - 1);

    int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

    if (endPageNum > endPageNum_tmp) {
      endPageNum = endPageNum_tmp;
    }

    boolean prev = startPageNum == 1 ? false : true;
    boolean next = endPageNum * pageNum_cnt >= count ? false : true;

    List<InfoNoticeDTO> notiList = null;
    notiList = service.noticePage(displayPost, postNum);
    model.addAttribute("notiList", notiList);
    model.addAttribute("pageNum", pageNum);

    model.addAttribute("startPageNum", startPageNum);
    model.addAttribute("endPageNum", endPageNum);

    model.addAttribute("prev", prev);
    model.addAttribute("next", next);

    model.addAttribute("select", num);
    
  }
  
  @RequestMapping(value = "/noticeList2", method = RequestMethod.GET)
  public void getNoticePage2(Model model, @RequestParam("num") int num) throws Exception {
    // 페이지네이션
    int count = service.notiCount2();

    int postNum = 10;

    int pageNum = (int) Math.ceil((double) count / postNum);

    int displayPost = (num - 1) * postNum;

    int pageNum_cnt = 10;

    int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

    int startPageNum = endPageNum - (pageNum_cnt - 1);

    int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

    if (endPageNum > endPageNum_tmp) {
      endPageNum = endPageNum_tmp;
    }

    boolean prev = startPageNum == 1 ? false : true;
    boolean next = endPageNum * pageNum_cnt >= count ? false : true;

    List<InfoNoticeDTO> notiList2 = null;
    notiList2 = service.noticePage2(displayPost, postNum);
    model.addAttribute("notiList2", notiList2);
    model.addAttribute("pageNum", pageNum);

    model.addAttribute("startPageNum", startPageNum);
    model.addAttribute("endPageNum", endPageNum);

    model.addAttribute("prev", prev);
    model.addAttribute("next", next);

    model.addAttribute("select", num);
    
  }

  @RequestMapping(value = "/noticeList3", method = RequestMethod.GET)
  public void getNoticePage3(Model model, @RequestParam("num") int num) throws Exception {
    // 페이지네이션
    int count = service.notiCount3();

    int postNum = 10;

    int pageNum = (int) Math.ceil((double) count / postNum);

    int displayPost = (num - 1) * postNum;

    int pageNum_cnt = 10;

    int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

    int startPageNum = endPageNum - (pageNum_cnt - 1);

    int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

    if (endPageNum > endPageNum_tmp) {
      endPageNum = endPageNum_tmp;
    }

    boolean prev = startPageNum == 1 ? false : true;
    boolean next = endPageNum * pageNum_cnt >= count ? false : true;

    List<InfoNoticeDTO> notiList3 = null;
    notiList3 = service.noticePage3(displayPost, postNum);
    model.addAttribute("notiList3", notiList3);
    model.addAttribute("pageNum", pageNum);

    model.addAttribute("startPageNum", startPageNum);
    model.addAttribute("endPageNum", endPageNum);

    model.addAttribute("prev", prev);
    model.addAttribute("next", next);

    model.addAttribute("select", num);

  }

  @RequestMapping(value = "/noticeList4", method = RequestMethod.GET)
  public void getNoticePage4(Model model, @RequestParam("num") int num) throws Exception {
    // 페이지네이션
    int count = service.notiCount4();

    int postNum = 10;

    int pageNum = (int) Math.ceil((double) count / postNum);

    int displayPost = (num - 1) * postNum;

    int pageNum_cnt = 10;

    int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

    int startPageNum = endPageNum - (pageNum_cnt - 1);

    int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

    if (endPageNum > endPageNum_tmp) {
      endPageNum = endPageNum_tmp;
    }

    boolean prev = startPageNum == 1 ? false : true;
    boolean next = endPageNum * pageNum_cnt >= count ? false : true;
    
    List<InfoNoticeDTO> notiList4 = null;
    notiList4 = service.noticePage4(displayPost, postNum);
    model.addAttribute("notiList4", notiList4);
    model.addAttribute("pageNum", pageNum);

    model.addAttribute("startPageNum", startPageNum);
    model.addAttribute("endPageNum", endPageNum);

    model.addAttribute("prev", prev);
    model.addAttribute("next", next);

    model.addAttribute("select", num);

  }
  //FAQ 페이지네이션
  @RequestMapping(value = "/FAQList", method = RequestMethod.GET)
  public void getFaqPage(Model model, @RequestParam("num") int num) throws Exception {
    
    int count = service.faqCount();

    int postNum = 10;

    int pageNum = (int) Math.ceil((double) count / postNum);

    int displayPost = (num - 1) * postNum;

    int pageNum_cnt = 10;

    int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

    int startPageNum = endPageNum - (pageNum_cnt - 1);

    int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

    if (endPageNum > endPageNum_tmp) {
      endPageNum = endPageNum_tmp;
    }

    boolean prev = startPageNum == 1 ? false : true;
    boolean next = endPageNum * pageNum_cnt >= count ? false : true;

    List<InfoFaqDTO> FaqList = null;
    FaqList = service.FaqPage(displayPost, postNum);
    model.addAttribute("FaqList", FaqList);
    model.addAttribute("pageNum", pageNum);

    model.addAttribute("startPageNum", startPageNum);
    model.addAttribute("endPageNum", endPageNum);

    model.addAttribute("prev", prev);
    model.addAttribute("next", next);

    model.addAttribute("select", num);

  }
  
  @RequestMapping(value = "/FAQList2", method = RequestMethod.GET)
  public void getFaqPage2(Model model, @RequestParam("num") int num) throws Exception {
    
    int count = service.faqCount2();

    int postNum = 10;

    int pageNum = (int) Math.ceil((double) count / postNum);

    int displayPost = (num - 1) * postNum;

    int pageNum_cnt = 10;

    int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

    int startPageNum = endPageNum - (pageNum_cnt - 1);

    int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

    if (endPageNum > endPageNum_tmp) {
      endPageNum = endPageNum_tmp;
    }

    boolean prev = startPageNum == 1 ? false : true;
    boolean next = endPageNum * pageNum_cnt >= count ? false : true;

    List<InfoFaqDTO> FaqList2 = null;
    FaqList2 = service.FaqPage2(displayPost, postNum);
    model.addAttribute("FaqList2", FaqList2);
    model.addAttribute("pageNum", pageNum);

    model.addAttribute("startPageNum", startPageNum);
    model.addAttribute("endPageNum", endPageNum);

    model.addAttribute("prev", prev);
    model.addAttribute("next", next);

    model.addAttribute("select", num);

  }
  
  @RequestMapping(value = "/FAQList3", method = RequestMethod.GET)
  public void getFaqPage3(Model model, @RequestParam("num") int num) throws Exception {
    
    int count = service.faqCount3();

    int postNum = 10;

    int pageNum = (int) Math.ceil((double) count / postNum);

    int displayPost = (num - 1) * postNum;

    int pageNum_cnt = 10;

    int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

    int startPageNum = endPageNum - (pageNum_cnt - 1);

    int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

    if (endPageNum > endPageNum_tmp) {
      endPageNum = endPageNum_tmp;
    }

    boolean prev = startPageNum == 1 ? false : true;
    boolean next = endPageNum * pageNum_cnt >= count ? false : true;

    List<InfoFaqDTO> FaqList3 = null;
    FaqList3 = service.FaqPage3(displayPost, postNum);
    model.addAttribute("FaqList3", FaqList3);
    model.addAttribute("pageNum", pageNum);

    model.addAttribute("startPageNum", startPageNum);
    model.addAttribute("endPageNum", endPageNum);

    model.addAttribute("prev", prev);
    model.addAttribute("next", next);

    model.addAttribute("select", num);

  }
  
  @RequestMapping(value = "/FAQList4", method = RequestMethod.GET)
  public void getFaqPage4(Model model, @RequestParam("num") int num) throws Exception {
    
    int count = service.faqCount4();

    int postNum = 10;

    int pageNum = (int) Math.ceil((double) count / postNum);

    int displayPost = (num - 1) * postNum;

    int pageNum_cnt = 10;

    int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

    int startPageNum = endPageNum - (pageNum_cnt - 1);

    int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

    if (endPageNum > endPageNum_tmp) {
      endPageNum = endPageNum_tmp;
    }

    boolean prev = startPageNum == 1 ? false : true;
    boolean next = endPageNum * pageNum_cnt >= count ? false : true;

    List<InfoFaqDTO> FaqList4 = null;
    FaqList4 = service.FaqPage4(displayPost, postNum);
    model.addAttribute("FaqList4", FaqList4);
    model.addAttribute("pageNum", pageNum);

    model.addAttribute("startPageNum", startPageNum);
    model.addAttribute("endPageNum", endPageNum);

    model.addAttribute("prev", prev);
    model.addAttribute("next", next);

    model.addAttribute("select", num);

  }

}

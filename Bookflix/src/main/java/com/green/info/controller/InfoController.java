package com.green.info.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.info.domain.InfoNoticeDTO;
import com.green.info.service.InfoService;

@Controller
@RequestMapping("/info/*")
public class InfoController {
  @Inject
  InfoService service;
  
 /* @RequestMapping(value="/noticeList",method=RequestMethod.GET)
  public void getList(Model model) throws Exception {
    
    List<InfoNoticeDTO> list = null;
    list = service.list();
    
    model.addAttribute("list", list);
  }*/
 @RequestMapping(value = "/notice", method = RequestMethod.GET)
  public void getNotice(@RequestParam("notice_num") int notice_num, Model model) throws Exception {
   
   InfoNoticeDTO dto = service.notice(notice_num);
   
   model.addAttribute("notice", dto);
    
  }
 
 @RequestMapping(value = "/noticeList", method = RequestMethod.GET)
 public void getNoticePage(Model model, @RequestParam("num") int num) throws Exception {
   
   int count = service.count();
   
   int postNum = 10;
   
   int pageNum = (int)Math.ceil((double)count/postNum);
   
   int displayPost = (num -1) * postNum;
   
   int pageNum_cnt = 10;
   
   int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
   
   int startPageNum = endPageNum - (pageNum_cnt -1);
   
   int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
   
   if(endPageNum > endPageNum_tmp) {
     endPageNum = endPageNum_tmp;
   }
   
   boolean prev = startPageNum == 1 ? false:true;
   boolean next = endPageNum * pageNum_cnt >= count ? false:true;
   
   List<InfoNoticeDTO> list = null;
   list = service.noticePage(displayPost, postNum);
   model.addAttribute("list", list);
   model.addAttribute("pageNum", pageNum);
   
   model.addAttribute("startPageNum", startPageNum);
   model.addAttribute("endPageNum", endPageNum);
   
   model.addAttribute("prev", prev);
   model.addAttribute("next", next);
   
   model.addAttribute("select", num);
   
 }
}

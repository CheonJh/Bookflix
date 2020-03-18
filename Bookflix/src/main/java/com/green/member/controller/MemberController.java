package com.green.member.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.member.service.MemberService;

/**
 * @author 천재헌
 * @since 2020.03.17
 * 
 * member 관련 url 컨트롤러
 */
@Controller
@RequestMapping("/member/*")
public class MemberController {
  // 로깅을 위한 변수
  private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
  
/*  @Inject
  MemberService memberService;*/
  
  // 1) 로그인 화면
  @RequestMapping("login.do")
  public String login() {
    return "member/login"; // views / member / login.jsp로 포워드
  }
  
}

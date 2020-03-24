package com.green.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.member.domain.MemberDTO;
import com.green.member.service.MemberService;

/**
 * @author 천재헌
 * @since 2020.03.17
 * 
 *        member 관련 url 컨트롤러
 */
@Controller
@RequestMapping("/member/*")
public class MemberController {

  // 로깅을 위한 변수
  private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

  // 서비스
  @Inject
  MemberService service;

  // 1-1) 회원가입 GET
  @RequestMapping(value = "/signIn", method = RequestMethod.GET)
  public void getRegister() throws Exception {
    logger.info("get register");
  }

  // 1-1) 회원가입 POST
  @RequestMapping(value = "/signIn", method = RequestMethod.POST)
  public String postRegister(MemberDTO dto) throws Exception {
    logger.info("post register");
    service.register(dto);
    return "redirect:/";
  }

  // 1-2) 회원가입시 이메일 중복 확인, AJAX
  @RequestMapping(value = "/idCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
  @ResponseBody
  // public int idCheck(@RequestParam("member_email") String member_email) throws
  // Exception{
  public String idCheck(HttpServletRequest rq) throws Exception {
    String member_email = rq.getParameter("member_email");
    int result = service.idCheck(member_email);
    return Integer.toString(result);
  }

  // 1-3) 회원가입시 닉네임 중복 확인, AJAX
  @RequestMapping(value = "/nickCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
  @ResponseBody
  public String nickCheck(HttpServletRequest rq) throws Exception {
    String member_nickname = rq.getParameter("member_nickname");
    int result = service.nickCheck(member_nickname);
    return Integer.toString(result);
  }

  // 2-1) 회원가입 GET
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public void getLogin() throws Exception {
    logger.info("get login");
  }
  
  // 2-2) 로그인
  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public String login(MemberDTO dto, HttpServletRequest rq, RedirectAttributes rttr) throws Exception {
    logger.info("login post");

    HttpSession session = rq.getSession();

    MemberDTO login = service.login(dto);

    String stay = "";
    if (login == null) {
      session.setAttribute("member", null);
      rttr.addFlashAttribute("msg", false);
      stay = "redirect:/member/login"; // 다시 로그인 페이지로
    } else {
      session.setAttribute("member", login);
      stay = "redirect:/"; // 메인으로 돌려
    }

    return stay; 
  }
  
  // 3) 로그아웃
  @RequestMapping(value="/logout", method=RequestMethod.GET)
  public String logout(HttpSession session) throws Exception{
    logger.info("logout get");
    
    session.invalidate(); // 세션 전체 해제
    return "redirect:/";
  }
  
}

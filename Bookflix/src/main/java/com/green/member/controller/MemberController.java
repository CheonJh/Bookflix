package com.green.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.member.domain.Email;
import com.green.member.domain.MemberDTO;
import com.green.member.service.MemberService;
import com.green.util.EmailSender;
 
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

  // 2-1) 로그인 GET
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public void getLogin() throws Exception {
    logger.info("get login");
  }

  // 2-2) 로그인
  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public String login(MemberDTO dto, HttpServletRequest rq, RedirectAttributes rttr) throws Exception {
    logger.info("login post");

    HttpSession session = rq.getSession();

    MemberDTO member = service.login(dto);

    String stay = "";

    // 가져온 멤버 확인
    if (member == null) { // 객체 확인
      session.setAttribute("member", null);
      rttr.addFlashAttribute("msg", false);
      stay = "redirect:/member/login";
    } else if (member.getMember_grade() == 0) { // 관리자 확인
      session.setAttribute("member", member);
      stay = "redirect:/adminInfo/admNoticeList";
    } else { // 그 외 회원
      session.setAttribute("member", member);
      stay = "redirect:/";
    }

    return stay;
  }

  // 3) 로그아웃
  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public String logout(HttpSession session) throws Exception {
    logger.info("logout get");

    session.invalidate(); // 세션 전체 해제
    return "redirect:/";
  }

  // 4-1) 회원탈퇴 - 구독 잔여일수
  @RequestMapping(value = "/signOut1", method = RequestMethod.GET)
  public void signOut1(Model model, HttpSession session) throws Exception {
    logger.info("get signOut1");

    MemberDTO dto = (MemberDTO) session.getAttribute("member");

    // 구독회원일 경우에만 구독 잔여일수를 가져와서 넘겨준다.
    if (dto.getMember_grade() == 2) {
      int member_num = dto.getMember_num();
      int date;
      date = service.signOut1(member_num);
      model.addAttribute("date", date);
    }

  }

  // 4-2) 회원탈퇴 - get
  @RequestMapping(value = "/signOut2", method = RequestMethod.GET)
  public void getSignOut2() throws Exception {
    logger.info("get signOut2");
  }

  // 4-3) 회원탈퇴 - post
  @RequestMapping(value = "/signOut2", method = RequestMethod.POST)
  public String postSignOut2(HttpSession session) throws Exception {
    logger.info("post signOut2");

    // 회원 삭제
    service.signOut2(((MemberDTO) session.getAttribute("member")).getMember_num());
    // 세션 제거
    session.invalidate();

    return "redirect:/";
  }

  // 5-1) 회원정보 수정
  @RequestMapping(value = "/modifyMember", method = RequestMethod.GET)
  public void getModify() throws Exception {
    logger.info("get Modify");
  }

  // 5-2) 회원정보 수정
  @RequestMapping(value = "/modifyMember", method = RequestMethod.POST)
  public String postModify(MemberDTO member, HttpServletRequest rq, HttpSession session) throws Exception {
    logger.info("post Modify");

    MemberDTO memberSession = (MemberDTO) session.getAttribute("member");

    // member 객체에 세션에서 받아온 회원번호 넣어준다.
    member.setMember_num(memberSession.getMember_num());

    // 넘겨받은 멤버에 비밀번호가 비어있으면
    // 인증 받은 비밀번호를 넣어준다.
    if (member.getMember_pw() == "") {
      member.setMember_pw(rq.getParameter("member_pwPre"));
    }

    // 회원 수정
    service.modifyMember(member);

    // 세션 다시 올림.
    // 비밀번호
    memberSession.setMember_pw(member.getMember_pw());
    // 닉네임
    memberSession.setMember_nickname(member.getMember_nickname());
    // 생년월일
    memberSession.setMember_birth(member.getMember_birth());
    // 휴대폰번호
    memberSession.setMember_phone(member.getMember_phone());

    session.setAttribute("member", memberSession);
    return "redirect:/myPage/Page";
  }

  // 5-3) 정보 수정 전 비밀번호 체크
  @RequestMapping(value = "/pwCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
  @ResponseBody
  public String pwCheck(@RequestParam String member_pw, HttpSession session) throws Exception {
    // 세션에서 로그인 회원 가져오고
    MemberDTO member = (MemberDTO) session.getAttribute("member");
    // 가져온 비밀번호를 넣고
    member.setMember_pw(member_pw);
    // 맞는지 확인
    int result = service.pwCheck(member);
    return Integer.toString(result);
  }
  //비번찾기
  @RequestMapping(value = "/findPW", method = RequestMethod.GET)
  public void getFindPW() throws Exception {

  }
  
  @Autowired
  private EmailSender emailSender;
  @Autowired
  private Email email;
  @RequestMapping(value = "/findPW", method = RequestMethod.POST)
  @ResponseBody
  public int postFindPW(@RequestParam(value="findArr[]") List<String> find, MemberDTO dto) throws Exception {

    int result;
    String member_email = find.get(0).toString();
    String member_name = find.get(1).toString();
    String member_phone = find.get(2).toString();

      
    dto.setMember_email(member_email);
    dto.setMember_name(member_name);
    dto.setMember_phone(member_phone);
    
    String pw = service.findPW(dto);
    if(pw!=null) {
      email.setContent("비밀번호는 "+pw+" 입니다.");
      email.setReceiver(member_email);
      email.setSubject(member_name+"님 비밀번호 찾기 메일입니다.");
      emailSender.SendEmail(email);
      result = 1;
      return result;
    }else {
      result = 0;
      return result;
    }
  }
  //ID 찾기
  @RequestMapping(value = "/findID", method = RequestMethod.GET)
  public void getFindID() throws Exception {
    
  }  
  @RequestMapping(value = "/findID", method = RequestMethod.POST)
  @ResponseBody
  public String postFindID(@RequestParam(value="findArr[]") List<String> find, MemberDTO dto) throws Exception {

    String member_name = find.get(0).toString();
    String member_phone = find.get(1).toString();
    
    String result;
      
    dto.setMember_name(member_name);
    dto.setMember_phone(member_phone);
    String member_email = service.findID(dto);
    System.out.println(member_email);
    
    result = member_email;
    return result;

  }
  
}

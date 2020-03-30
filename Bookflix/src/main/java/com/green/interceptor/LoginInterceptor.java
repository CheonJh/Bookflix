package com.green.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.green.member.domain.MemberDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

    try {

      HttpSession session = request.getSession();
      MemberDTO member = (MemberDTO) session.getAttribute("member");

      // 로그인이 안됐을 때
      // 세션에 멤버가 안올라와 있으면 로그인 페이지로 이동
      if (member == null) {
        response.sendRedirect("/member/login");
        return false;
      } else {
        return true;
      }

    } catch (Exception e) {
      e.printStackTrace();
    }

    return super.preHandle(request, response, handler);
  }

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    // TODO Auto-generated method stub
    super.postHandle(request, response, handler, modelAndView);
  }

}

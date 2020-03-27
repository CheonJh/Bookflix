package com.green.search.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.green.member.controller.MemberController;
import com.green.search.service.SearchService;

/**
 * @author 천재헌
 * @since 2020.03.27
 *
 *        search 관련 url 컨트롤러
 */
@Controller
@RequestMapping("/search/*")
public class SearchController {

  // 로깅을 위한 변수
  private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

  // 서비스
  @Inject
  SearchService service;

  // 1) 검색페이지
  @RequestMapping(value = "/search", method = RequestMethod.GET)
  public void getRegister() throws Exception {
    logger.info("get search");
  }

}

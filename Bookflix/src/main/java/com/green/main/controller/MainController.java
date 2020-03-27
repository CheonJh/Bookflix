package com.green.main.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.green.main.domain.MainDTO;
import com.green.main.service.MainService;

@Controller
public class MainController {

  @Inject
  MainService service;
  
  @RequestMapping(value="/", method=RequestMethod.GET)
  public String getList(Model model) throws Exception {
    
    // 인기도서
    List<MainDTO> favorite = null;
    favorite = service.favorite();
    // 신간도서
    List<MainDTO> newbook = null;
    newbook = service.newbook();
    
    model.addAttribute("newbook", newbook);
    model.addAttribute("favorite", favorite);
    return "main/main";
  }
  
  
  
  
  

}

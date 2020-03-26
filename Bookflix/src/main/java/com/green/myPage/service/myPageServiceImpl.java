package com.green.myPage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.myPage.domain.myPageDTO;
import com.green.myPage.model.myPageDAO;

@Service
public class myPageServiceImpl implements myPageService {

  @Inject
  private myPageDAO dao;
  
  //읽은 도서 목록
/*  @Override
  public List<myPageDTO> list1() throws Exception {
    return dao.list1();
  }*/
  @Override
  public List<myPageDTO> list1(int member_num) throws Exception {
    return dao.list1(member_num);
  }
  
  //찜한 도서 목록
  @Override
  public List<myPageDTO> list2() throws Exception {
    return dao.list2();
  }


  //좋아요 한 도서 목록
  @Override
  public List<myPageDTO> list3() throws Exception {
    return dao.list3();
  }

  
  
}

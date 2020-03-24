package com.green.myPage.service;

import java.util.List;

import com.green.myPage.domain.myPageDTO;

public interface myPageService {
  //읽은 도서 목록
  public List<myPageDTO> list1() throws Exception;
  
  //찜한 도서 목록
  public List<myPageDTO> list2() throws Exception;
  
  //좋아요 한 도서 목록
  public List<myPageDTO> list3() throws Exception;

}
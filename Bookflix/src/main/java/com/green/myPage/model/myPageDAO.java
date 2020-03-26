package com.green.myPage.model;

import java.util.List;

import com.green.myPage.domain.myPageDTO;

public interface myPageDAO {
  //읽은 도서 목록
  //public List<myPageDTO> list1() throws Exception;
  public List<myPageDTO> list1(int member_num) throws Exception;
  
  //찜한 도서 목록
  public List<myPageDTO> list2() throws Exception;
  
  //좋아요 한 도서 목록
  public List<myPageDTO> list3() throws Exception;
}

package com.green.myPage.service;

import java.util.List;

import com.green.myPage.domain.myPageDTO;

public interface myPageService {
  //읽은 도서 목록
  public List<myPageDTO> list1(int member_num) throws Exception;
  
  //찜한 도서 목록
  public List<myPageDTO> list2(int member_num) throws Exception;
  
  //좋아요 한 도서 목록
  public List<myPageDTO> list3(int member_num) throws Exception;

  //잔여 구독일 수
  public int date(int member_num) throws Exception;
  
  //구독 내역 보기
  public List<myPageDTO> list4(int member_num) throws Exception;
  
  // 구독하기 - sub1
  public void sub1(int member_num) throws Exception;
  
  // 구독하기 - sub2
  public void sub2(int member_num) throws Exception;
  
  // 구독해지 - sub3
  public void sub3(int member_num) throws Exception;
}

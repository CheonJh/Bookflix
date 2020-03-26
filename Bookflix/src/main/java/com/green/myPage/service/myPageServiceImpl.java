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
  @Override
  public List<myPageDTO> list1(int member_num) throws Exception {
    return dao.list1(member_num);
  }
/*  @Override
  public List<myPageDTO> list1() throws Exception {
    return dao.list1();
  }*/
  
  //찜한 도서 목록
  @Override
  public List<myPageDTO> list2(int member_num) throws Exception {
    return dao.list2(member_num);
  }


  //좋아요 한 도서 목록
  @Override
  public List<myPageDTO> list3(int member_num) throws Exception {
    return dao.list3(member_num);
  }

  //잔여 구독일 수
  @Override
  public int date(int member_num) throws Exception {
    return dao.date(member_num);
  }

  //구독 내역 보기
  @Override
  public List<myPageDTO> list4(int member_num) throws Exception {
    return dao.list4(member_num);
  }

  // 구독하기 1
  @Override
  public void sub1(int member_num) throws Exception {
    dao.sub1(member_num);
  }
  
  //구독하기 2
  @Override
  public void sub2(int member_num) throws Exception {
    dao.sub2(member_num);
  }
  
  // 구독해지
  @Override
  public void sub3(int member_num) throws Exception {
    dao.sub3(member_num);
  }
}

package com.green.myPage.domain;

import java.util.Date;

public class myPageDTO {
  //읽은 도서 목록
  private Integer HADREAD_NUM;
  private Date HADREAD_DATE;
  private String e_book_title;
  //찜한 도서 목록
  private Integer FAVORITE_NUM;
  private Date FAVORITE_DATE;
  //좋아요 한 도서 목록
  private Integer THUMBUP_NUM;
  private Date THUMBUP_DATE;
  
  public Integer getTHUMBUP_NUM() {
    return THUMBUP_NUM;
  }
  public void setTHUMBUP_NUM(Integer tHUMBUP_NUM) {
    THUMBUP_NUM = tHUMBUP_NUM;
  }
  public Date getTHUMBUP_DATE() {
    return THUMBUP_DATE;
  }
  public void setTHUMBUP_DATE(Date tHUMBUP_DATE) {
    THUMBUP_DATE = tHUMBUP_DATE;
  }
  public Integer getFAVORITE_NUM() {
    return FAVORITE_NUM;
  }
  public void setFAVORITE_NUM(Integer fAVORITE_NUM) {
    FAVORITE_NUM = fAVORITE_NUM;
  }
  public Date getFAVORITE_DATE() {
    return FAVORITE_DATE;
  }
  public void setFAVORITE_DATE(Date fAVORITE_DATE) {
    FAVORITE_DATE = fAVORITE_DATE;
  }
  public Integer getHADREAD_NUM() {
    return HADREAD_NUM;
  }
  public void setHADREAD_NUM(Integer hADREAD_NUM) {
    HADREAD_NUM = hADREAD_NUM;
  }
  public Date getHADREAD_DATE() {
    return HADREAD_DATE;
  }
  public void setHADREAD_DATE(Date hADREAD_DATE) {
    HADREAD_DATE = hADREAD_DATE;
  }
  public String getE_book_title() {
    return e_book_title;
  }
  public void setE_book_title(String e_book_title) {
    this.e_book_title = e_book_title;
  }

 
}

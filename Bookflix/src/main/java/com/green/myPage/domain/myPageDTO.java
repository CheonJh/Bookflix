package com.green.myPage.domain;

import java.util.Date;

public class myPageDTO {
  //읽은 도서 목록
  private Integer hadread_num;
  private Date hadread_date;
  private String e_book_title;
  //찜한 도서 목록
  private Integer favorite_num;
  private Date favorite_date;
  //좋아요 한 도서 목록
  private Integer thumbup_num;
  private Date thumbup_date;
  //잔여 구독일 수
  private Date subscribe_date;
  
  //구독 내역 보기
  private Integer subscribe_num;
  private Integer subscribe_fee;
  
  public Integer getHadread_num() {
    return hadread_num;
  }
  public void setHadread_num(Integer hadread_num) {
    this.hadread_num = hadread_num;
  }
  public Date getHadread_date() {
    return hadread_date;
  }
  public void setHadread_date(Date hadread_date) {
    this.hadread_date = hadread_date;
  }
  public String getE_book_title() {
    return e_book_title;
  }
  public void setE_book_title(String e_book_title) {
    this.e_book_title = e_book_title;
  }
  public Integer getFavorite_num() {
    return favorite_num;
  }
  public void setFavorite_num(Integer favorite_num) {
    this.favorite_num = favorite_num;
  }
  public Date getFavorite_date() {
    return favorite_date;
  }
  public void setFavorite_date(Date favorite_date) {
    this.favorite_date = favorite_date;
  }
  public Integer getThumbup_num() {
    return thumbup_num;
  }
  public void setThumbup_num(Integer thumbup_num) {
    this.thumbup_num = thumbup_num;
  }
  public Date getThumbup_date() {
    return thumbup_date;
  }
  public void setThumbup_date(Date thumbup_date) {
    this.thumbup_date = thumbup_date;
  }
  public Date getSubscribe_date() {
    return subscribe_date;
  }
  public void setSubscribe_date(Date subscribe_date) {
    this.subscribe_date = subscribe_date;
  }
  public Integer getSubscribe_num() {
    return subscribe_num;
  }
  public void setSubscribe_num(Integer subscribe_num) {
    this.subscribe_num = subscribe_num;
  }
  public Integer getSubscribe_fee() {
    return subscribe_fee;
  }
  public void setSubscribe_fee(Integer subscribe_fee) {
    this.subscribe_fee = subscribe_fee;
  }
  
  
 
}

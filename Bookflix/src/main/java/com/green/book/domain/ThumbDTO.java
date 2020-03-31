package com.green.book.domain;

public class ThumbDTO {

  private int thumbup_num;
  private int member_num;
  private int e_book_num;
  private String thumbup_date;

  
  public int getThumbup_num() {
    return thumbup_num;
  }

  public void setThumbup_num(int thumbup_num) {
    this.thumbup_num = thumbup_num;
  }



  public int getMember_num() {
    return member_num;
  }

  public void setMember_num(int member_num) {
    this.member_num = member_num;
  }

  public int getE_book_num() {
    return e_book_num;
  }

  public void setE_book_num(int e_book_num) {
    this.e_book_num = e_book_num;
  }
  
  public String getThumbup_date() {
    return thumbup_date;
  }

  public void setThumbup_date(String thumbup_date) {
    this.thumbup_date = thumbup_date;
  }

}

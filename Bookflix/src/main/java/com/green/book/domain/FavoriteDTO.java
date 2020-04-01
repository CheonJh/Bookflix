package com.green.book.domain;

public class FavoriteDTO {
  
  private int favorite_num;
  private int member_num;
  private int e_book_num;
  private String favorite_date;

  
  public int getFavorite_num() {
    return favorite_num;
  }

  public void setFavorite_num(int favorite_num) {
    this.favorite_num = favorite_num;
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
  
  public String getFavorite_date() {
    return favorite_date;
  }

  public void setFavorite_date(String favorite_date) {
    this.favorite_date = favorite_date;
  }
}

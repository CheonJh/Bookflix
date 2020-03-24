package com.green.adminBook.domain;

import java.util.Date;

public class AdminBookDTO {
  /*
   CREATE TABLE E_BOOK
(
  E_BOOK_NUM           INTEGER NOT NULL,
  E_BOOK_TITLE         VARCHAR(50) NOT NULL,
  E_BOOK_WRITER        VARCHAR(30) NOT NULL,
  E_BOOK_TRANSLATER    VARCHAR(30) NULL,
  E_BOOK_PUBLISHER     VARCHAR(30) NOT NULL,
  E_BOOK_DATE          DATE NOT NULL,
  E_BOOK_INFO          TEXT NOT NULL,
  E_BOOK_INDEX         TEXT NOT NULL,
  E_BOOK_THUMBUPCNT    INTEGER NOT NULL,
  E_BOOK_VIEWCNT       INTEGER NOT NULL,
  E_BOOK_IMG_NAME      VARCHAR(30) NOT NULL,
  E_BOOK_TAG           VARCHAR(500) NOT NULL
);
   */
  private Integer e_book_num;
  private String e_book_title;
  private String e_book_writer;
  private String e_book_translater;
  private String e_book_publisher;
  private Date e_book_date;
  private String e_book_info;
  private String e_book_index;
  private Integer e_book_thumbcnt;
  private Integer e_book_viewcnt;
  private String e_book_img_name;
  private String e_book_tag;
  
  
  public Integer getE_book_num() {
    return e_book_num;
  }
  public void setE_book_num(Integer e_book_num) {
    this.e_book_num = e_book_num;
  }
  public String getE_book_title() {
    return e_book_title;
  }
  public void setE_book_title(String e_book_title) {
    this.e_book_title = e_book_title;
  }
  public String getE_book_writer() {
    return e_book_writer;
  }
  public void setE_book_writer(String e_book_writer) {
    this.e_book_writer = e_book_writer;
  }
  public String getE_book_translater() {
    return e_book_translater;
  }
  public void setE_book_translater(String e_book_translater) {
    this.e_book_translater = e_book_translater;
  }
  public String getE_book_publisher() {
    return e_book_publisher;
  }
  public void setE_book_publisher(String e_book_publisher) {
    this.e_book_publisher = e_book_publisher;
  }
  public Date getE_book_date() {
    return e_book_date;
  }
  public void setE_book_date(Date e_book_date) {
    this.e_book_date = e_book_date;
  }
  public String getE_book_info() {
    return e_book_info;
  }
  public void setE_book_info(String e_book_info) {
    this.e_book_info = e_book_info;
  }
  public String getE_book_index() {
    return e_book_index;
  }
  public void setE_book_index(String e_book_index) {
    this.e_book_index = e_book_index;
  }
  public Integer getE_book_thumbcnt() {
    return e_book_thumbcnt;
  }
  public void setE_book_thumbpcnt(Integer e_book_thumbcnt) {
    this.e_book_thumbcnt = e_book_thumbcnt;
  }
  public Integer getE_book_viewcnt() {
    return e_book_viewcnt;
  }
  public void setE_book_viewcnt(Integer e_book_viewcnt) {
    this.e_book_viewcnt = e_book_viewcnt;
  }
  public String getE_book_img_name() {
    return e_book_img_name;
  }
  public void setE_book_img_name(String e_book_img_name) {
    this.e_book_img_name = e_book_img_name;
  }
  public String getE_book_tag() {
    return e_book_tag;
  }
  public void setE_book_tag(String e_book_tag) {
    this.e_book_tag = e_book_tag;
  }
  
}

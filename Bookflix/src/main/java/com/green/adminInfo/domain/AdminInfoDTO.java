package com.green.adminInfo.domain;

import java.util.Date;

public class AdminInfoDTO {
  
  /*CREATE TABLE NOTICE
  (
    NOTICE_NUM           INTEGER NOT NULL,
    NOTICE_TITLE         VARCHAR(30) NOT NULL,
    NOTICE_CATEGORY      VARCHAR(20) NOT NULL,
    NOTICE_CONTENTS      TEXT NOT NULL,
    NOTICE_DATE          DATETIME NOT NULL,
    NOTICE_VIEWCNT       INTEGER NOT NULL
  );*/
  
  
  //공지사항 테이블
  private Integer notice_num;
  private String notice_title;
  private String notice_category;
  private String notice_contents;
  private Date notice_date;
  private Integer notice_viewcnt;

  //검색
  private String searchType;
  private String keyword;
  
  //FAQ 테이블
  private Integer faq_num;
  private String faq_title;
  private String faq_category;
  private String faq_contents;
  
  public Integer getFaq_num() {
    return faq_num;
  }
  public void setFaq_num(Integer faq_num) {
    this.faq_num = faq_num;
  }
  public String getFaq_title() {
    return faq_title;
  }
  public void setFaq_title(String faq_title) {
    this.faq_title = faq_title;
  }
  public String getFaq_category() {
    return faq_category;
  }
  public void setFaq_category(String faq_category) {
    this.faq_category = faq_category;
  }
  public String getFaq_contents() {
    return faq_contents;
  }
  public void setFaq_contents(String faq_contents) {
    this.faq_contents = faq_contents;
  }
  public String getSearchType() {
    return searchType;
  }
  public void setSearchType(String searchType) {
    this.searchType = searchType;
  }
  public String getKeyword() {
    return keyword;
  }
  public void setKeyword(String keyword) {
    this.keyword = keyword;
  }
  public Integer getNotice_num() {
    return notice_num;
  }
  public void setNotice_num(Integer notice_num) {
    this.notice_num = notice_num;
  }
  public String getNotice_title() {
    return notice_title;
  }
  public void setNotice_title(String notice_title) {
    this.notice_title = notice_title;
  }
  public String getNotice_category() {
    return notice_category;
  }
  public void setNotice_category(String notice_category) {
    this.notice_category = notice_category;
  }
  public String getNotice_contents() {
    return notice_contents;
  }
  public void setNotice_contents(String notice_contents) {
    this.notice_contents = notice_contents;
  }
  public Date getNotice_date() {
    return notice_date;
  }
  public void setNotice_date(Date notice_date) {
    this.notice_date = notice_date;
  }
  public Integer getNotice_viewcnt() {
    return notice_viewcnt;
  }
  public void setNotice_viewcnt(Integer notice_viewcnt) {
    this.notice_viewcnt = notice_viewcnt;
  }
  
  
}

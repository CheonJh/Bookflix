package com.green.info.domain;

import java.util.Date;

public class InfoFaqDTO {
  
  /*CREATE TABLE NOTICE
  (
    FAQ_NUM           INTEGER NOT NULL,
    FAQ_TITLE         VARCHAR(30) NOT NULL,
    FAQ_CATEGORY      VARCHAR(20) NOT NULL,
    FAQ_CONTENTS      TEXT NOT NULL,
  );*/
  
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
  
}
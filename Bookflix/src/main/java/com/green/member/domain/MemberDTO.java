package com.green.member.domain;


/**
 * Alt + Shif + J를 눌러 자동 주석 생성해서 주석 반드시 달것
 * @author 천재헌
 * @since 2020.03.17
 * 
 * 회원 객체를 받는 DTO
 */
public class MemberDTO{
  
  // 필드
  private Integer member_num;
  private Integer member_grade;
  private String  member_email;
  private String  member_pw;
  private String  member_name;
  private String  member_nickname;
  private String  member_birth;
  private String  member_phone;
  
  // 생성자
  public MemberDTO() { }

  // get, set
  public Integer getMember_num() {
    return member_num;
  }

  public void setMember_num(Integer member_num) {
    this.member_num = member_num;
  }

  public Integer getMember_grade() {
    return member_grade;
  }

  public void setMember_grade(Integer member_grade) {
    this.member_grade = member_grade;
  }

  public String getMember_email() {
    return member_email;
  }

  public void setMember_email(String member_email) {
    this.member_email = member_email;
  }

  public String getMember_pw() {
    return member_pw;
  }

  public void setMember_pw(String member_pw) {
    this.member_pw = member_pw;
  }

  public String getMember_name() {
    return member_name;
  }

  public void setMember_name(String member_name) {
    this.member_name = member_name;
  }

  public String getMember_nickname() {
    return member_nickname;
  }

  public void setMember_nickname(String member_nickname) {
    this.member_nickname = member_nickname;
  }

  public String getMember_birth() {
    return member_birth;
  }

  public void setMember_birth(String member_birth) {
    this.member_birth = member_birth;
  }

  public String getMember_phone() {
    return member_phone;
  }

  public void setMember_phone(String member_phone) {
    this.member_phone = member_phone;
  }
  
  
  
  

}

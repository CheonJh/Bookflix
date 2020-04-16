package com.green.book.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.book.domain.BookDTO;
import com.green.book.domain.FavoriteDTO;
import com.green.book.domain.HadReadDTO;
import com.green.book.domain.ThumbDTO;
import com.green.book.service.BookService;
import com.green.member.domain.MemberDTO;

@Controller
@RequestMapping("/book/*")
public class BookController {

  public boolean thumbCheck;
  public boolean favoriteCheck;
  public boolean hadReadCheck;

  @Inject
  private BookService bookService;

  // 책정보 불러오기
  @RequestMapping(value = "/view", method = RequestMethod.GET)
  // @ResponseBody
  public void getView(@RequestParam("e_book_num") int e_book_num, ThumbDTO thumbParam, HttpSession session,
      FavoriteDTO favoriteParam, Model model, MemberDTO member, HadReadDTO hadReadParam) throws Exception {

    // 책정보 가져오기
    BookDTO bookDTO = bookService.view(e_book_num);
    member = (MemberDTO) session.getAttribute("member");
    model.addAttribute("view", bookDTO);

    // 관련도서 가져오기
    List<BookDTO> tagBooks = null;
    String e_book_tag = bookDTO.getE_book_tag();
    String[] tagArray = e_book_tag.split("#");
    model.addAttribute("tagArray", tagArray);
    
    if(tagArray.length != 1) {
      tagArray[0] = tagArray[1];
    }
    else {
      return;
    }
    
    tagBooks = bookService.tagBooks(tagArray);

    model.addAttribute("tagBooks", tagBooks);

    // 버튼 초기값 세팅
    if (member != null) {
      int member_num = member.getMember_num();
      
      // hadRead 비교값 세팅
      hadReadParam.setE_book_num(e_book_num);
      hadReadParam.setMember_num(member_num);

      // Thumbup 비교값 세팅
      thumbParam.setE_book_num(e_book_num);
      thumbParam.setMember_num(member_num);

      // favorite 비교값 세팅
      favoriteParam.setE_book_num(e_book_num);
      favoriteParam.setMember_num(member_num);
      
      // 버튼 테이블 가져오기
      ThumbDTO thumbDTO = bookService.thumbDTO(thumbParam);
      FavoriteDTO favoriteDTO = bookService.favoriteDTO(favoriteParam);
      HadReadDTO hadReadDTO = bookService.hadReadDTO(hadReadParam);

      // hadRead가 이미 있을때
      if (hadReadDTO != null) {
        hadReadCheck = true;
        model.addAttribute("hadReadCheck", hadReadCheck);
      }

      // hadRead가 없을때
      else {
        hadReadCheck = false;
        model.addAttribute("hadReadCheck", hadReadCheck);
      }

      // 좋아요가 이미 있을때
      if (thumbDTO != null) {
        thumbCheck = true;
        System.out.println("좋아요 낫 널");
        model.addAttribute("thumbCheck", thumbCheck);
        System.out.println(thumbCheck);
      }

      // 좋아요가 없을때
      else {
        thumbCheck = false;
        System.out.println("좋아요 널");
        model.addAttribute("thumbCheck", thumbCheck);
        System.out.println(thumbCheck);
      }

      // 찜하기가 이미 있을때
      if (favoriteDTO != null) {
        favoriteCheck = true;
        System.out.println("찜하기 낫 널");
        model.addAttribute("favoriteCheck", favoriteCheck);
      }

      // 찜하기가 없을때
      else {
        favoriteCheck = false;
        System.out.println("찜하기 널");
        model.addAttribute("favoriteCheck", favoriteCheck);
      }
    } else {
      System.out.println("멤버 널");
      hadReadCheck = false;
      thumbCheck = false;
      favoriteCheck = false;
      model.addAttribute("hadReadCheck", hadReadCheck);
      model.addAttribute("thumbCheck", thumbCheck);
      model.addAttribute("favoriteCheck", favoriteCheck);
    }
    System.out.println("멤버" + member);
  }

  // 좋아요 갯수 +1
  @RequestMapping(value = "/thumbUp", method = RequestMethod.POST)
  @ResponseBody
  public void postThumbup(@RequestParam("e_book_num") int e_book_num, ThumbDTO thumbParam, HttpSession session,
      MemberDTO member, Model model) throws Exception {

    // 세션에서 회원정보 불러오기
    member = (MemberDTO) session.getAttribute("member");
    System.out.println("=========================================멤버" + member);

    // 회원번호
    int member_num = member.getMember_num();
    thumbParam.setE_book_num(e_book_num);
    thumbParam.setMember_num(member_num);
    
    // 도서테이블 좋아요 증가
    if (thumbCheck != true) {
      bookService.thumbUp(e_book_num);
      bookService.thumbInsert(thumbParam);
      thumbCheck = true;
      model.addAttribute("thumbCheck", thumbCheck);
      System.out.println("증가" + thumbCheck);
    } 
    // 도서테이블 좋아요 감소
    else {      
      bookService.thumbDown(e_book_num);
      bookService.thumbDelete(thumbParam);
      thumbCheck = false;
      model.addAttribute("thumbCheck", thumbCheck);
      System.out.println("감소" + thumbCheck);
    }
  }

  // 찜하기 등록
  @RequestMapping(value = "/favorite", method = RequestMethod.POST)
  @ResponseBody
  public int postFavorite(@RequestParam("e_book_num") int e_book_num, FavoriteDTO favoriteParam, HttpSession session,
      MemberDTO member, Model model) throws Exception {
    int result;
    // 세션에서 회원정보 불러오기
    member = (MemberDTO) session.getAttribute("member");

    // 회원번호
    int member_num = member.getMember_num();
    // thumbDTO 데이터 셋팅
    favoriteParam.setE_book_num(e_book_num);
    favoriteParam.setMember_num(member_num);

    if (favoriteCheck != true) {
      // 도서테이블 좋아요 증가
      bookService.favoriteInsert(favoriteParam);
      model.addAttribute("favoriteCheck", favoriteCheck);
      System.out.println();
      result = 1;
      return result;
    } else {
      // 도서테이블 좋아요 감소
      model.addAttribute("favoriteCheck", favoriteCheck);
      result = 0;
      return result;
    }
  }

  // e-북 읽기
  @RequestMapping(value = "/hadReadInsert", method = RequestMethod.POST)
  @ResponseBody
  public void postHadRead(@RequestParam("e_book_num") int e_book_num, HttpSession session, MemberDTO member,
      Model model, HadReadDTO hadReadParam) throws Exception {

    member = (MemberDTO) session.getAttribute("member");

    // 회원번호
    int member_num = member.getMember_num();

    // hDTO 데이터 셋팅
    hadReadParam.setE_book_num(e_book_num);
    hadReadParam.setMember_num(member_num);

    // 도서테이블 좋아요 증가
    if (hadReadCheck != true) {
      // 도서테이블 좋아요 증가
      bookService.hadReadInsert(hadReadParam);
      hadReadCheck = true;
      model.addAttribute("hadReadCheck", hadReadCheck);
    } 
    else {
      return;
    }
  }
}

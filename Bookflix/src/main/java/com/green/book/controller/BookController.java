package com.green.book.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;

import com.green.book.domain.BookDTO;
import com.green.book.domain.FavoriteDTO;
import com.green.book.domain.ThumbDTO;
import com.green.book.service.BookService;
import com.green.member.domain.MemberDTO;

@Controller
@RequestMapping("/book/*")
public class BookController {

  boolean thumbCheck;
  boolean favoriteCheck;

  @Inject
  private BookService bookService;

  // 책정보 불러오기
  @RequestMapping(value = "/view", method = RequestMethod.GET)
  // @ResponseBody
  public void getView(@RequestParam("e_book_num") int e_book_num, ThumbDTO thumbParam, HttpSession session,
      FavoriteDTO favoriteParam, Model model, @ModelAttribute("member") MemberDTO member) throws Exception {

    // 책정보 가져오기
    BookDTO bookDTO = bookService.view(e_book_num);

    member = (MemberDTO) session.getAttribute("member");

    System.out.println("===================================================멤버 찍는거 " + member);

    model.addAttribute("view", bookDTO);

    if (member != null) {
      int member_num = member.getMember_num();

      // Thumbup 비교값 세팅
      thumbParam.setE_book_num(e_book_num);
      thumbParam.setMember_num(member_num);

      // favorite 비교값 세팅
      favoriteParam.setE_book_num(e_book_num);
      favoriteParam.setMember_num(member_num);

      // Thumbup테이블 가져오기
      ThumbDTO thumbDTO = bookService.thumbDTO(thumbParam);

      FavoriteDTO favoriteDTO = bookService.favoriteDTO(favoriteParam);

      // 좋아요가 이미 있을때
      if (thumbDTO != null) {
        thumbCheck = true;
        System.out.println("좋아요 낫 널");
        model.addAttribute(thumbCheck);
      }

      // 좋아요가 없을때
      else {
        thumbCheck = false;
        System.out.println("좋아요 널");
        model.addAttribute(thumbCheck);
      }

      // 찜하기가 이미 있을때
      if (favoriteDTO != null) {
        favoriteCheck = true;
        System.out.println("찜하기 낫 널");
        model.addAttribute(favoriteCheck);
      }

      // 찜하기가 없을때
      else {
        favoriteCheck = false;
        System.out.println("찜하기 널");
        model.addAttribute(favoriteCheck);
      }
    } else {
      System.out.println("멤버 널");
      thumbCheck = false;
      favoriteCheck = false;
      model.addAttribute(thumbCheck);
      model.addAttribute(favoriteCheck);
    }
    System.out.println("멤버" + member);

    // return "redirect:/book/view?e_book_num="+e_book_num;
  }

  // 좋아요 갯수 +1
  @RequestMapping(value = "/thumbUp", method = RequestMethod.POST)
  @ResponseBody
  public void postThumbup(@RequestParam("e_book_num") int e_book_num, ThumbDTO thumbParam, HttpSession session,
      @ModelAttribute("member") MemberDTO member, Model model) throws Exception {

    // 세션에서 회원정보 불러오기
    member = (MemberDTO) session.getAttribute("member");
    System.out.println("=========================================멤버" + member);

    // 회원번호
    int member_num = member.getMember_num();
    // thumbDTO 데이터 셋팅
    thumbParam.setE_book_num(e_book_num);
    thumbParam.setMember_num(member_num);

    if (thumbCheck != true) {
      // 도서테이블 좋아요 증가
      bookService.thumbUp(e_book_num);
      bookService.thumbInsert(thumbParam);
      thumbCheck = true;
      model.addAttribute(thumbCheck);
    } else {
      // 도서테이블 좋아요 감소
      bookService.thumbDown(e_book_num);
      bookService.thumbDelete(thumbParam);
      thumbCheck = false;
      model.addAttribute(thumbCheck);
    }
  }

  // 찜하기 등록
  @RequestMapping(value = "/favorite", method = RequestMethod.POST)
  @ResponseBody
  public void postFavorite(@RequestParam("e_book_num") int e_book_num, FavoriteDTO favoriteParam, 
      HttpSession session) throws Exception {

    // 세션에서 회원정보 불러오기
    MemberDTO member = (MemberDTO) session.getAttribute("member");

    // 회원번호
    int member_num = member.getMember_num();
    // thumbDTO 데이터 셋팅
    favoriteParam.setE_book_num(e_book_num);
    favoriteParam.setMember_num(member_num);

    if (favoriteCheck != true) {
      // 도서테이블 좋아요 증가
      bookService.favoriteInsert(favoriteParam);
      favoriteCheck = true;
    } else {
      // 도서테이블 좋아요 감소
      bookService.favoriteDelete(favoriteParam);
      favoriteCheck = false;
    }
  }
}

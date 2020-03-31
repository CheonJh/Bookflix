package com.green.adminBook.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.green.adminBook.domain.AdminBookDTO;
import com.green.adminBook.service.AdminBookService;
import com.green.adminBook.util.UploadFileUtils;
import com.green.util.Search;

@Controller
@RequestMapping("adminBook/*")
public class AdminBookController {
  @Inject
  AdminBookService service;

  @Resource(name = "uploadPath")
  private String uploadPath;
  
  @RequestMapping(value = "/adminBookList", method = RequestMethod.GET)
  public String getAdminBookList(Model model, @RequestParam(required = false, defaultValue="1") int page, 
      @RequestParam(required = false, defaultValue="1") int range,
      @RequestParam(required = false, defaultValue="e_book_title") String searchType,
      @RequestParam(required = false) String keyword, @ModelAttribute("search") Search search) throws Exception {
    
    search.setSearchType(searchType);
    search.setKeyword(keyword);
    // 파라미터로 세터설정
    int listCnt = service.adminBookCount(search);

    search.pageInfo(page, range, listCnt);
    
    //전체 게시글 개수

    model.addAttribute("pagination", search);
    model.addAttribute("list", service.adminBookList(search));
    return "adminBook/adminBookList";

  }

/*  @RequestMapping(value = "/adminBookList", method = RequestMethod.GET)
  public void getAdminBookList(Model model, @RequestParam(defaultValue = "1") int num) throws Exception {
    // 디폴트 값을 줘야만 움직임?
    int count = service.adminBookCount(); // 총 게시물 숫자

    int postNum = 10; // sql에서 지정한 한 페이지에 표시될 게시물 숫자

    int pageNum = (int) Math.ceil((double) count / postNum); // 총 페이징 갯수

    int displayPost = (num - 1) * postNum; // sql에서 지정하는 페이지 게시물 번호

    int pageNum_cnt = 10; // 표시될 페이징 갯수

    int endPageNum = (int) Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt; // 표시되는 번호중 마지막 번호

    int startPageNum = endPageNum - (pageNum_cnt - 1); // 한 페이징에서 표시되는 번호중 첫번쨰

    int endPageNum_tmp = (int) Math.ceil((double) count / (double) pageNum_cnt);

    if (endPageNum > endPageNum_tmp) {
      endPageNum = endPageNum_tmp;
    }

    boolean prev = startPageNum == 1 ? false : true;
    // 삼항 연산자 페이지네이션 시작페이지가 1과 같다면 false반환
    boolean next = endPageNum * pageNum_cnt >= count ? false : true;
    // 공식을 모르겠다
    // 페이지네이션 마지막 페이지 * 표시되는 페이징 값이 총 게시물수와 크거나 같다면 false 반환

    List list = null;

    list = service.adminBookList(displayPost, postNum);
    model.addAttribute("list", list);
    model.addAttribute("pageNum", pageNum);

    model.addAttribute("startPageNum", startPageNum);
    model.addAttribute("endPageNum", endPageNum);
    model.addAttribute("prev", prev);
    model.addAttribute("next", next);

    model.addAttribute("select", num);
  }*/

  @RequestMapping(value = "/adminBookReg", method = RequestMethod.GET)
  public void getAdminBookReg() throws Exception {

  }

  @RequestMapping(value = "/adminBookReg", method = RequestMethod.POST)
  public String postAdminBookReg(AdminBookDTO DTO, MultipartFile file) throws Exception {

    String imgUploadPath = uploadPath + File.separator;
    String fileName = null;

    if (file != null) {
      fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());
    } else {
      fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
    }

    DTO.setE_book_img_path(fileName);
    DTO.setE_book_thumbnail("thumbnail" + File.separator + "thumbnail_" + fileName);
    
    service.adminBookReg(DTO); 
    return "redirect:/adminBook/adminBookList";
  }
  //수정페이지 GET
  @RequestMapping(value = "/adminBookMod", method = RequestMethod.GET)
  public void getAdminBookMod(@RequestParam("e_book_num") int e_book_num, Model model) throws Exception {
    AdminBookDTO dto = service.adminBookView(e_book_num);
    model.addAttribute("view", dto);
  }
  //수정페이지 POST
  @RequestMapping(value = "/adminBookMod", method = RequestMethod.POST)
  public String postAdminBookMod(AdminBookDTO DTO, @RequestParam("oldFile") String path,
      @RequestParam("oldThumbnail") String thumbpath, MultipartFile file) throws Exception {
   //파일 삭제 코드
   File oldFile = new File(uploadPath+File.separator+path);
   File oldThumbnail = new File(uploadPath+File.separator+thumbpath);

   if(oldFile.exists()) {
     oldFile.delete();
   }   
   if(oldThumbnail.exists()) {
     oldThumbnail.delete();
   }

   
   String imgUploadPath = uploadPath + File.separator ;
   String fileName = null;

   if (file != null) {
     fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());
   } else {
     fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
   }

   DTO.setE_book_img_path(fileName);
   DTO.setE_book_thumbnail("thumbnail" + File.separator + "thumbnail_" + fileName);
   
   service.adminBookModify(DTO);
   
   return "redirect:/adminBook/adminBookList";
  }
  
  @ResponseBody
  @RequestMapping(value = "/adminBookDelete", method = {RequestMethod.POST, RequestMethod.GET})
  public void postAdminBookDelete(@RequestParam(value = "check[]") List<String> checkArr,
      @RequestParam(value = "check2[]") List<String> checkArr2,
      @RequestParam(value = "check3[]") List<String> checkArr3, AdminBookDTO DTO) throws Exception {
    
    int e_book_num = 0;
    
    String img;
    String thumb;
    
    for(String i : checkArr) {
      //check arr내부 값을 i로 차례대로 꺼냄
      e_book_num = Integer.parseInt(i);
      //꺼낸값 변수에 변환해 저장
      DTO.setE_book_num(e_book_num);
      service.adminBookDelete(DTO);
     }
    for(String i : checkArr2) {
      //check arr내부 값을 i로 차례대로 꺼냄
      img= i;
      //꺼낸값 변수에 변환해 저장
      File oldFile = new File(uploadPath+File.separator+img);
      if(oldFile.exists()) {
        oldFile.delete();
      }   
     }
    for(String i : checkArr3) {
      //check arr내부 값을 i로 차례대로 꺼냄
      thumb = i;
      //꺼낸값 변수에 변환해 저장
      File oldThumbnail = new File(uploadPath+File.separator+thumb);
      if(oldThumbnail.exists()) {
        oldThumbnail.delete();
      }
     }
  }
}
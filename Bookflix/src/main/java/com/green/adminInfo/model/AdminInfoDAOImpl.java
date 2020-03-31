package com.green.adminInfo.model;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.adminInfo.domain.AdminInfoDTO;

@Repository
public class AdminInfoDAOImpl implements AdminInfoDAO {

  @Inject
  private SqlSession sql;

  private static String namespace = "com.green.mapper.adminInfoMapper";

  // 공지사항 총 갯수
  @Override
  public int countNotice(AdminInfoDTO dto) throws Exception {
    return sql.selectOne(namespace + ".adminnoticecount", dto);
  }

  // 공지사항 목록
  @Override
  public List<AdminInfoDTO> noticelistPage(int displayPost, int postNum, AdminInfoDTO dto) throws Exception {

    HashMap data = new HashMap();

    String keyword = dto.getKeyword();
    String searchType = dto.getSearchType();

    data.put("displayPost", displayPost);
    data.put("postNum", postNum);
    data.put("keyword", keyword);
    data.put("searchType", searchType);

    return sql.selectList(namespace + ".noticelistPage", data);
  }

  // 공지사항 작성
  @Override
  public void writeNotice(AdminInfoDTO dto) throws Exception {
    sql.insert(namespace + ".writeNotice", dto);
  }

  // 공지사항 삭제
  @Override
  public void deleteNotice(AdminInfoDTO dto) throws Exception {
    sql.delete(namespace + ".deleteNotice", dto);
  }

  // 공지사항 수정(내용 불러오기)
  @Override
  public AdminInfoDTO viewNotice(int notice_num) throws Exception {
    return sql.selectOne(namespace + ".viewNotice", notice_num);
  }

  // 공지사항 수정
  @Override
  public void modifyNotice(AdminInfoDTO dto) throws Exception {
    sql.update(namespace + ".modifyNotice", dto);
  }

  // FAQ 총 갯수
  @Override
  public int countFAQ(AdminInfoDTO dto) throws Exception {
    return sql.selectOne(namespace + ".adminfaqcount", dto);
  }

  // FAQ 목록
  @Override
  public List<AdminInfoDTO> faqlistPage(int displayPost, int postNum, AdminInfoDTO dto) throws Exception {

    HashMap data = new HashMap();

    String keyword = dto.getKeyword();
    String searchType = dto.getSearchType();

    data.put("displayPost", displayPost);
    data.put("postNum", postNum);
    data.put("keyword", keyword);
    data.put("searchType", searchType);

    return sql.selectList(namespace + ".faqlistPage", data);
  }

  // FAQ 작성
  @Override
  public void writeFAQ(AdminInfoDTO dto) throws Exception {
    sql.insert(namespace + ".writeFAQ", dto);
  }
  
  // FAQ 삭제
  @Override
  public void deleteFAQ(AdminInfoDTO dto) throws Exception {
    sql.delete(namespace + ".deleteFAQ", dto);
  }
  
// FAQ 수정(내용 불러오기)
 @Override
 public AdminInfoDTO viewFAQ(int faq_num) throws Exception {
   return sql.selectOne(namespace + ".viewFAQ", faq_num);
 }

 // FAQ 수정
 @Override
 public void modifyFAQ(AdminInfoDTO dto) throws Exception {
   sql.update(namespace + ".modifyFAQ", dto);
 }
}

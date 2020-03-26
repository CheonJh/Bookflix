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
  public int count() throws Exception {
    return sql.selectOne(namespace + ".adminInfocount");
  }

  // 공지사항 목록
  @Override
  public List listPage(int displayPost, int postNum) throws Exception {

    HashMap data = new HashMap();

    data.put("displayPost", displayPost);
    data.put("postNum", postNum);

    return sql.selectList(namespace + ".listPage", data);
  }

  // 공지사항 작성
  @Override
  public void write(AdminInfoDTO dto) throws Exception {
    sql.insert(namespace + ".write", dto);
  }

  // 공지사항 삭제
  @Override
  public void deleteNotice(AdminInfoDTO dto) throws Exception {
    sql.delete(namespace + ".deleteNotice", dto);
  }

  // 공지사항 수정(내용 불러오기)
  @Override
  public AdminInfoDTO view(int notice_num) throws Exception {
    return sql.selectOne(namespace + ".view", notice_num);
  }

  // 공지사항 수정
  @Override
  public void modify(AdminInfoDTO dto) throws Exception {
    sql.update(namespace + ".modify", dto);
  }

}

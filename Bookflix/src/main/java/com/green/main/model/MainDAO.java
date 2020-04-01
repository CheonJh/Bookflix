package com.green.main.model;

import java.util.List;

import com.green.main.domain.MainDTO;

public interface MainDAO {
  
//  인기도서 목록
  public List<MainDTO> favorite() throws Exception;
//  신간도서 목록
  public List<MainDTO> newbook() throws Exception;

}

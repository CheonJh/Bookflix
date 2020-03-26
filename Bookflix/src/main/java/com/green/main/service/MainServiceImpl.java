package com.green.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.main.domain.MainDTO;
import com.green.main.model.MainDAO;


@Service
public class MainServiceImpl implements MainService {

  @Inject
  private MainDAO dao;
  
  // 인기도서
  @Override
  public List<MainDTO> favorite() throws Exception {
    
    return dao.favorite();
  }
  // 신간도서
  @Override
  public List<MainDTO> newbook() throws Exception {
   
    return dao.newbook();
  }

}

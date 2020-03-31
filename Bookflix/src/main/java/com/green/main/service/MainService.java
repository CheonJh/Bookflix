package com.green.main.service;

import java.util.List;

import com.green.main.domain.MainDTO;

public interface MainService {
    
    // 인기도서
    public List<MainDTO> favorite() throws Exception;
    // 신간도서
    public List<MainDTO> newbook() throws Exception;
}

package com.green.search.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.search.model.SearchDAO;


@Service
public class SearchServiceImpl implements SearchService {
  // DAO
  @Inject
  private SearchDAO dao;
}

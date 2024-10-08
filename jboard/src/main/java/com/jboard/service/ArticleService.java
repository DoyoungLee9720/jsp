package com.jboard.service;

import java.util.List;

import com.jboard.dao.ArticleDao;
import com.jboard.dto.ArticleDto;
import com.jboard.dto.PageGroupDto;
import com.jboard.util.SQL;

public enum ArticleService {
	
	INSTANCE;
	
	private ArticleDao dao = ArticleDao.getInstance();
	
	//전체 게시물 갯수에서 마지막 페이지 번호 구하기
	public int getLastPageNum(int total) {
		int lastpageNum = 0;
		if(total %10==0) {
			lastpageNum = total / 10;
		}else {
			lastpageNum = total / 10 + 1;
		}
		return lastpageNum;
	}
	
	//페이지 시작번호(limit용)
	public int getStartNum(int currentpage) {
		return (currentpage -1)*10;
	}
	//현재 페이지번호 구하기
	public int getCurrentPage(String pg) {
		int currentPage =1;
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}
	//현재 페이지의 글번호 구하기
	public int getCurrentNumber(int total, int currentPage) {
		return (total - (currentPage-1)*10);
	}
	//현재 페이지 그룹 구하기
	public  PageGroupDto getCurrentPageGroup(int currentPage) {
		int currentPageGroup = (int)Math.ceil(currentPage / 10.0);
		int pageGroupStart = (currentPageGroup -1) * 10 + 1;
		int pageGroupEnd = currentPageGroup * 10;
		
		return  new PageGroupDto(pageGroupStart,pageGroupEnd);
	}
	
	
	public int insertArticle(ArticleDto dto) {
		return dao.insertArticle(dto);
	}
	
	public ArticleDto selectArticle(String no) {
		return dao.selectArticle(no);
	}
	
	public List<ArticleDto> selectArticles(int start) {
		return dao.selectArticles(start);
	}
	
	public void updateArticle(ArticleDto dto) {
		dao.updateArticle(dto);
	}	
	
	public int deleteArticle(String no) {
		return dao.deleteArticle(no);
	}	
	public int selectCountTotal() {
		return dao.selectCountTotal();
	}
	public void updateHitCount(String no) {
		dao.updateHitCount(no);
	}
}

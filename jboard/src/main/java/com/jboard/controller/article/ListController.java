package com.jboard.controller.article;

import java.io.IOException;
import java.util.List;

import com.jboard.dto.ArticleDto;
import com.jboard.dto.PageGroupDto;
import com.jboard.dto.UserDto;
import com.jboard.service.ArticleService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/article/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private ArticleService articleservice = ArticleService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pg = req.getParameter("pg");
		
		//현재 페이지 번호 구하기
		int currentPage = articleservice.getCurrentPage(pg);
		
		//전체 게시물 갯수 구하기
		int total = articleservice.selectCountTotal();
		
		//마지막 페이지 번호 구하기
		int lastPageNum = articleservice.getLastPageNum(total);
		
		
		//현재 페이지 그룹 구하기
		PageGroupDto pageGroup = articleservice.getCurrentPageGroup(currentPage);

		//페이지 시작 번호 구하기
		int start = articleservice.getStartNum(currentPage);
		int currentNumber = articleservice.getCurrentNumber(total, currentPage);
		//데이터 조회
		List<ArticleDto> articles = articleservice.selectArticles(start);
		req.setAttribute("articles", articles);
		req.setAttribute("lastPageNum", lastPageNum); 
		req.setAttribute("pageGroup", pageGroup);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("currentNumber", currentNumber);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/list.jsp");
		dispatcher.forward(req, resp);
	}
	
}









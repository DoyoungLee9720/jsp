package com.jboard.controller.article;

import java.io.IOException;
import java.util.List;

import com.jboard.dto.ArticleDto;
import com.jboard.dto.CommentDto;
import com.jboard.dto.FileDto;
import com.jboard.service.ArticleService;
import com.jboard.service.CommentService;
import com.jboard.service.FileService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/view.do")
public class ViewController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	//private FileService fileservice = FileService.INSTANCE;
	private CommentService commentService = CommentService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		String pg = req.getParameter("pg");
		
		//데이터 조회
		ArticleDto articleDto = service.selectArticle(no);
		//조회수 증가
		service.updateHitCount(no);
		//파일 조회
		//List<FileDto> fileDto = fileservice.selectFiles(no);
		//댓글 조회
		List<CommentDto> comments = commentService.selectComments(no);
		
		//공유 참조
		req.setAttribute("articleDto", articleDto);
		req.setAttribute("pg", pg);
		req.setAttribute("comments", comments);
		//req.setAttribute("fileDto", fileDto);
		//포워드 (화면출력)
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/view.jsp");
		dispatcher.forward(req, resp);
	}
	
}









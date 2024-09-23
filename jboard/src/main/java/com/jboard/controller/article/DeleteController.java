package com.jboard.controller.article;

import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.jboard.dto.CommentDto;
import com.jboard.service.ArticleService;
import com.jboard.service.CommentService;
import com.jboard.service.FileService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/delete.do")
public class DeleteController extends HttpServlet{

	private static final long serialVersionUID = 5903808803237119629L;
	private CommentService commentservice = CommentService.INSTANCE;
	private FileService fileservice = FileService.INSTANCE;
	private ArticleService articleservice = ArticleService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass()); 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		
		//댓글 삭제
		int resultComment = commentservice.deleteComment(no);
		int resultFile = fileservice.deletetFile(no);
		int resultArticle= articleservice.deleteArticle(no);
		
		//JSON 생성/출력
		JsonObject json = new JsonObject();
		//json.addProperty("result", result);
		
		PrintWriter writer = resp.getWriter();
		writer.print(json);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}
}
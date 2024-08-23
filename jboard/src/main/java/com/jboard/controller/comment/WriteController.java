package com.jboard.controller.comment;

import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;
import com.jboard.dto.CommentDto;
import com.jboard.service.CommentService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/comment/write.do")
public class WriteController extends HttpServlet{

	private static final long serialVersionUID = 5903808803237119629L;
	private CommentService service = CommentService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass()); 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//폼 데이터 수신
		String parent = req.getParameter("parent");
		String comment = req.getParameter("comment");
		String writer = req.getParameter("writer");
		String regip = req.getRemoteAddr();
		String pg = req.getParameter("pg");
		//DTO 생성
		CommentDto dto = new CommentDto();
		dto.setParent(parent);
		dto.setContent(comment);
		dto.setWriter(writer);
		dto.setRegip(regip);
		logger.debug(dto.toString());
		
		//댓글 등록
		service.insertComment(dto);
		
		// JSON 생성 및 출력
		JsonObject json = new JsonObject();
		//json.addProperty("nick", commentDto.getNick());
		//json.addProperty("rdate", commentDto.getRdate());
		//json.addProperty("content", commentDto.getContent());
		
		
		PrintWriter printwriter = resp.getWriter();
		printwriter.print(json);
		
		//라디아렉트
		//resp.sendRedirect("/jboard/article/view.do?no="+parent +"&pg="+pg);
	}
}

package com.jboard.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.ArticleDto;
import com.jboard.dto.FileDto;
import com.jboard.util.DBHelper;
import com.jboard.util.SQL;

public class ArticleDao extends DBHelper {
	
	private static ArticleDao instance = new ArticleDao();
	public static ArticleDao getInstance() {
		return instance;
	}
	private ArticleDao() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insertArticle(ArticleDto dto) {
		int no =0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getFile());
			psmt.setString(4, dto.getWriter());
			psmt.setString(5, dto.getRegip());
			psmt.executeUpdate();
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(SQL.SELECT_MAX_NO);
			
			if(rs.next()) {
				no = rs.getInt(1);
			}
			conn.commit();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			try {
				conn.rollback();
			} catch (Exception e2) {
				logger.error(e2.getMessage());
			}
		}finally {
			closeAll();
		}
		return no;
	}
	public int selectCountTotal() {
		int total = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_COUNT_TOTAL);
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return total;
	}
	public ArticleDto selectArticle(String no) {
		ArticleDto article = null;
		List<FileDto> files = new ArrayList<FileDto>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				//처음에는 article 이 널 이기때문에 한번만 최초로 실행하기 위함
				if(article ==null) {
					article = new ArticleDto();
					article.setNo(rs.getInt(1));
					article.setCate(rs.getString(2));
					article.setTitle(rs.getString(3));
					article.setContent(rs.getString(4));
					article.setComment(rs.getInt(5));
					article.setFile(rs.getInt(6));
					article.setHit(rs.getInt(7));
					article.setWriter(rs.getString(8));
					article.setRegip(rs.getString(9));
					article.setRdate(rs.getString(10));
				}
				
				FileDto fileDto = new FileDto();
				fileDto.setFno(rs.getInt(11));
				fileDto.setAno(rs.getInt(12));
				fileDto.setoName(rs.getString(13));
				fileDto.setsName(rs.getString(14));
				fileDto.setDownload(rs.getInt(15));
				fileDto.setRdate(rs.getString(16));
				files.add(fileDto);
			}
			article.setFiles(files);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return article;
	}
	
	public List<ArticleDto> selectArticles(int start) {
		List<ArticleDto> articles = new ArrayList<ArticleDto>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
			psmt.setInt(1, start);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ArticleDto article= new ArticleDto();
				article.setNo(rs.getInt(1));
				article.setCate(rs.getString(2));
				article.setTitle(rs.getString(3));
				article.setContent(rs.getString(4));
				article.setComment(rs.getInt(5));
				article.setFile(rs.getInt(6));
				article.setHit(rs.getInt(7));
				article.setWriter(rs.getString(8));
				article.setRegip(rs.getString(9));
				article.setRdateSubString(rs.getString(10));
				article.setNick(rs.getString(11));
				articles.add(article);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return articles;
	}
	
	public void updateArticle(ArticleDto dto) {
		
	}	
	
	public void deleteArticle(int no) {
		
	}
	public void updateHitCount(String no) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_HIT_COUNT);
			psmt.setString(1, no);
			psmt.executeUpdate();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
	}
}







package com.jboard.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.FileDto;
import com.jboard.util.DBHelper;
import com.jboard.util.SQL;

public class FileDao extends DBHelper{
	private static FileDao instance = new FileDao();
	public static FileDao getInstance() {
		return instance;
	}
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private FileDao() {}
	
	public void insertFile(FileDto dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_FILE);	
			psmt.setInt(1, dto.getAno());
			psmt.setString(2, dto.getoName());
			psmt.setString(3, dto.getsName());
			psmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	public FileDto selectFile(String fno) {
		FileDto fileDto = null;
		try {
			conn = getConnection();
			psmt= conn.prepareStatement(SQL.SELECT_FILE);
			psmt.setString(1, fno);
			rs = psmt.executeQuery();
			if(rs.next()) {
				fileDto = new FileDto();
				fileDto.setFno(rs.getInt(1));
				fileDto.setAno(rs.getInt(2));
				fileDto.setoName(rs.getString(3));
				fileDto.setsName(rs.getString(4));
				fileDto.setDownload(rs.getInt(5));
				fileDto.setRdate(rs.getString(6));
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return fileDto;
	}
	public List<FileDto> selectFiles() {
		
		return null;
	}
	public void updatetFile(FileDto dto) {}
	public void updateFileDownloadCount(String fno) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_FILE_DOWNLOAD_COUNT);
			psmt.setString(1, fno);
			psmt.executeUpdate();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
	}
	public int deletetFile(String ano) {
		int result = 0;
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_FILE);
			psmt.setString(1, ano);
			result = psmt.executeUpdate();
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return result;
	}
	
}

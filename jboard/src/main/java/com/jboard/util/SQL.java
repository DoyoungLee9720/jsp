package com.jboard.util;

public class SQL {
	
	
	public static final String SELECT_TERMS = "select * from terms";
	
	//user
	public static final String SELECT_COUNT_USER = "SELECT COUNT(*) FROM `user` ";
	public static final String WHERE_UID  = "WHERE `uid`=?";
	public static final String WHERE_NICK = "WHERE `nick`=?";
	public static final String WHERE_EMAIL = "WHERE `email`=?";
	public static final String WHERE_HP = "WHERE `hp`=?";
	
	public static final String SELECT_USER = "select * from `user` where `uid`=? and `pass`=SHA2(?,256)";
	public static final String INSERT_USER = "insert into user set "
											+ "`uid`=?,"
											+ "`pass`=SHA2(?, 256),"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`regDate`=NOW()";
	
	//article
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM `article`";
	public static final String SELECT_ARTICLE ="SELECT * FROM `article` AS a "
												+ "left JOIN `file` AS b ON a.`no` = b.`ano` "
												+ "where `no`=?";
	
	public static final String SELECT_ARTICLES = "SELECT a.*, u.nick FROM `article` AS a "
												+ "JOIN	`user` AS u ON a.writer = u.uid "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";
	public static final String SELECT_MAX_NO = "select MAX(`no`) from `article`";
	public static final String INSERT_ARTICLE = "insert into article set "
											+ "`title`=?,"
											+ "`content`=?,"
											+ "`file`=?,"											
											+ "`writer`=?,"
											+ "`regip`=?,"
											+ "`rdate`=NOW()";
	
	public static final String UPDATE_HIT_COUNT = "update article set `hit` = `hit` + 1 where `no`=?";
	//comment
	public static final String SELECT_COMMENT = "SELECT * FROM `comment` where `no`= ?";
	public static final String SELECT_COMMENTS = "SELECT a.*, b.nick fROM `comment` AS a "
													+ "JOIN `user` AS b ON a.writer = b.uid "
													+ "WHERE `parent` = ?;";
	public static final String INSERT_COMMENT = "INSERT into comment set "
											+ "`parent`=?, "
											+ "`content`=?, "
											+ "`writer`=?, "
											+ "`regip`=?, "
											+ "`rdate`=now() ";
	public static final String UPDATE_COMMENT = "UPDATE `comment` set `content`=? where `no` = ?";
	public static final String DELETE_COMMENT = "DELETE FROM `comment` where `no`=?";
	//file
	public static final String DELETE_FILE = "DELETE FROM `file` where `ano`=?";
	public static final String SELECT_FILE = "SELECT * FROM `file` where `fno`=?";
	public static final String INSERT_FILE = "insert into file set "
											+ "`ano`=?,"
											+ "`oName` = ?,"
											+ "`sName` = ?,"
											+ "`rdate` = now()";
	public static final String UPDATE_FILE_DOWNLOAD_COUNT = "update file set `download` = `download` + 1 where `fno`=?";
}

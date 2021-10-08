package com.toymarktet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toymarket.utils.MybatisUtils;
import com.toymarket.vo.Board;


public class BoardDao {

	private SqlSessionFactory sqlSessionFactory;
	private static BoardDao instance = new BoardDao();
	private BoardDao() {
		sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	public static BoardDao getInstance() {
		return instance;
	}
	
	public List<Board> getBoards(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> boards = session.selectList("boards.getBoards", param);
		session.close();
		return boards;
	}
	
	public int getTotalBoards(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("boards.getTotalBoards", param);
		session.close();
		return totalRows;
	}
	
	public void insertBoard(Board board) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("boards.insertBoard", board);
		session.close();
	}
	
	public Board getBoardByNo(int boardNo) {
		SqlSession session = sqlSessionFactory.openSession();
		Board board = session.selectOne("boards.getBoardByNo", boardNo);
		session.close();
		return board;
	}
	
	public void updateBoard(Board board) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("updateBoard", board);
		session.close();
	}
}

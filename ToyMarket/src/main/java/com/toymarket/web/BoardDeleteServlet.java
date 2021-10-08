package com.toymarket.web;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;

import org.apache.commons.lang3.math.NumberUtils;

import com.toymarket.vo.Board;
import com.toymarket.vo.Customer;
import com.toymarktet.dao.BoardDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/boarddelete")
public class BoardDeleteServlet extends HttpServlet {

	BoardDao boardDao = BoardDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인여부를 체크하기
		HttpSession session = request.getSession();
		Customer loginUser = (Customer) session.getAttribute("LOGINED_USER_INFO");
		if (loginUser == null) {
			response.sendRedirect("../user/loginSelect?fail=deny&job=" + URLEncoder.encode("글등록", "utf-8"));
			return;
		}
		
		// 요청파라미터에서 삭제할 글 번호를 조회한다.
		int boardNo = NumberUtils.toInt(request.getParameter("no"));
		Board board = boardDao.getBoardByNo(boardNo);
		
		// 글번호에 해당하는 게시글의 삭제여부 및 최종수정일, 최종삭제일을 저장하고 데이터베이스에 반영한다.
		if (board.getUserId().equals(loginUser.getId())) {
			board.setDeleted("Y");
			board.setUpdatedDate(new Date());
			board.setDeletedDate(new Date());
			boardDao.updateBoard(board);
		}
		
		// 페이징처리를 위한 QueryString을 생성하기위해서 요청파라미터에서 페이지번호, 검색옵션, 검색어를 조회한다.
		int pageNo = NumberUtils.toInt(request.getParameter("page"));
		
		// 게시글 목록을 재요청하는 URL을 응답으로 보낸다.
		response.sendRedirect("/boardlist?page=" + pageNo);
	}
}

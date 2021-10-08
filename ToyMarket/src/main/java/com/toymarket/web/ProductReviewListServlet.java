package com.toymarket.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.math.NumberUtils;

import com.google.gson.Gson;
import com.toymarket.dto.ProductInquiryDto;
import com.toymarket.dto.ProductReviewDto;
import com.toymarket.vo.Pagination;
import com.toymarket.vo.ReviewPagination;
import com.toymarktet.dao.ProductInquiryDao;
import com.toymarktet.dao.ProductReviewDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/product/review/list")
public class ProductReviewListServlet extends HttpServlet {
	
	// 한 페이지당 표시할 게시글 행의 갯수
	private static final int ROWS_PER_PAGE = 7;
	// 페이지블록 당 한번에 표시할 페이지번호 갯수
	private static final int PAGES_PER_PAGE_BLOCK = 5;
	
	ProductReviewDao productReviewDao = ProductReviewDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// XMLHttpRequest가 서버로 보낸 상품번호 조회
		int productNo = Integer.parseInt(req.getParameter("productNo"));
		// 페이지번호 조회하기
		int pageNo = NumberUtils.toInt(req.getParameter("page"), 1);
		String sort = req.getParameter("sort");
		
		// SQL 실행에 필요한 파라미터값을 담는 HashMap객체 생성하기
		Map<String, Object> param = new HashMap<String, Object>();
		
		// 받아오는 sort값이 null 이면 기본값으로 "신상품순"을 준다.
		if (sort == null) {
			sort = "최근등록순";
		}
		
		// 리스트 정렬
		param.put("sort", sort);
		// 조회범위를 HashMap객체에 추가하기
		param.put("beginIndex", (pageNo -1) * ROWS_PER_PAGE + 1);
		param.put("endIndex", pageNo * ROWS_PER_PAGE);
		param.put("productNo", productNo);
		// 상품번호에 해당하는 상품에 포함된 문의리스트 조회
		List<ProductReviewDto> reviewList = productReviewDao.getReviewList(param);
		
		// HashMap객체에 추가된 파라미터값으로 게시글 갯수 조회하기
		int totalRows = productReviewDao.getTotalRows(param);
		// 전체 페이지 갯수 계산하기
		int totalPages = (int) Math.ceil((double) totalRows/ROWS_PER_PAGE);
		// 전체 페이지블록 갯수 계산하기
		int totalPageBlocks = (int) Math.ceil((double) totalPages/PAGES_PER_PAGE_BLOCK);
		// 요청한 페이지번호가 속하는 페이지블록번호 계산하기
		int currentPageBlock = (int) Math.ceil((double) pageNo/PAGES_PER_PAGE_BLOCK);
		// 현재 페이지블록의 시작페이지 번화 끝 페이지번호를 계산하기
		int beginPage = (currentPageBlock - 1)*PAGES_PER_PAGE_BLOCK + 1;
		int endPage = currentPageBlock*PAGES_PER_PAGE_BLOCK;
		if (currentPageBlock == totalPageBlocks) {
			endPage = totalPages;
		}
		// 페이징처리에 필요한 정보를 Pagination객체에 저장하기
		ReviewPagination pagination = new ReviewPagination();
		pagination.setPageNo(pageNo);
		pagination.setTotalRows(totalRows);
		pagination.setTotalPages(totalPages);
		pagination.setTotalPageBlocks(totalPageBlocks);
		pagination.setCurrentPageBlock(currentPageBlock);
		pagination.setBeginPage(beginPage);
		pagination.setEndPage(endPage);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("reviewList", reviewList);
		data.put("reviewPagination", pagination);
		
		// 획득된 문의리스트정보를 JSON 형식의 텍스트로 변환
		Gson gson = new Gson();
		String jsonText = gson.toJson(data);
		
		// JSON 형식의 텍스트로 변환된 문의리스트정보를 응답으로 보낸다.
		res.setContentType("application/json; charset=utf-8");
		PrintWriter writer = res.getWriter();
		writer.println(jsonText);
	}
}


package com.toymarket.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

import com.toymarket.vo.Customer;
import com.toymarket.vo.Pagination;
import com.toymarktet.dao.CustomerDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admincustomerinfo")
public class CustomerInfoServlet extends HttpServlet {
	
	// 한 페이지당 표시할 게시글 행의 갯수
	private static final int ROWS_PER_PAGE = 10;
	// 페이지 블록 당 한번에 표시할 페이지번호 갯수
	private static final int PAGES_PER_PAGE_BLOCK = 5;
	
	CustomerDao customerDao = CustomerDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 페이지번호 조회하기
		int pageNo = NumberUtils.toInt(req.getParameter("page"), 1);
		// 검색조건 조회하기 
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		int fage = NumberUtils.toInt(req.getParameter("fage"));
		int sage = NumberUtils.toInt(req.getParameter("sage"));
		
		
		
		System.out.println(gender + "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		// SQL 실행에 필요한 파라미터값을 담는 HashMap객체 생성하기
		Map<String, Object> param = new HashMap<String, Object>();
		Customer cus = new Customer();
		
		////////////////////////////////////////////////////////////////////////////////
		// 게시글조회하기
		/////////////////////////////////////////////////////////////////////////////////
		// 검색조건이 존재하는경우 HashMap객체에 추가하기
		if (StringUtils.isNoneBlank(id)) {
			param.put("id", id);
		}
		if (StringUtils.isNoneBlank(name)) {
			param.put("name", name);
		}
		if (StringUtils.isNoneBlank(gender)) {
			param.put("gender", gender);
		}
		System.out.println(param + "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		// 나이를 년도로 바꾸고 0이 아니면 값을 집어넣기
		fage = cus.getAge(fage);
		sage = cus.getAge(sage);
		
		param.put("fage", fage);
		param.put("sage", sage);
		
		
		// 조회범위를 HashMap객체에 추가하기
		param.put("beginIndex", (pageNo - 1)*ROWS_PER_PAGE + 1);
		param.put("endIndex", pageNo*ROWS_PER_PAGE);
		// HashMap객체에 추가된 파라미터값으로 게시글 조회하기
		List<Customer> customers = customerDao.getCustomers(param);
		// 조회된 게시글을 요청객체의 속성으로 저장하기
		req.setAttribute("customers", customers);
		
		////////////////////////////////////////////////////////////////////////////////////
		// 페이징처리하기
		////////////////////////////////////////////////////////////////////////////////////
		// HashMap객체에 추가된 파라미터값으로 게시글 갯수 조회하기
		int totalRows = customerDao.cGetTotalRows(param);
		// 전체 페이지 갯수 계산하기
		int totalPages = (int) Math.ceil((double) totalRows/ROWS_PER_PAGE);
		// 전체 페이지블록 갯수 계산하기
		int totalPageBlocks = (int) Math.ceil((double) totalPages/PAGES_PER_PAGE_BLOCK);
		// 요청한 페이지번호가 속하는 페이지블록번호 계산하기
		int currentPageBlock = (int) Math.ceil((double) pageNo/PAGES_PER_PAGE_BLOCK);
		// 현재 페이지블록의 시작페이지 변화 끝 페이지번호를 계산하기
		int beginPage = (currentPageBlock - 1)*PAGES_PER_PAGE_BLOCK + 1;
		int endPage = currentPageBlock*PAGES_PER_PAGE_BLOCK;
		if (currentPageBlock == totalPageBlocks) {
			endPage = totalPages;
		}
		// 페이징처리에 필요한 정보를 Pagination객체에 저장하기
		Pagination pagination = new Pagination();
		pagination.setPageNo(pageNo);
		pagination.setTotalRows(totalRows);
		pagination.setTotalPages(totalPages);
		pagination.setTotalPageBlocks(totalPageBlocks);
		pagination.setCurrentPageBlock(currentPageBlock);
		pagination.setBeginPage(beginPage);
		pagination.setEndPage(endPage);
		// 요청객체의 속성으로 Pagination객체를 저장하기
		req.setAttribute("pagination", pagination);
		
		
		
		System.out.println(customers + "#########################################################################");
		req.getRequestDispatcher("/WEB-INF/views/admin/customerInfo.jsp").forward(req, resp);
	}
}


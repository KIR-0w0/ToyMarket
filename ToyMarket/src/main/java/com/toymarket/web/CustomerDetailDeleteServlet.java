package com.toymarket.web;

import java.io.IOException;
import java.util.Date;
import java.util.StringJoiner;

import com.toymarket.vo.Customer;
import com.toymarktet.dao.CustomerDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admincustomerdetaildelete")
public class CustomerDetailDeleteServlet extends HttpServlet {

	CustomerDao customerDao = CustomerDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 로그인 여부 체크하기는 나중에 하기
		
		// 요청파라미터에서 삭제할 회원번호를 조회한다.
		int customerNo = Integer.parseInt(req.getParameter("no"));
		Customer customer = customerDao.getCustomerByNo(customerNo);
		
		
		// 회원번호에 해당하는 회원정보의 삭제여부및 사제일을 저장하고 데이터베이스에 반영한다.
		customer.setStatus("Y");
		customer.setDeletedDate(new Date());
		
		customerDao.updateCustomer(customer);
		
		// 페이징처리를 위한 요청파라미터값 받아오기
		int pageNo = Integer.parseInt(req.getParameter("page"));
		String searchName = req.getParameter("name");
		int searchFage = 0;
		int searchSage = 0;
		if (req.getParameter("fage") != null) {
			searchFage = Integer.parseInt(req.getParameter("fage"));
		}
		if (req.getParameter("sage") != null) {
			searchSage = Integer.parseInt(req.getParameter("sage"));
		}
		String searchId = req.getParameter("id");
		String searchGender = req.getParameter("gender");
		// 리다이렉트로 한글을 보내면 깨짐 ...
		
		String eGender = null;
		if (searchGender != null) {
			if (searchGender.equals("남자")) {
				eGender = "men";
			}
			if (searchGender.equals("여자")) {
				eGender = "women";
			}
		}
		
		System.out.println(searchGender + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$%%%%%%%%%%%%%");
		// QueryString을 생성
		StringJoiner joiner = new StringJoiner("&");
		joiner.add("page=" + pageNo);
		if (searchName != null) {
			joiner.add("name=" + searchName);
		}
		if (searchFage != 0 && searchSage != 0) {
			joiner.add("fage=" + searchFage);
			joiner.add("sage=" + searchSage);
		}
		if (searchId != null) {
			joiner.add("id=" + searchId);
		}
		if (eGender != null) {
			joiner.add("gender=" + eGender);
		}
		
		System.out.println(joiner + "--------------------------------------------------");
		
		// 게시글 목록을 재요청하는 URL을 응답으로 보낸다.
		resp.sendRedirect("admincustomerinfo?" + joiner.toString());
		
		
		
		
	}
}

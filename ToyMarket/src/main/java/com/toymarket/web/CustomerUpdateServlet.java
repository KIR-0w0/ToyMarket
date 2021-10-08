package com.toymarket.web;

import java.io.IOException;

import com.toymarket.vo.Customer;
import com.toymarktet.dao.CustomerDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admincustomerupdate")
public class CustomerUpdateServlet extends HttpServlet {

	CustomerDao customerDao = CustomerDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청파라미터에서 복구할 고객번호를 조회한다.
		int customerNo = Integer.parseInt(req.getParameter("no"));
		Customer customer = customerDao.getCustomerByNo(customerNo);
		// 고객번호로 조회한 고객정보를 탈퇴여부를 바꾸고 탈퇴날짜를 삭제한다.
		customer.setStatus("N");
		customer.setDeletedDate(null);
		// update해서 db에 반영한다
		customerDao.updateCustomer(customer);
		
		// 페이징처리를 위한 QueryString을 생성하기 위해서 요청파라미터에서 페이지번호를 조회한다.
		int pageNo = Integer.parseInt(req.getParameter("page"));
		
		// 탈퇴한 회원정보를 재요청하는 URL을 응답으로 보낸다.
		resp.sendRedirect("admincustomerdelete?page=" + pageNo);
		
	}
}

package com.toymarket.web;

import java.io.IOException;
import java.util.List;

import com.toymarket.dto.order.CustomerOrderDto;
import com.toymarket.vo.Customer;
import com.toymarktet.dao.CustomerDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admincustomerdetail")
public class CustomerDetailServlet extends HttpServlet {
	
	CustomerDao customerDao = CustomerDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청파라미터에서 회원번호 받아오기
		int customerNo = Integer.parseInt(req.getParameter("no"));
		// 회원번호로 회원정보 받아오기
		Customer customer = customerDao.getCustomerByNo(customerNo);
		// 요청객체에 속성으로 회원정보를 저장하기
		req.setAttribute("customer", customer);
		
		// 회원번호로 주문내역 받아오기
		List<CustomerOrderDto> customerOrders = customerDao.getOrdersByCustomerNo(customerNo);
		// 요청객체에 속성으로 주문내역을 저장하기
		req.setAttribute("customerOrders", customerOrders);
		
		req.getRequestDispatcher("WEB-INF/views/admin/customerDetail.jsp").forward(req, resp);
	}
}

package com.toymarket.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.toymarket.dto.ProductInquiryDto;
import com.toymarket.vo.ProductInquiry;
import com.toymarket.vo.ProductReview;
import com.toymarket.vo.order.OrderItems;
import com.toymarktet.dao.ProductInquiryDao;
import com.toymarktet.dao.ProductReviewDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/product/review/insert")
public class ProductReviewInsertServlet extends HttpServlet {
	
	ProductReviewDao productReviewDao = ProductReviewDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		int productNo = Integer.parseInt(req.getParameter("productNo"));
		int customerNo = Integer.parseInt(req.getParameter("customerNo"));
		
		// SQL 실행에 필요한 파라미터값을 담는 HashMap객체 생성하기
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("productNo", productNo);
		param.put("customerNo", customerNo);
		
		OrderItems orderItems =	productReviewDao.checkOrderItemNo(param);
		int itemNo = orderItems.getItemNo(); 
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		ProductReview productReview = new ProductReview();
		productReview.setTitle(title);
		productReview.setContent(content);
		productReview.setItemNo(itemNo);
		
		productReviewDao.insertReview(productReview);
	}
}


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

@WebServlet("/product/review/update")
public class ProductReviewUpdateServlet extends HttpServlet {
	
	ProductReviewDao productReviewDao = ProductReviewDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int view = Integer.parseInt(req.getParameter("view"));
		int no = Integer.parseInt(req.getParameter("no"));
		
		ProductReview productReview = productReviewDao.getReviewByReviewNo(no);
		
		productReview.setViews(view + 1);
		
		productReviewDao.updateReviewView(productReview);
	}
}


package com.toymarket.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.toymarket.dto.ProductInquiryDto;
import com.toymarket.vo.ProductInquiry;
import com.toymarktet.dao.ProductInquiryDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/product/inquiry/insert")
public class ProductInquiryInsertServlet extends HttpServlet {
	
	ProductInquiryDao productInquiryDao = ProductInquiryDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		int productNo = Integer.parseInt(req.getParameter("productNo"));
		int customerNo = Integer.parseInt(req.getParameter("customerNo"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String secretYN = req.getParameter("secretYN");
		
		ProductInquiry productInquiry = new ProductInquiry();
		productInquiry.setProductNo(productNo);
		productInquiry.setCustomerNo(customerNo);
		productInquiry.setTitle(title);
		productInquiry.setContent(content);
		productInquiry.setSecretYN(secretYN);
		
		productInquiryDao.insertInquiry(productInquiry);
	}
}


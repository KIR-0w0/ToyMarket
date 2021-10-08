package com.toymarket.web;

import java.io.IOException;


import com.toymarket.dto.ProductWithCategoryDto;
import com.toymarktet.dao.AdminProductDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/product/detail")
public class AdminProductDetailServlet extends HttpServlet{
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AdminProductDao adminProductDao = AdminProductDao.getInstance();
		
		// 파라미터값 조회
		int productno = Integer.parseInt(req.getParameter("no"));
		
	
		
		ProductWithCategoryDto product = adminProductDao.getAllProductsWithCategory(productno);
		req.setAttribute("product", product);
		
		
		
		
		req.getRequestDispatcher("../../WEB-INF/views/admin/productDetail.jsp").forward(req, resp);
	}
}

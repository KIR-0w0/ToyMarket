package com.toymarket.web;

import java.io.IOException;
import java.util.List;


import com.toymarket.vo.Products;
import com.toymarktet.dao.ProductDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class MainServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProductDao productDao = ProductDao.getInstance();
		/* 할인 중인 상품 */
		List<Products> discountedProducts= productDao.getDiscountedProducts();
		request.setAttribute("discountedProducts", discountedProducts);
		
		/*MD추천(랜덤 상품)*/
		List<Products> randomProducts= productDao.getRandomProducts();
		request.setAttribute("randomProducts",randomProducts);
		
		request.getRequestDispatcher("/WEB-INF/views/customer/index.jsp").forward(request, response);
	}
}

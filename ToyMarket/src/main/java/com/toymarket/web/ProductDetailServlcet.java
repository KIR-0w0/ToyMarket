package com.toymarket.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.toymarket.dao.order.OrderDao;
import com.toymarket.vo.Customer;
import com.toymarket.vo.Products;
import com.toymarket.vo.order.OrderItems;
import com.toymarktet.dao.ProductDao;
import com.toymarktet.dao.ProductReviewDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/product/detail")
public class ProductDetailServlcet extends HttpServlet {
	
	ProductDao productDao = ProductDao.getInstance();
	ProductReviewDao productReviewDao = ProductReviewDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int productNo = Integer.parseInt(req.getParameter("productNo"));
		Products product = productDao.getProductDetail(productNo);
		
		req.setAttribute("product", product);
		HttpSession session = req.getSession();
		
		Customer customer = (Customer) session.getAttribute("LOGINED_USER_INFO");
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("productNo", productNo);
		
		if (customer != null) {
			param.put("customerNo", customer.getNo());
		} else {
			param.put("customerNo", 999999);
		}
		
		OrderItems check = productReviewDao.checkOrderItemNo(param);
		
		req.setAttribute("checkOrderItemNo", check);
		
		req.setAttribute("customer", customer);
		
		req.getRequestDispatcher("/WEB-INF/views/product/detail.jsp").forward(req, res);
	}
	
	
}


package com.toymarket.web;

import java.io.IOException;
import java.util.List;

import com.toymarket.vo.Products;
import com.toymarktet.dao.AdminProductDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
	

@WebServlet("/admin/product/delete")
public class AdminProductDeleteServlet extends HttpServlet{
	
	private AdminProductDao adminProductDao = AdminProductDao.getInstance();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int no = Integer.parseInt(req.getParameter("deleteNo"));
		adminProductDao.deleteProductsbyNo(no);
		
		resp.sendRedirect("/admin/product/list");
	}
}

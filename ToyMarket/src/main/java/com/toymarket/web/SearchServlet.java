package com.toymarket.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.toymarket.vo.Products;
import com.toymarktet.dao.ProductDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	@Override // hashMap으로 테스트
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String searchWord = request.getParameter("searchWord");
		String searchCategory = request.getParameter("searchCategory");

		Map<String, Object> searchType = new HashMap<String, Object>();
		
		if (searchWord != null && !searchWord.isBlank()) {
			searchType.put("searchWord", searchWord);
		}
		searchType.put("searchCategory", searchCategory);

	
		ProductDao productDao = ProductDao.getInstance();
		
		/*검색한 상품*/
		List<Products> searchedProducts = productDao.getProductsBySearchType(searchType);
		request.setAttribute("searchedProducts", searchedProducts);
		

		request.getRequestDispatcher("/WEB-INF/views/customer/search.jsp").forward(request, response);
	}
}

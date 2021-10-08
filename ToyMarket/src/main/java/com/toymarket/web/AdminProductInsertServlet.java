package com.toymarket.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;

import com.toymarket.vo.Category;
import com.toymarket.vo.Products;
import com.toymarktet.dao.AdminCategoryDao;
import com.toymarktet.dao.AdminProductDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/admin/product/insert")

@MultipartConfig
public class AdminProductInsertServlet extends HttpServlet{
	private static final String saveDirectory = "C:\\Users\\KIR\\workspace\\jinhyuk\\semi\\image";
	
	AdminCategoryDao adminCategoryDao = AdminCategoryDao.getInstance();
	AdminProductDao adminProductDao = AdminProductDao.getInstance();
	
	// get 요청으로 insert를 호출했을때
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 카테고리 정보 획득
		List<Category> category = adminCategoryDao.getAllCategories();
		
		RequestDispatcher rd = req.getRequestDispatcher("../../WEB-INF/views/admin/productInsert.jsp");
		
		req.setAttribute("category", category);
		
		rd.forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
		// 업로드 첨부파일 처리하기
		Part part = req.getPart("image");
		
		// 업로드된 첨부파일 정보 획득하기
		String image = System.currentTimeMillis() + part.getSubmittedFileName();
		
		// 첨부파일을 디스크에 저장하는 출려스트림 생성
		OutputStream out = new FileOutputStream(new File(saveDirectory, image));
		// 임시폴더에 저장된 첨부파일을 읽어오는 스트림 획득
		InputStream in = part.getInputStream();
		// 파일복사
		IOUtils.copy(in, out);
		out.close();
		
		
		
		String categoryNo = req.getParameter("categoryNo"); 
		String price = req.getParameter("price");
		String discountRate = req.getParameter("discountRate");
		String stock = req.getParameter("stock");
//		String category = req.getParameter("categoryNo"); 
//		if (category == null) {
//			category = "0"; 
//		}
//		int categoryNo = Integer.parseInt(category);
		String name = req.getParameter("name");
		String brand = req.getParameter("brand");
//		String pramPrice = req.getParameter("price").trim(); 
//		if (pramPrice == null) {
//			pramPrice = "0"; 
//		}
//		int price = Integer.parseInt(pramPrice);
//		String pramdiscountRate = req.getParameter("discountRate"); 
//		if (pramdiscountRate == null) {
//			pramdiscountRate = "0"; 
//		}
//		int  discountRate= Integer.parseInt(pramdiscountRate);
		String discountYN = req.getParameter("discountYN");
		String morningDeliveryYN = req.getParameter("morningDeliveryYN");
//		String pramstock = req.getParameter("stock"); 
//		if (pramstock == null) {
//			pramstock = "0"; 
//		}
//		int  stock = Integer.parseInt(pramdiscountRate);
		String status = req.getParameter("status");
		String sellUnit = req.getParameter("sellUnit");
		String weight = req.getParameter("weight");
		String description = req.getParameter("description");
		String subTitle = req.getParameter("subTitle");
		
		if(brand.isBlank() || name.isBlank() || sellUnit.isBlank() || weight.isBlank() || description.isBlank() || 
				categoryNo.isBlank() || price.isBlank()) {
			resp.sendRedirect("insert?fail=blank");
			return;	
		}
		
		Products product = new Products();
		product.setImage(image);
		product.setCategoryNo(Integer.parseInt(categoryNo));
		product.setName(name);
		product.setBrand(brand);
		product.setPrice(Integer.parseInt(price));
		if(!discountRate.isBlank()) {
			product.setDiscountRate(Double.parseDouble(discountRate)/100);
		}
		product.setDiscountYN(discountYN);
		product.setMorningDeliveryYN(morningDeliveryYN);
		product.setStock(Integer.parseInt(stock)); 
		product.setStatus(status);
		product.setSellUnit(sellUnit);
		product.setWeight(weight);
		product.setDescription(description);
		product.setSubTitle(subTitle);
		
		adminProductDao.insertProduct(product);
		
		resp.sendRedirect("/admin/product/list");
		
	}
}

package com.toymarktet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toymarket.utils.MybatisUtils;
import com.toymarket.vo.Products;

public class ProductDao {

	private SqlSessionFactory sqlSessionFactory;

	private static ProductDao instance = new ProductDao();

	private ProductDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}

	public static ProductDao getInstance() {
		return instance;
	}

	public List<Products> getDiscountedProducts() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Products> discountedProducts = session.selectList("products.getDiscountedProducts");
		session.close();
		return discountedProducts;
	}

	public List<Products> getAllProducts(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Products> products = session.selectList("products.getAllProducts", param);
		session.close();

		return products;
	}

	public int getTotalRows(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("products.getTotalRows", param);
		session.close();
		return totalRows;
	}

	public Products getProductDetail(int productNo) {
		SqlSession session = sqlSessionFactory.openSession();
		Products product = session.selectOne("products.getProductDetail", productNo);
		session.close();
		return product;
	}
	
	public List<Products> getProductsBySearchType(Map<String,Object> searchType) {
		SqlSession session = sqlSessionFactory.openSession();
		System.out.println("searchType 값 확인: "+searchType.toString());
		List<Products> searchedProducts= session.selectList("products.getProductsBySearchType",searchType);
		session.close();
		return searchedProducts;
	}
	
	public List<Products> getRandomProducts(){
		SqlSession session = sqlSessionFactory.openSession();
		List<Products> randomProducts = session.selectList("getRandomProducts");
		session.close();
		return randomProducts;
	}
}

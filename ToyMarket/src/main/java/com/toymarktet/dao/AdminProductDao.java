package com.toymarktet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toymarket.dto.ProductWithCategoryDto;
import com.toymarket.utils.MybatisUtils;
import com.toymarket.vo.Category;
import com.toymarket.vo.Products;

public class AdminProductDao {

private SqlSessionFactory sqlSessionFactory;
	
	private static AdminProductDao instance = new AdminProductDao();
	private AdminProductDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	public static AdminProductDao getInstance() {
		return instance; 
	}
	
	public ProductWithCategoryDto getAllProductsWithCategory(int productNo) {
		SqlSession session = sqlSessionFactory.openSession();
		ProductWithCategoryDto products = session.selectOne("getAllProductsWithCategory", productNo);
		session.close();
		
		return products;
	}
	
	public List<Products> deleteProductsbyNo(int deleteNo){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Products> deleteProducts = session.selectList("deleteById", deleteNo);
		session.close();
		return deleteProducts;
	}
	
	public int getTotalRows(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("products.getTotalRowsWithSearching", param);
		session.close();
		return totalRows;
	}
	
	public List<Products> getAllProductsList(Map<String, Object> param){
		SqlSession session = sqlSessionFactory.openSession();
		List<Products> products = session.selectList("products.getAllProductsList", param);
		session.close();
		return products;
	}
	
	public void insertProduct(Products product) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("insertProduct", product);
		session.close();
	}
	
	public void updateProduct(Products product) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("updateProduct", product);
		session.close();
	}
	
}

package com.toymarktet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toymarket.dto.ProductInquiryDto;
import com.toymarket.utils.MybatisUtils;
import com.toymarket.vo.ProductInquiry;

public class ProductInquiryDao {

private SqlSessionFactory sqlSessionFactory;
	
	private static ProductInquiryDao instance = new ProductInquiryDao();
	private ProductInquiryDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	public static ProductInquiryDao getInstance() {
		return instance; 
	}
	
	
	public List<ProductInquiryDto> getInquiryListByProductNo(int productNo) {
		SqlSession session = sqlSessionFactory.openSession();
		List<ProductInquiryDto> productInquiry = session.selectList("productInquiry.getInquiryListByProductNo", productNo);
		session.close();
		return productInquiry;
	}
	
	public List<ProductInquiryDto> getInquiryList(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		List<ProductInquiryDto> productInquiry = session.selectList("productInquiry.getInquiryList", param);
		session.close();
		return productInquiry;
	}
	
	public int getTotalRows(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("productInquiry.getTotalRows", param);
		session.close();
		return totalRows;
	}
	
	public void insertInquiry(ProductInquiry inquiry) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("productInquiry.insertInquiry", inquiry);
		session.close();
	}
	
}

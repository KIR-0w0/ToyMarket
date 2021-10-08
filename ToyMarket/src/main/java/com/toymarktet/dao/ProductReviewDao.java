package com.toymarktet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toymarket.dto.ProductReviewDto;
import com.toymarket.utils.MybatisUtils;
import com.toymarket.vo.ProductReview;
import com.toymarket.vo.order.OrderItems;

public class ProductReviewDao {

	private SqlSessionFactory sqlSessionFactory;

	private static ProductReviewDao instance = new ProductReviewDao();

	private ProductReviewDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}

	public static ProductReviewDao getInstance() {
		return instance;
	}

	public List<ProductReviewDto> getReviewList(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		List<ProductReviewDto> productReview = session.selectList("productReview.getReviewList", param);
		session.close();
		return productReview;
	}
	
	public OrderItems checkOrderItemNo(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		OrderItems check = session.selectOne("productReview.checkOrderItemNo", param);
		session.close();
		return check;
	}

	public int getTotalRows(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("productReview.getTotalRows", param);
		session.close();
		return totalRows;
	}
	
	public ProductReview getReviewByReviewNo(int reviewNo) {
		SqlSession session = sqlSessionFactory.openSession();
		ProductReview productReview = session.selectOne("productReview.getReviewByReviewNo", reviewNo);
		session.close();
		return productReview;
	}

	public void insertReview(ProductReview review) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("productReview.insertReview", review);
		session.close();
	}
	
	public void updateReviewView(ProductReview review) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("productReview.updateReviewView", review);
		session.close();
	}

}

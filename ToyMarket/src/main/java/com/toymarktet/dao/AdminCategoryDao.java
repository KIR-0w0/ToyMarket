package com.toymarktet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toymarket.utils.MybatisUtils;
import com.toymarket.vo.Category;

public class AdminCategoryDao {
	private SqlSessionFactory sqlsessionFactory;
	
	private static AdminCategoryDao instance = new AdminCategoryDao();
	private AdminCategoryDao() {
		this.sqlsessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	public static AdminCategoryDao getInstance() {
		return instance;
	}
	
	public List<Category> getAllCategories() {
		SqlSession session = sqlsessionFactory.openSession();
		List<Category> categoryName = session.selectList("getAllCategories");
		session.close();
		
		return categoryName;
	}
	

}

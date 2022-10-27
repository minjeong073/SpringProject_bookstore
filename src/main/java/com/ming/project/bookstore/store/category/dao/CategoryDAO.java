package com.ming.project.bookstore.store.category.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.project.bookstore.store.category.model.Category;

@Repository
public interface CategoryDAO {

	public int insertCategory(
			@Param("mall") String mall
			, @Param("CID") int CID
			, @Param("categoryName") String categoryName);
	
	public List<Category> selectCategoryList();
	
	public int selectCountCategory();
}

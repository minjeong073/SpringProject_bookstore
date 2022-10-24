package com.ming.project.bookstore.store.category.bo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.bookstore.store.category.dao.CategoryDAO;
import com.ming.project.bookstore.store.category.model.Category;

@Service
public class CategoryBO {

	@Autowired
	private CategoryDAO categoryDAO;
	
	// 카테고리 설정
	/* 
	 소설/시/희곡
	 인문학
	 경제 경영
	 여행
	 과학
	 청소년
	 자기계발
	 외국어
	 수험서/자격증
	 역사
	 어린이
	 컴퓨터/모바일
	 
	 */
	public boolean setCategory() {
		
		List<Integer> counts = new ArrayList<>(); 
				
		counts.add(categoryDAO.insertCategory("소설/시/희곡", 1));
		counts.add(categoryDAO.insertCategory("인문학", 656));
		counts.add(categoryDAO.insertCategory("경제경영", 90835));
		counts.add(categoryDAO.insertCategory("여행", 1196));
		counts.add(categoryDAO.insertCategory("과학", 987));
		counts.add(categoryDAO.insertCategory("청소년", 1137));
		counts.add(categoryDAO.insertCategory("자기계발", 336));
		counts.add(categoryDAO.insertCategory("외국어", 1322));
		counts.add(categoryDAO.insertCategory("수험서/자격증", 1383));
		counts.add(categoryDAO.insertCategory("역사", 74));
		counts.add(categoryDAO.insertCategory("어린이", 1108));
		counts.add(categoryDAO.insertCategory("컴퓨터/모바일", 351));
		
		for(Integer count : counts) {
			if (count == 1) {
				return true;
			}
			else {
				return false;
			}
		}
		
		return false;
	}
	
	// 카테고리 정보 가져오기
	public Category getCategoryByName(String categoryName) {
		return categoryDAO.selectCategoryByName(categoryName);
	}
}

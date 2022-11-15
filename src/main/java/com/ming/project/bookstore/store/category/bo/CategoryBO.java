package com.ming.project.bookstore.store.category.bo;

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
	public int setCategory() {
		
		categoryDAO.insertCategory("book", 1, "소설/시/희곡");
		categoryDAO.insertCategory("book", 656, "인문학");
		categoryDAO.insertCategory("book", 90835, "경제경영");
		categoryDAO.insertCategory("book", 1196, "여행");
		categoryDAO.insertCategory("book", 987, "과학");
		categoryDAO.insertCategory("book", 1137, "청소년");
		categoryDAO.insertCategory("book", 336, "자기계발");
		categoryDAO.insertCategory("book", 1322, "외국어");
		categoryDAO.insertCategory("book", 1383, "수험서/자격증");
		categoryDAO.insertCategory("book", 74, "역사");
		categoryDAO.insertCategory("book", 1108, "어린이");
		categoryDAO.insertCategory("book", 351, "컴퓨터/모바일");
		
		
		categoryDAO.insertCategory("foreign", 90831, "가정/원예/인테리어");
		categoryDAO.insertCategory("foreign", 90833, "건강/스포츠");
		categoryDAO.insertCategory("foreign", 90837, "교육/자료");
		categoryDAO.insertCategory("foreign", 30177, "대학교재");
		categoryDAO.insertCategory("foreign", 90850, "요리");
		categoryDAO.insertCategory("foreign", 90853, "인문/사회");
		categoryDAO.insertCategory("foreign", 90855, "자연과학");
		categoryDAO.insertCategory("foreign", 90856, "전기/자서전");
		categoryDAO.insertCategory("foreign", 90860, "한국관련도서");
		categoryDAO.insertCategory("foreign", 25557, "해외잡지");
		categoryDAO.insertCategory("foreign", 90861, "ELT/어학/사전");
		categoryDAO.insertCategory("foreign", 90859, "컴퓨터");
		
		
		return categoryDAO.selectCountCategory();
	}
	
	// 카테고리 리스트 가져오기
	public List<Category> getCategory() {
		return categoryDAO.selectCategoryList();
	}
}

package com.spring.webproject.dao;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.webproject.dto.AuthorDTO;
import com.spring.webproject.dto.BookSectionsDTO;
import com.spring.webproject.dto.BooksDTO;
import com.spring.webproject.dto.BooksImageDTO;
import com.spring.webproject.dto.ReviewDTO;
import com.spring.webproject.dto.SimpleReviewDTO;
import com.spring.webproject.dto.WareHouseDTO;

@Repository
public class BooksDAO {

	@Inject
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception {
		this.sessionTemplate = sessionTemplate;

	}

	// 책 정보 가져오기
	public BooksDTO getReadBookData(int isbn) {

		BooksDTO dto = sessionTemplate.selectOne("bookMapper.getReadBookData", isbn);
		return dto;
	}

	// 저자 정보 가져오기
	public AuthorDTO getReadAuthorData(int isbn) {

		AuthorDTO dto2 = sessionTemplate.selectOne("bookMapper.getReadAuthorData", isbn);
		return dto2;

	}

	// 북 미리보기 이미지 가져오기
	public List<BooksImageDTO> getReadBookImageData(int isbn) {

		List<BooksImageDTO> lists = sessionTemplate.selectList("bookMapper.getReadBookList", isbn);

		return lists;

	}

	// 북 커버 이미지 가져오기
	public String getReadBookImage(int isbn) {

		String str = sessionTemplate.selectOne("bookMapper.getReadBookImage", isbn);
		return str;
	}

	// 리뷰 테이블 가져오기

	public List<ReviewDTO> getReadReviewList(int start, int end, int isbn) {

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("start", start);
		params.put("end", end);
		params.put("isbn", isbn);

		List<ReviewDTO> lists = sessionTemplate.selectList("bookMapper.getReadReviewList", params);
		return lists;

	}

	// 심플리뷰 가져오기
	public List<SimpleReviewDTO> getReadSimpleReviewList(int isbn) {
		List<SimpleReviewDTO> lists = sessionTemplate.selectList("bookMapper.getReadSimpleReviewList", isbn);
		return lists;
	}

	// 심플리뷰 입력하기
	public void insertSimpleReviewData(SimpleReviewDTO dto) {

		sessionTemplate.insert("bookMapper.insertSimpleReviewData", dto);
	}

	// 심플 리뷰 입력2
	public void insertSimpleReviewData2(String userId, int reviewId) {
		HashMap<String, Object> params2 = new HashMap<String, Object>();

		params2.put("userId", userId);
		params2.put("reviewId", reviewId);
		sessionTemplate.insert("bookMapper.insertSimpleReviewData2", params2);

	}

	// 리뷰 상세 정보 가져오기
	public ReviewDTO getReadReviewData(int reviewId) {
		ReviewDTO dto = sessionTemplate.selectOne("bookMapper.getReadReviewData", reviewId);
		return dto;
	}

	// 리뷰 테이블 개수 가져오기
	public int getReviewDataCount(int isbn) {
		int result = sessionTemplate.selectOne("bookMapper.getReviewDataCount", isbn);
		return result;
	}

	public int getSimpleReivewDataCount(int isbn) {
		int result = sessionTemplate.selectOne("bookMapper.getSimpleReivewDataCount", isbn);
		return result;

	}

	// 리뷰 맥스값 가져오기
	public int getMaxNum() {
		int maxNum = 0;

		maxNum = sessionTemplate.selectOne("bookMapper.getReadMaxNum");

		return maxNum;
	}

	// 리뷰 등록하기
	public void insertReviewData(ReviewDTO dto) {
		sessionTemplate.insert("bookMapper.insertReviewData", dto);
	}

	public void insertReviewThumbUpData(String userId, int reviewId) {
		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("userId", userId);
		params.put("reviewId", reviewId);

		sessionTemplate.insert("bookMapper.insertReviewThumbUpData", params);
	}

	// 리뷰 평점작성
	public void insertReviewRateData(String isbn, String userId, int rate) {
		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("isbn", isbn);
		params.put("userId", userId);
		params.put("rate", rate);

		sessionTemplate.insert("bookMapper.insertReviewRateData", params);

	}

	// 조회수 증가
	public void updateHitCount(int reviewId) {

		sessionTemplate.update("bookMapper.updateHitCount", reviewId);

	}

	// 공감수 증가
	public void updateThumbUp(int reviewId) {
		sessionTemplate.update("bookMapper.updateThumbUp", reviewId);
	}

	// 재고 데이터 가져오기
	public WareHouseDTO getWareHouseData(int isbn) {
		WareHouseDTO dto = sessionTemplate.selectOne("bookMapper.getWareHouseList", isbn);
		return dto;
	}
	
	// 리뷰 체크
	public int getReviewCheck(int isbn , String userId) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("isbn", isbn);
		params.put("userId", userId);
		
		int result = sessionTemplate.selectOne("bookMapper.getReviewCheck", params);
		return result;
	}
	
	//전체 데이터 from bnlBSList
		public List<BookSectionsDTO> getListMain_2(int sort1st, int sort2nd, int start, int end){
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			params.put("sort1st", sort1st);
			params.put("sort2nd", sort2nd);
			params.put("start", start);
			params.put("end", end);

			List<BookSectionsDTO> lists = sessionTemplate.selectList("bookMapper.getLists", params);

			return lists;
		}
		
		//sort1 //전체 데이터 from bnlBSList
		public List<BookSectionsDTO> getListSort1_2(int sort1st, int sort2nd, int start, int end){
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			params.put("sort1st", sort1st);
			params.put("sort2nd", sort2nd);
			params.put("start", start);
			params.put("end", end);

			List<BookSectionsDTO> lists = sessionTemplate.selectList("bookMapper.getListsSort1", params);

			return lists;
		}
		
		//sort2 //전체 데이터 from bnlBSList
		public List<BookSectionsDTO> getListSort2_2(int sort1st, int sort2nd, int start, int end){
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			params.put("sort1st", sort1st);
			params.put("sort2nd", sort2nd);
			params.put("start", start);
			params.put("end", end);

			List<BookSectionsDTO> lists = sessionTemplate.selectList("bookMapper.getListsSort2", params);

			return lists;
		}
		
		//sort3 //전체 데이터 from bnlBSList
		public List<BookSectionsDTO> getListSort3_2(int sort1st, int sort2nd, int start, int end){
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			params.put("sort1st", sort1st);
			params.put("sort2nd", sort2nd);
			params.put("start", start);
			params.put("end", end);

			List<BookSectionsDTO> lists = sessionTemplate.selectList("bookMapper.getListsSort3", params);

			return lists;
		}
		
		//sort4 //전체 데이터 from bnlBSList
		public List<BookSectionsDTO> getListSort4_2(int sort1st, int sort2nd, int start, int end){
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			params.put("sort1st", sort1st);
			params.put("sort2nd", sort2nd);
			params.put("start", start);
			params.put("end", end);

			List<BookSectionsDTO> lists = sessionTemplate.selectList("bookMapper.getListsSort4", params);

			return lists;
		}
	

}

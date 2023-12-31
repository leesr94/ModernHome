package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	// 로거
	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);
	
	// 의존성 주입
	@Inject
	private SqlSession sqlSession;
	
	// 네임스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.ProductMapper";
	
	// 완제품 목록 조회
	@Override
	public List<ProductVO> getProductList() {
		logger.debug("완제품 목록 조회!");
		return sqlSession.selectList(NAMESPACE + ".productList");
	}
	
	// 완제품 검색 결과 (페이징)
	@Override
	public List<ProductVO> getProductList(ProductVO vo, PageVO pvo) {
		logger.debug("완제품 검색 결과 조회!");
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("productVO", vo);
		paramMap.put("pageVO", pvo);
		
		return sqlSession.selectList(NAMESPACE + ".proSearchList", paramMap);
	}
	
	// 완제품 등록
	@Override
	public void regProduct(ProductVO vo) {
		logger.debug("완제품 등록!");
		
		sqlSession.insert(NAMESPACE + ".regProduct", vo);
		
	}

	// 완제품 삭제
	@Override
	public void deleteProduct(int pro_id) {
		logger.debug("완제품 삭제!");
		sqlSession.delete(NAMESPACE + ".delProduct", pro_id);
	}

	// 완제품 수정
	@Override
	public void modifyProduct(ProductVO vo) {
		logger.debug("완제품 수정!");
		sqlSession.update(NAMESPACE + ".updateProduct", vo);
	}

	// 완제품 id값 가져오기
	@Override
	public int getMaxProId() {
		return sqlSession.selectOne(NAMESPACE + ".getProId");
	}

	// 완제품 목록 (페이징)
	@Override
	public List<ProductVO> getProListPage(PageVO vo) throws Exception {
		logger.debug("완제품 목록(페이징) 조회!");
		return sqlSession.selectList(NAMESPACE + ".proListPage", vo);
	}

	// 총 개수 계산 (페이징)
	@Override
	public int getTotalCntPro() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".proTotalCnt");
	}

	// 검색 결과 개수 (페이징)
	@Override
	public int getProSearchCnt(ProductVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".proSearchCnt", vo);
	}
	
	
	
	
	
	
	

	
	
}

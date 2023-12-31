package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.DefectiveVO;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;

@Repository
public class DefectiveDAOImpl implements DefectiveDAO {
	
	// 로거
	private static final Logger logger = LoggerFactory.getLogger(DefectiveDAOImpl.class);
	
	// 네임 스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.DefectiveMapper";
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<WijoinVO> getDefList(PageVO vo) throws Exception {
		logger.debug("defeciveDAOImpl - getDefList() 실행");
		return sqlSession.selectList(NAMESPACE + ".getList", vo);
	}

	@Override
	public int getDfTotalCnt() throws Exception {
		logger.debug("defeciveDAOImpl - getDfTotalCnt() 실행");
		return sqlSession.selectOne(NAMESPACE + ".dfTotalCnt");
	}

	@Override
	public List<WijoinVO> creatDefNum() throws Exception {
		logger.debug("defeciveDAOImpl - creatDefNum() 실행");
		return sqlSession.selectList(NAMESPACE + ".creatDefNum");
	}

	@Override
	public List<WijoinVO> getDefList(String df_type, String nameSearch, PageVO vo) throws Exception {
		logger.debug("defeciveDAOImpl - getDefList() 실행");

		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("df_type", df_type);
		parameterMap.put("nameSearch", nameSearch);
		parameterMap.put("pageVO", vo);
		
		return sqlSession.selectList(NAMESPACE + ".getListSearch", parameterMap);
	}

	@Override
	public int getDfSearchCnt(String df_type, String nameSearch, PageVO vo) throws Exception {
		logger.debug("defeciveDAOImpl - getDfSearchCnt() 실행");

		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("df_type", df_type);
		parameterMap.put("nameSearch", nameSearch);
		parameterMap.put("pageVO", vo);
		
		return sqlSession.selectOne(NAMESPACE + ".dfSearchCnt", parameterMap);
	}

	@Override
	public List<WijoinVO> getQcFinInstr() throws Exception {
		logger.debug("defeciveDAOImpl - getQcFinInstr() 실행");
		return sqlSession.selectList(NAMESPACE + ".qcFinInstr");
	}

	@Override
	public List<WijoinVO> getQcFinRec() throws Exception {
		logger.debug("defeciveDAOImpl - getQcFinRec() 실행");
		return sqlSession.selectList(NAMESPACE + ".qcFinRec");
	}

	@Override
	public void addDefective(WijoinVO vo) throws Exception {
		logger.debug("defeciveDAOImpl - addDefective() 실행");
		sqlSession.insert(NAMESPACE + ".addDef", vo);
	}
	
	@Override
	public void modifyRec(WijoinVO vo) throws Exception {
		logger.debug("defeciveDAOImpl - modifyRec() 실행");
		sqlSession.update(NAMESPACE + ".modifyRec", vo);
	}
	
	@Override
	public void modifyDefective(WijoinVO vo) throws Exception {
		logger.debug("defeciveDAOImpl - modifyDefective() 실행");
		sqlSession.update(NAMESPACE + ".modifyDef", vo);
	}

	@Override
	public void delDefective(Integer df_id) throws Exception {
		logger.debug("defeciveDAOImpl - delDefective() 실행");
		sqlSession.delete(NAMESPACE + ".delDef", df_id);
	}

	@Override
	public void modifyProductReAndDis(WijoinVO vo) throws Exception {
		logger.debug("defeciveDAOImpl - modifyProductReAndDis() 실행");
		sqlSession.update(NAMESPACE + ".modifyProductReAndDis", vo);
	}
	
	@Override
	public void modifyMaterialReAndDis(WijoinVO vo) throws Exception {
		logger.debug("defeciveDAOImpl - modifyMaterialReAndDis() 실행");
		sqlSession.update(NAMESPACE + ".modifyMaterialReAndDis", vo);
	}

	@Override
	public void modifyDefective2(WijoinVO vo) throws Exception {
		logger.debug("defeciveDAOImpl - modifyDefective2() 실행");
		sqlSession.update(NAMESPACE + ".modifyDef2", vo);
	}
	
	@Override
	public List<WijoinVO> getQcFinMrPr() throws Exception {
		logger.debug("defeciveDAOImpl - getQcFinMrPr() 실행");
		return sqlSession.selectList(NAMESPACE + ".qcFinMrPr");
	}
	
	// 불량 그래프 계산용
	@Override
	public DefectiveVO dfCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".dfCnt");
	}
	
}
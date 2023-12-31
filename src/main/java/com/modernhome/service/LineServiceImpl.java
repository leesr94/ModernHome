package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.LineShutdownVO;
import com.modernhome.domain.LineVO;
import com.modernhome.domain.PageVO;
import com.modernhome.persistence.LineDAO;

@Service
public class LineServiceImpl implements LineService {
	
	// 의존성 주입
	@Inject
	private LineDAO dao;

	// 라인조회 (페이징)
	@Override
	public List<LineVO> getLineList() throws Exception {
		return dao.getLineList();
	}
	
	// 라인조회 + 검색
	@Override
	public List<LineVO> getLineListSearch(String line_num, String line_name, String use_yn) throws Exception {
		return dao.getLineListSearch(line_num, line_name, use_yn);
	}

	// 라인등록
	@Override
	public void regLine(LineVO lvo) throws Exception {
		dao.regLine(lvo);
		
	}
	
	// 라인수정
	@Override
	public void updateLine(LineVO lvo) throws Exception {
		dao.updateLine(lvo);
		
	}
	

	// 라인삭제
	@Override
	public void deleteLine(int line_id) throws Exception {
		dao.deleteLine(line_id);
		
	}
	
	// 라인 수정 정보 저장
	@Override
	public void regLineShutdown(LineShutdownVO lsvo) throws Exception {
		dao.regLineShutdown(lsvo);
	}

	@Override
	public List<LineShutdownVO> getListLineShutdown(Integer line_id) throws Exception {
		return dao.getListLineShutdown(line_id);
	}

	
	
	
	
	// 월별 평균 고장 건수
	@Override
	public List<LineVO> shutdownCnt() throws Exception {
		return dao.shutdownCnt();
	}

	
	
	

} // LineServiceImpl
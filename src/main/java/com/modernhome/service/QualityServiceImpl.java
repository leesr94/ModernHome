package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.WijoinVO;
import com.modernhome.persistence.QualityDAO;

@Service
public class QualityServiceImpl implements QualityService{

	// 의존성 주입
	@Inject
	private QualityDAO qdao;

	// 품질현황 목록 조회
	@Override
	public List<WijoinVO> getQualityList() throws Exception {
		return qdao.getQualityList();
	}

	// 품질현황 목록 조회 + 검색
	@Override
	public List<WijoinVO> getQualitySearch(String qc_num, String startDate, String endDate, String qc_yn) throws Exception {
		return qdao.getQualitySearch(qc_num, startDate, endDate, qc_yn);
	}


	

	
	
} // QualityServiceImpl
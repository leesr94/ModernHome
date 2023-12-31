package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.ClientVO;
import com.modernhome.domain.PageVO;

public interface ClientDAO {
	
	// 거래처 조회 (페이징)
	public List<ClientVO> getClientList(PageVO pvo);
	
	// 거래처 총 글 수 계산
	public int getTotalCntClt() throws Exception;
	
	// 거래처 검색 결과 (페이징)
	public List<ClientVO> getClientList(ClientVO cvo, PageVO pvo);
	
	// 거래처 검색 결과 개수 (페이징)
	public int getCltSearchCnt(ClientVO cvo) throws Exception;
	
//	// 거래처조회 + 검색
//	public List<ClientVO> clientListSearch(ClientVO cvo);
	
	// 거래처등록
	public void regClient(ClientVO cvo);
		
	// 거래처삭제
	public void deleteClient(String clt_num);
		
	// 거래처업데이트
	public void updateClient(ClientVO cvo);
	

	
	
	
	// 수주 거래처 팝업 페이징
	public List<ClientVO> ooCltList(ClientVO cvo, PageVO pvo);
	
	// 수주 거래처 수(검색포함)
	public Integer ooCltCnt(ClientVO cvo);
	
	
	// 발주 거래처 팝업 페이징
	public List<ClientVO> ioCltList(ClientVO cvo, PageVO pvo);
	
	// 발주 거래처 수(검색포함)
	public Integer ioCltCnt(ClientVO cvo);
	

}

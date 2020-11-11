package kr.co.gdu.cash.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.*;

/*
 * @Compoment
 * @Controller, @Service, @Mapper, @Repository : 스테레오 타입
 */

@Mapper
public interface CashbookMapper {
	// 전체 Cashbook의 수입/지출 목록을 페이징을 적용하여 출력
	// int beginRow, int rowPerPage를 받아온다
	List<Cashbook> selectCashbookListByPage(Map<String, Object> map);
	
	// cashbookList 페이지 카운트
	int countCashbookList();
	
	// 페이징 없이 전체 cashbook의 목록을 출력 (Excel)
	List<Cashbook> selectCashbookListAll();
	
	List<Map<String, Object>> selectCashInOutList();
	Integer selectSumCashbookPriceByInOut(Map<String, Object> map);
	//int selectSumCashbookPriceByInOut(String cashbookKind, int year, int month);
	
	List<Map<String, Object>> selectCashListByMonth(Map<String, Object> map);
	
	List<Cashbook> selectCashbookListByDay(Map<String, Object> map);
	
	// cashbookByDay 내용
	Cashbook selectCashbookByDay(int cashbookId);
	
	// cashbookByDay 입력
	int insertCashbook(Cashbook cashbook);
	
	// cashbookByDay 수정
	int updateCashbook(Cashbook cashbook);
	
	// cashbookByDay 삭제
	int deleteCashbook(int cashbookId);
}
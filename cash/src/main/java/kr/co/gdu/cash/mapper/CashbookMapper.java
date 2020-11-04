package kr.co.gdu.cash.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

/*
 * @Compoment
 * @Controller, @Service, @Mapper, @Repository : 스테레오 타입
 */

@Mapper
public interface CashbookMapper {
	List<Map<String, Object>> selectCashInOutList();
	Integer selectSumCashbookPriceByInOut(Map<String, Object> map);
	//int selectSumCashbookPriceByInOut(String cashbookKind, int year, int month);
	
	List<Map<String, Object>> selectCashListByMonth(Map<String, Object> map);
	
	List<Cashbook> selectCashbookListByDay(Map<String, Object> map);
}
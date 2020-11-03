package kr.co.gdu.cash.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CashbookMapper {
	List<Map<String, Object>> selectCashInOutList();
	Integer selectSumCashbookPriceByInOut(Map<String, Object> map);
	//int selectSumCashbookPriceByInOut(String cashbookKind, int year, int month);
}
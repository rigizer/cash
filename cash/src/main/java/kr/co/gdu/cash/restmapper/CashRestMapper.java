package kr.co.gdu.cash.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CashRestMapper {
	// 1번
	public Map<String, Object> selectTotalOfMonthByYear();
   
	// 2번
	public Map<String, Object> selectTotalOutAndInByYear(int year);
}
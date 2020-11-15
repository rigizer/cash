package kr.co.gdu.cash.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CashRestMapper {
	// 연도별 월간 수입 내역
	public Map<String, Object> selectTotalInOfMonthByYear(int year);
	
	// 연도별 월간 지출 내역
	public Map<String, Object> selectTotalOutOfMonthByYear(int year);
   
	// 월간 카테고리별 수입 내역
	public Map<String, Object> selectCategoryInByMonth(Map<String, Integer> map);
	
	// 월간 카테고리별 지출 내역
	public Map<String, Object> selectCategoryOutByMonth(Map<String, Integer> map);
	
	// 연도별 수입/지출 내역
	public Map<String, Object> selectTotalOutAndInByYear(int year);
	
	// 월별 자산 내역
	public Map<String, Object> selectTotalMoneyByMonth(int year);
	
	// 연간 카테고리별 수입 내역
	public Map<String, Object> selectCategoryInByYear(int year);
	
	// 연간 카테고리별 지출 내역
	public Map<String, Object> selectCategoryOutByYear(int year);
}
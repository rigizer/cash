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
	
	// 월별 수입/지출 내역
	public Map<String, Object> selectTotalOutAndInByMonth(int year);
	
	// 연도별 수입/지출 내역
	public Map<String, Object> selectTotalOutAndInByYear(int year);
	
	// 월별 자산 내역
	public Map<String, Object> selectTotalMoneyByMonth(int year);
	
	// 연간 누적 자산 내역
	public Map<String, Object> selectTotalStackMoneyByYear(int year);
	
	// 연간 카테고리별 수입 내역
	public Map<String, Object> selectCategoryInByYear(int year);
	
	// 연간 카테고리별 지출 내역
	public Map<String, Object> selectCategoryOutByYear(int year);
	
	// 월별 일일 평균 수입 내역
	public Map<String, Object> selectAverageInOfMonthByYear(int year);
	
	// 월별 일일 평균 지출 내역
	public Map<String, Object> selectAverageOutOfMonthByYear(int year);
	
	// 기간지정 카테고리별 수입 내역
	public Map<String, Object> selectCategoryInByDateTerm(Map<String, String> map);
	
	// 기간지정 카테고리별 지출 내역
	public Map<String, Object> selectCategoryOutByDateTerm(Map<String, String> map);
}
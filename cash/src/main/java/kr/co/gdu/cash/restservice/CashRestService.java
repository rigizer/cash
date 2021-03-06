package kr.co.gdu.cash.restservice;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.CashRestMapper;

@Service
@Transactional
public class CashRestService {
   @Autowired CashRestMapper cashRestMapper;
   public Map<String, Object> getTotalInOfMonthByYear(int year) {
	  System.out.println("getTotalInOfMonthByYear 호출성공");
      return cashRestMapper.selectTotalInOfMonthByYear(year);
   }
   
   public Map<String, Object> getTotalOutOfMonthByYear(int year) {
	  System.out.println("getTotalOutOfMonthByYear 호출성공");
      return cashRestMapper.selectTotalOutOfMonthByYear(year);
   }
   
   public Map<String, Object> getCategoryInByMonth(int year, int month) {
	  System.out.println("getCategoryInByMonth 호출성공");
	  
	  Map<String, Integer> map = new HashMap<String, Integer>();
	  map.put("year", year);
	  map.put("month", month);
	  
      return cashRestMapper.selectCategoryInByMonth(map);
   }
   
   public Map<String, Object> getCategoryOutByMonth(int year, int month) {
	  System.out.println("getCategoryOutByMonth 호출성공");
	  
	  Map<String, Integer> map = new HashMap<String, Integer>();
	  map.put("year", year);
	  map.put("month", month);
	  
      return cashRestMapper.selectCategoryOutByMonth(map);
   }
   
   public Map<String, Object> getTotalOutAndInByMonth(int year) {
	  System.out.println("getTotalOutAndInByMonth 호출성공");
      return cashRestMapper.selectTotalOutAndInByMonth(year);
   }
   
   public Map<String, Object> getTotalOutAndInByYear(int year) {
	  System.out.println("getTotalOutAndInByYear 호출성공");
      return cashRestMapper.selectTotalOutAndInByYear(year);
   }
   
   public Map<String, Object> getTotalMoneyByMonth(int year) {
	  System.out.println("getTotalMoneyByMonth 호출성공");
      return cashRestMapper.selectTotalMoneyByMonth(year);
   }
   
   public Map<String, Object> getTotalStackMoneyByYear(int year) {
		  System.out.println("getTotalStackMoneyByYear 호출성공");
	      return cashRestMapper.selectTotalStackMoneyByYear(year);
	   }
   
   public Map<String, Object> getCategoryInByYear(int year) {
	  System.out.println("getCategoryInByYear 호출성공");
      return cashRestMapper.selectCategoryInByYear(year);
   }
   
   public Map<String, Object> getCategoryOutByYear(int year) {
      return cashRestMapper.selectCategoryOutByYear(year);
   }
   
   public Map<String, Object> getAverageInOfMonthByYear(int year) {
	  System.out.println("getAverageInOfMonthByYear 호출성공");
      return cashRestMapper.selectAverageInOfMonthByYear(year);
   }
   
   public Map<String, Object> getAverageOutOfMonthByYear(int year) {
	  System.out.println("getAverageOutOfMonthByYear 호출성공");
      return cashRestMapper.selectAverageOutOfMonthByYear(year);
   }
   
   public Map<String, Object> getCategoryInByDateTerm(String startDate, String endDate) {
	  System.out.println("getCategoryInByDateTerm 호출성공");
	  
	  Map<String, String> map = new HashMap<String, String>();
	  map.put("startDate", startDate);
	  map.put("endDate", endDate);
	  
      return cashRestMapper.selectCategoryInByDateTerm(map);
   }
   
   public Map<String, Object> getCategoryOutByDateTerm(String startDate, String endDate) {
	  System.out.println("getCategoryOutByDateTerm 호출성공");
	  
	  Map<String, String> map = new HashMap<String, String>();
	  map.put("startDate", startDate);
	  map.put("endDate", endDate);
		  
      return cashRestMapper.selectCategoryOutByDateTerm(map);
   }
}
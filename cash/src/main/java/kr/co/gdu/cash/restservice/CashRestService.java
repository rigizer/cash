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
   
   public Map<String, Object> getTotalOutAndInByYear(int year) {
	  System.out.println("getTotalOutAndInByYear 호출성공");
      return cashRestMapper.selectTotalOutAndInByYear(year);
   }
}
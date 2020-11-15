package kr.co.gdu.cash.restcontroller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.CashRestService;

@RestController
public class CashRestController {
	@Autowired CashRestService cashRestService;
   
	@GetMapping("/admin/totalInOfMonthByYear/{year}")
	public Map<String, Object> totalInOfMonthByYear(
			@PathVariable(name = "year") int year) {
		System.out.println("totalInOfMonthByYear 호출성공");
		Map<String, Object> map = cashRestService.getTotalInOfMonthByYear(year);
		return map;
	}
	
	@GetMapping("/admin/totalOutOfMonthByYear/{year}")
	public Map<String, Object> totalOutOfMonthByYear(
			@PathVariable(name = "year") int year) {
		System.out.println("totalOutOfMonthByYear 호출성공");
		Map<String, Object> map = cashRestService.getTotalOutOfMonthByYear(year);
		return map;
	}
	
	@GetMapping("/admin/categoryInByMonth/{year}/{month}")
	public Map<String, Object> categoryInByMonth(
			@PathVariable(name = "year") int year, 
			@PathVariable(name = "month") int month) {
		System.out.println("categoryInByMonth 호출성공, " + year + " " +  month);
		Map<String, Object> map = cashRestService.getCategoryInByMonth(year, month);
		return map;
	}
	
	@GetMapping("/admin/categoryOutByMonth/{year}/{month}")
	public Map<String, Object> categoryOutByMonth(
			@PathVariable(name = "year") int year, 
			@PathVariable(name = "month") int month) {
		System.out.println("categoryOutByMonth 호출성공, " + year + " " +  month);
		Map<String, Object> map = cashRestService.getCategoryOutByMonth(year, month);
		return map;
	}
   
	@GetMapping("/admin/totalOutAndInByYear/{year}")
	public Map<String, Object> totalOutAndInByYear(
			@PathVariable(name = "year") int year) {
		System.out.println("totalOutAndInByYear 호출성공");
		return cashRestService.getTotalOutAndInByYear(year);
	}
}
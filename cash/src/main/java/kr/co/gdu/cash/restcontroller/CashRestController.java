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
	
	@GetMapping("/admin/totalOutAndInByMonth/{year}")
	public Map<String, Object> totalOutAndInByMonth(
			@PathVariable(name = "year") int year) {
		System.out.println("totalOutAndInByMonth 호출성공");
		return cashRestService.getTotalOutAndInByMonth(year);
	}
	
	@GetMapping("/admin/totalOutAndInByYear/{year}")
	public Map<String, Object> totalOutAndInByYear(
			@PathVariable(name = "year") int year) {
		System.out.println("totalOutAndInByYear 호출성공");
		return cashRestService.getTotalOutAndInByYear(year);
	}
	
	@GetMapping("/admin/totalMoneyByMonth/{year}")
	public Map<String, Object> totalMoneyByMonth(
			@PathVariable(name = "year") int year) {
		System.out.println("totalMoneyByMonth 호출성공");
		Map<String, Object> map = cashRestService.getTotalMoneyByMonth(year);
		return map;
	}
	
	@GetMapping("/admin/totalStackMoneyByYear/{year}")
	public Map<String, Object> totalStackMoneyByYear(
			@PathVariable(name = "year") int year) {
		System.out.println("totalStackMoneyByYear 호출성공");
		Map<String, Object> map = cashRestService.getTotalStackMoneyByYear(year);
		return map;
	}
	
	@GetMapping("/admin/categoryInByYear/{year}")
	public Map<String, Object> categoryInByYear(
			@PathVariable(name = "year") int year) {
		System.out.println("categoryInByYear 호출성공, " + year);
		Map<String, Object> map = cashRestService.getCategoryInByYear(year);
		return map;
	}
	
	@GetMapping("/admin/categoryOutByYear/{year}")
	public Map<String, Object> categoryOutByYear(
			@PathVariable(name = "year") int year) {
		System.out.println("categoryOutByYear 호출성공, " + year);
		Map<String, Object> map = cashRestService.getCategoryOutByYear(year);
		return map;
	}
	
	@GetMapping("/admin/averageInOfMonthByYear/{year}")
	public Map<String, Object> averageInOfMonthByYear(
			@PathVariable(name = "year") int year) {
		System.out.println("averageInOfMonthByYear 호출성공");
		Map<String, Object> map = cashRestService.getAverageInOfMonthByYear(year);
		return map;
	}
	
	@GetMapping("/admin/averageOutOfMonthByYear/{year}")
	public Map<String, Object> averageOutOfMonthByYear(
			@PathVariable(name = "year") int year) {
		System.out.println("averageOutOfMonthByYear 호출성공");
		Map<String, Object> map = cashRestService.getAverageOutOfMonthByYear(year);
		return map;
	}
	
	@GetMapping("/admin/categoryInByDateTerm/{startDate}/{endDate}")
	public Map<String, Object> categoryInByDateTerm(
			@PathVariable(name = "startDate") String startDate,
			@PathVariable(name = "endDate") String endDate) {
		System.out.println("categoryInByDateTerm 호출성공");
		Map<String, Object> map = cashRestService.getCategoryInByDateTerm(startDate, endDate);
		return map;
	}
	
	@GetMapping("/admin/categoryOutByDateTerm/{startDate}/{endDate}")
	public Map<String, Object> categoryOutByDateTerm(
			@PathVariable(name = "startDate") String startDate,
			@PathVariable(name = "endDate") String endDate) {
		System.out.println("categoryOutByDateTerm 호출성공");
		Map<String, Object> map = cashRestService.getCategoryOutByDateTerm(startDate, endDate);
		return map;
	}
}
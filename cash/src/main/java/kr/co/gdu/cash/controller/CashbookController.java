package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.*;
import kr.co.gdu.cash.vo.*;

@Controller
public class CashbookController {
	@Autowired private CashbookService cashbookService;
	@Autowired private CategoryService categoryService;
	
	@GetMapping(value="/addCashbook")
	public String addCashbook(Model model, 
			@RequestParam(name = "currentYear", required = true) int currentYear, 		// request.getParameter("currentYear", currentYear);와 동일한 코드
			@RequestParam(name = "currentMonth", required = true) int currentMonth, 	// request.getParameter("currentMonth", currentMonth);와 동일한 코드
			@RequestParam(name = "currentDay", required = true) int currentDay) {		// request.getParameter("currentDay", currentDay);와 동일한 코드
		
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		
		return "addCashbook";
	}
	
	@GetMapping(value="/cashbookByDay")
	public String cashbookByDay(Model model,
			@RequestParam(name = "currentYear", required = true) int currentYear, 		// request.getParameter("currentYear", currentYear);와 동일한 코드
			@RequestParam(name = "currentMonth", required = true) int currentMonth, 	// request.getParameter("currentMonth", currentMonth);와 동일한 코드
			@RequestParam(name = "currentDay", required = true) int currentDay) {		// request.getParameter("currentDay", currentDay);와 동일한 코드

		List<Cashbook> cashbookList = cashbookService.getCashbookListByDay(currentYear, currentMonth, currentDay);
		
		model.addAttribute("cashbookList", cashbookList);	// 일일 수입/지출 내역을 model을 통해 전달
		
		return "cashbookByDay";
	}
	
	@GetMapping(value="/cashbookByMonth")
	public String cashbookByMonth(Model model, 
			@RequestParam(name = "currentYear", defaultValue = "-1") int currentYear, 		// request.getParameter("currentYear", currentYear);와 동일한 코드
			@RequestParam(name = "currentMonth", defaultValue = "-1") int currentMonth) {	// request.getParameter("currentMonth", currentMonth);와 동일한 코드
		
		// 1. 요청 분석
		Calendar currentDay = Calendar.getInstance();	// 오늘 날짜
		
		// currentYear와 currentMonth의 값이 모두 넘어왔을 경우
		if (currentYear != -1 && currentMonth != -1) {
			if (currentMonth == 0) {
				currentYear -= 1;
				currentMonth = 12;
			}
			
			if (currentMonth == 13) {
				currentYear += 1;
				currentMonth = 1;
			}
			
			currentDay.set(Calendar.YEAR, currentYear);
			currentDay.set(Calendar.MONTH, currentMonth - 1);	// Calendar 함수의 값 보정 위해 1만큼 감안하여 설정
		}
		
		currentDay.set(Calendar.DATE, 1);	// 오늘 날짜 기준 일을 1로 바꾸어 이번 달 1일의 요일을 구한다.
		currentYear = currentDay.get(Calendar.YEAR);	// 올해 연도
		currentMonth = currentDay.get(Calendar.MONTH) + 1;	// Calendar.MONTH에 1을 더해야 실제 월이 나온다.
		int lastDay = currentDay.getActualMaximum(Calendar.DATE); // 월 마지막 날짜
		int firstDayOfWeek = currentDay.get(Calendar.DAY_OF_WEEK);	// 이번 달 1일의 요일
		
		System.out.println(currentYear);
		System.out.println(currentMonth);
		System.out.println(lastDay);
		System.out.println(firstDayOfWeek);
		//-------------------------------------
		
		int sumIn = cashbookService.getSumCashbookPriceByInOut("수입", currentYear, currentMonth);
		int sumOut = cashbookService.getSumCashbookPriceByInOut("지출", currentYear, currentMonth);
		
		//-------------------------------------
		
		List<Map<String, Object>> cashList = cashbookService.getCashListByMonth(currentYear, currentMonth);
		
		//-------------------------------------
		// 2. 뷰 연결
		/*
		 * 1) 년도, 월, 마지막 일(28일, 29일, 30일, 31일), 1일의 요일
		 */
		model.addAttribute("currentYear", currentYear);		// 년도
		model.addAttribute("currentMonth", currentMonth);		// 월
		model.addAttribute("lastDay", lastDay);	// 마지막 날
		model.addAttribute("firstDayOfWeek", firstDayOfWeek);	// 1일의 요일
		
		model.addAttribute("sumIn", sumIn);	// 한 달의 총 수입
		model.addAttribute("sumOut", sumOut);	// 한 달의 총 지출
		
		model.addAttribute("cashList", cashList);	// 월별 수입/지출 내역
		
		return "cashbookByMonth";	// 실제로 포워딩 되는 것은 prefix에서 지정한 /WEB-INF/view/cashbookByMonth.jsp으로 반환됨
	}
}

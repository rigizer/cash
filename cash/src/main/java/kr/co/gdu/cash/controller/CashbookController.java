package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.*;
import kr.co.gdu.cash.vo.*;

@Controller
public class CashbookController {
	@Autowired private CategoryService categoryService;
	@Autowired private CashbookService cashbookService;
	
	@GetMapping(value="/admin/cashbookByMonth/{currentYear}/{currentMonth}")
	public String cashbookByMonth(Model model, 
			@PathVariable(name = "currentYear") int currentYear, 		// request.getParameter("currentYear", currentYear);와 동일한 코드
			@PathVariable(name = "currentMonth") int currentMonth) {	// request.getParameter("currentMonth", currentMonth);와 동일한 코드
		
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
	
	// cashbookByDay 상세 페이지
	@GetMapping(value="/admin/cashbookByDay/{target}/{currentYear}/{currentMonth}/{currentDay}")
	public String cashbookByDay(Model model,
			@PathVariable(name = "target") String target,								// pre, next, default
			@PathVariable(name = "currentYear", required = true) int currentYear, 		// request.getParameter("currentYear", currentYear);와 동일한 코드
			@PathVariable(name = "currentMonth", required = true) int currentMonth, 	// request.getParameter("currentMonth", currentMonth);와 동일한 코드
			@PathVariable(name = "currentDay", required = true) int currentDay) {		// request.getParameter("currentDay", currentDay);와 동일한 코드

		Calendar targetDay = Calendar.getInstance();
		targetDay.set(Calendar.YEAR, currentYear);
		targetDay.set(Calendar.MONTH, currentMonth - 1);
		targetDay.set(Calendar.DATE, currentDay);
		
		if (target.equals("pre")) {
			targetDay.add(Calendar.DATE, -1);
		} else if (target.equals("next")) {
			targetDay.add(Calendar.DATE, 1);
		}
		
		List<Cashbook> cashbookList = cashbookService.getCashbookListByDay(
				targetDay.get(Calendar.YEAR), 
				targetDay.get(Calendar.MONTH) + 1, 
				targetDay.get(Calendar.DATE));
		
		model.addAttribute("cashbookList", cashbookList);	// 일일 수입/지출 내역을 model을 통해 전달
		
		model.addAttribute("currentYear", targetDay.get(Calendar.YEAR));
		model.addAttribute("currentMonth", targetDay.get(Calendar.MONTH) + 1);
		model.addAttribute("currentDay", targetDay.get(Calendar.DATE));
		
		return "cashbookByDay";
	}
	
	// cashbookByDay 입력 Form
	@GetMapping(value="/admin/addCashbook/{currentYear}/{currentMonth}/{currentDay}")
	public String addCashbook(Model model, 
			@PathVariable(name = "currentYear", required = true) int currentYear, 		// request.getParameter("currentYear", currentYear);와 동일한 코드
			@PathVariable(name = "currentMonth", required = true) int currentMonth, 	// request.getParameter("currentMonth", currentMonth);와 동일한 코드
			@PathVariable(name = "currentDay", required = true) int currentDay) {		// request.getParameter("currentDay", currentDay);와 동일한 코드
		
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("currentMonth", currentMonth);
		model.addAttribute("currentDay", currentDay);
		
		return "addCashbook";
	}
	
	// cashbookByDay 입력 Action
	@PostMapping("/admin/addCashbook")
	public String addCashbook(Cashbook cashbook) {	// 커맨드 객체 이용
		//System.out.println(cashbook);
		cashbookService.addCashbook(cashbook);
		
		return "redirect:/admin/cashbookByMonth/-1/-1";	// response.sendRedirect();
	}
	
	// cashbookByDay 삭제
	@GetMapping("/admin/removeCashbookByDay")
	public String removeCashbook(Model model, 
			@RequestParam(value = "cashbookId") int cashbookId) {
		
		System.out.println("Debug: cashbookId[" + cashbookId + "] 삭제");
		cashbookService.removeCashbook(cashbookId);
		
		return "redirect:/admin/cashbookByMonth/-1/-1";
	}
	
	// cashbookByDay 수정 Form
	@GetMapping("/admin/modifyCashbookByDay/{cashbookId}")
	public String modifyCashbookForm(Model model, 
			@PathVariable(value = "cashbookId") int cashbookId) {
	
		Cashbook cashbook = cashbookService.getCashbookByDay(cashbookId);
		System.out.println("Debug: " + cashbook);
		
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("cashbook", cashbook);
		
		return "modifyCashbookByDay";
	}
	
	// cashbookByDay 수정 Action
	@PostMapping("/admin/modifyCashbookByDay")
	public String modifyCashbookAction(Cashbook cashbook) {
		System.out.println("Debug: " + cashbook);
		cashbookService.modifyCashbook(cashbook);
		
		return "redirect:/admin/cashbookByMonth/-1/-1";
	}
	
	// cashbookList
	@GetMapping("/admin/cashbookList/{currentPage}")
	public String cashbookList(Model model,
			@PathVariable(name = "currentPage", required = true) int currentPage) {
		// 한 번에 20개의 데이터씩 출력
		int rowPerPage = 20;
		
		List<Cashbook> cashbookList = cashbookService.getCashbookListByPage(currentPage, rowPerPage);
		System.out.println("Debug: " + cashbookList);
		
		int totalCount = cashbookService.getCountCashbookList();	// 전체 데이터 수
		int lastPage = totalCount / rowPerPage;	// 마지막 페이지
		
		if (totalCount % rowPerPage != 0) {	// 10 미만의 개수의 데이터가 있는 페이지를 표시
			lastPage += 1;
		}
		
		if (lastPage == 0) { // 전체 페이지가 0개이면 현재 페이지도 0으로 표시
			currentPage = 0;
		}
		
		int navPerPage = 10;	// 네비게이션에 표시할 페이지 수
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;	// 네비게이션 첫번째 페이지
		int navLastPage = navFirstPage + navPerPage - 1;	// 네비게이션 마지막 페이지
		
		if (currentPage % navPerPage == 0 && currentPage != 0) {	// 10으로 나누어 떨어지는 경우 처리하는 코드
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		model.addAttribute("cashbookList", cashbookList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		return "cashbookList";
	}
}

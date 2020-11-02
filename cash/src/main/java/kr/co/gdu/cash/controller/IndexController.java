package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.IndexService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class IndexController {
	@Autowired
	private IndexService indexService;
	
	@GetMapping(value={"/","/index"})
	public String index(Model model) {
		// request.getParameter("paramMonth", paramMonth);와 동일하다.
		
		// 1. 요청 분석
		Calendar c = Calendar.getInstance();	// 오늘 날짜
		int month = c.get(Calendar.MONTH) + 1;	// Calendar.MONTH에 1을 더해야 실제 월이 나온다.
		int lastDay = c.getActualMaximum(Calendar.DATE); // 월 마지막 날짜
		
		System.out.println(month);
		System.out.println(lastDay);

		Calendar firstDay = Calendar.getInstance();		// 오늘 날짜
		firstDay.set(Calendar.DATE, 1);	// 오늘 날짜 기준 일을 1로 바꾸어 이번 달 1일의 요일을 구한다.
		int firstDayOfWeek = firstDay.get(Calendar.DAY_OF_WEEK);
		System.out.println(firstDayOfWeek);
		
		// 2. 서비스 호출
		List<Notice> list = indexService.getLatestNoticeList();
		System.out.println("list.size(5) : " + (list.size() == 5));	// true
		model.addAttribute("list", list);
		
		// 3. 뷰 연결
		/*
		 * 1) 월, 마지막 일(28일, 29일, 30일, 31일), 1일의 요일
		 */
		model.addAttribute("month", month);		// 월
		model.addAttribute("lastDay", lastDay);	// 마지막 날
		model.addAttribute("month", month);		// 1일의 요일
		model.addAttribute("firstDayOfWeek", firstDayOfWeek);
		return "index";	// 실제로 포워딩 되는 것은 prefix에서 지정한 /WEB-INF/view/index.jsp으로 반환됨
	}
}

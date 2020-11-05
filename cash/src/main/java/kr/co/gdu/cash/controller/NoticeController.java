package kr.co.gdu.cash.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	
	// 공지사항 목록
	@GetMapping("/admin/noticeList")
	public String noticeList(Model model,
			@RequestParam(value = "", defaultValue = "1") int currentPage) {
		int rowPerPage = 10;
		
		List<Notice> noticeList = noticeService.getNoticeListPage(currentPage, rowPerPage);
		System.out.println("Debug: " + noticeList);
		
		int totalCount = noticeService.getCountNotice();	// 전체 데이커
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
		
		model.addAttribute("noticeList", noticeList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		return "noticeList";
	}
	
	// 공지사항 입력 Form
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		
		return "addNotice";
	}
	
	// 공지사항 입력 Action
	@PostMapping("/admin/addNotice")
	public String addNotice(Notice notice) {
		System.out.println("Debug: " + notice);
		noticeService.addNotice(notice);
		
		return "redirect:/admin/noticeList";
	}
	
	// 공지사항 상세 페이지
	@GetMapping("/admin/noticeOne")
	public String noticeOne(Model model, 
			@RequestParam(value = "noticeId") int noticeId) {
		
		Notice notice = noticeService.getNoticeOne(noticeId);
		System.out.println("Debug: " + notice);
		model.addAttribute("notice", notice);
		
		return "noticeOne";
	}
	
	// 공지사항 삭제
	@GetMapping("/admin/removeNotice")
	public String removeNotice(Model model, 
			@RequestParam(value = "noticeId") int noticeId) {
		
		System.out.println("Debug: noticeId[" + noticeId + "] 삭제");
		noticeService.removeNotice(noticeId);
		
		return "redirect:/admin/noticeList";
	}
	
	// 공지사항 수정 Form
	@GetMapping("/admin/modifyNotice")
	public String modifyNoticeForm(Model model, 
			@RequestParam(value = "noticeId") int noticeId) {
	
		Notice notice = noticeService.getNoticeOne(noticeId);
		System.out.println("Debug: " + notice);
		model.addAttribute("notice", notice);
		
		return "modifyNotice";
	}
	
	// 공지사항 수정 Action
	@PostMapping("/admin/modifyNotice")
	public String modifyNoticeAction(Notice notice) {
		System.out.println("Debug: " + notice);
		noticeService.modifyNotice(notice);
		
		return "redirect:/admin/noticeOne?noticeId=" + notice.getNoticeId();
	}
}
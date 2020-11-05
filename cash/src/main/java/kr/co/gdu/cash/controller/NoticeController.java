package kr.co.gdu.cash.controller;

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
		
		noticeService.getNoticeListPage(currentPage, rowPerPage);
		
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
		
		return "redirect:/admin/noticeList";
	}
	
	// 공지사항 상세 페이지
	@GetMapping("/admin/noticeOne")
	public String noticeOne(Model model, 
			@RequestParam(value = "noticeId") int noticeId) {
		
		return "noticeOne";
	}
	
	// 공지사항 삭제
	@GetMapping("/admin/removeNotice")
	public String removeNotice(Model model, 
			@RequestParam(value = "noticeId") int noticeId) {
		
		return "redirect:/admin//noticeList";
	}
	
	// 공지사항 수정 Form
	@GetMapping("/admin/modifyNotice")
	public String modifyNoticeForm(Model model, 
			@RequestParam(value = "noticeId") int noticeId) {
	
		return "modifyNotice";
	}
	
	// 공지사항 수정 Action
	@PostMapping("/admin/modifyNotice")
	public String modifyNoticeAction(Notice notice) {
	
		return "redirect:/admin/noticeOne?noticeId=" + notice.getNoticeId();
	}
}
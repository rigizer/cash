package kr.co.gdu.cash.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.GuestbookService;
import kr.co.gdu.cash.vo.Guestbook;

@Controller
public class GuestbookController {
	@Autowired private GuestbookService guestbookService;
	
	// 방명록 목록
	@GetMapping("/admin/guestbookList/{currentPage}")
	public String guestbookList(Model model,
			@PathVariable(value = "") int currentPage) {
		int rowPerPage = 10;
		
		List<Guestbook> guestbookList = guestbookService.getGuestbookListPage(currentPage, rowPerPage);
		System.out.println("Debug: " + guestbookList);
		
		int totalCount = guestbookService.getCountGuestbook();	// 전체 데이터 수
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
		
		model.addAttribute("guestbookList", guestbookList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		return "guestbookList";
	}
	
	// 방명록 입력 Form
	@GetMapping("/admin/addGuestbook")
	public String addGuestbook() {
		
		return "addGuestbook";
	}
	
	// 방명록 입력 Action
	@PostMapping("/admin/addGuestbook")
	public String addGuestbook(Guestbook guestbook) {
		System.out.println("Debug: " + guestbook);
		
		guestbookService.addGuestbook(guestbook);
		
		return "redirect:/admin/guestbookList/1";
	}
	
	// 방명록 삭제
	@GetMapping("/admin/removeGuestbook/{guestbookId}")
	public String removeGuestbook(Model model,
			@PathVariable(value = "guestbookId") int guestbookId) {
		
		System.out.println("Debug: guestbookId[" + guestbookId + "] 삭제");
		
		guestbookService.removeGuestbook(guestbookId);
		
		return "redirect:/admin/guestbookList/1";
	}
	
	// 방명록 수정 Form
	@GetMapping("/admin/modifyGuestbook/{guestbookId}")
	public String modifyGuestbook(Model model, 
			@PathVariable(value = "guestbookId") int guestbookId) {
	
		Guestbook guestbook = guestbookService.getGuestbookOne(guestbookId);
		System.out.println("Debug: " + guestbookId);
		
		model.addAttribute("guestbook", guestbook);
		
		return "modifyGuestbook";
	}
	
	// 방명록 수정 Action
	@PostMapping("/admin/modifyGuestbook")
	public String modifyGuestbook(Guestbook guestbook) {
		System.out.println("Debug: " + guestbook);
		
		guestbookService.modifyGuestbook(guestbook);
		
		return "redirect:/admin/guestbookList/1";
	}
}

package kr.co.gdu.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class IndexController {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping(value={"/","/index"})
	public String index(Model model) {
		List<Notice> list = noticeService.getLatestNoticeList();
		System.out.println("list.size(5) : " + (list.size() == 5));	// true
		model.addAttribute("list", list);
		return "index";	// 실제로 포워딩 되는 것은 prefix에서 지정한 /WEB-INF/view/index.jsp으로 반환됨
	}
}

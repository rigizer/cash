package kr.co.gdu.cash.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gdu.cash.service.*;

@Controller
public class IndexController {
	@Autowired private IndexService indexService;
	
	@GetMapping(value= {"/","/index"})
	public String index(Model model) {	// request.getAttribute();
		Map<String, Object> map = indexService.getLatestNoticeListAndInOutList();
		model.addAttribute("noticeList", map.get("noticeList"));
		model.addAttribute("inOutList", map.get("inOutList"));
		
		return "index";
	}
}
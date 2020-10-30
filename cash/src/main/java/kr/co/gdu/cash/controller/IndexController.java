package kr.co.gdu.cash.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	@GetMapping("/index")
	public String index() {
		return "index";	// 실제로 포워딩 되는 것은 prefix에서 지정한 /WEB-INF/view/index.jsp으로 반환됨
	}
}

package kr.co.gdu.cash.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.*;
import kr.co.gdu.cash.vo.*;

@Controller(value = "memberController")
@Scope("singleton")
public class MemberController {
	@Autowired private MemberService memberService;
	
	@GetMapping("/admin/addMember")
	public String addMember() {
		return "addMember";
	}
	
	@PostMapping("/admin/addMember")
	public String addMember(Member member) {
		memberService.addMember(member);
		return "redirect:/admin/index"; // redirect:/admin/memberList로 이동바람
	}
}
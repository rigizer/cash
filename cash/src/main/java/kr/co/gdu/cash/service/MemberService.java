package kr.co.gdu.cash.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.MemberMapper;
import kr.co.gdu.cash.vo.Member;

@Service
@Transactional
public class MemberService {
	@Autowired private MemberMapper memberMapper;
	
	// 로그인
	public Member getMemberById(Member paramMember) {
		Member member = memberMapper.selectMemberById(paramMember.getId());
		
		/*
		if (member == null) {
			return null;
		} else if (member.getPw().equals(pw) != true) {
			return null;
		} else {
			return member;
		}
		*/
		
		if (member != null && member.getPw().equals(paramMember.getPw()) == true) {
			return member;
		} else {
			return null;
		}
	}
	
	// 회원 추가
	public int addMember(Member member) {
		return memberMapper.insertMember(member);
	}
}
package kr.co.gdu.cash.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Member;

@Mapper
public interface MemberMapper {
	// 로그인
	public Member selectMemberById(String id);
	
	// 회원 추가
	public int insertMember(Member member);
}
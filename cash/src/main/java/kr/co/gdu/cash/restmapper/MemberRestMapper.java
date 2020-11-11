package kr.co.gdu.cash.restmapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberRestMapper {
	// 회원 중복확인
	public String selectMemberId(String id);
}

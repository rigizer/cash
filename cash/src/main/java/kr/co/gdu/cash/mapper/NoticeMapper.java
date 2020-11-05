package kr.co.gdu.cash.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.*;

@Mapper	// public class NoticeMapperImplements implements NoticeMapper {}
public interface NoticeMapper {
	// index 화면의 최근 5개 공지사항을 보여주는 메소드
	List<Notice> selectLatestNoticeList();	
}
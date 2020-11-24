package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Noticefile;

@Mapper
public interface NoticefileMapper {
	// 첨부파일 목록
	List<String> selectNoticefileNameList(int noticeId);
	
	// 첨부파일 입력
	int insertNoticefile(Noticefile noticefile);
	
	// 단일 첨부파일 삭제
	int deleteNoticefileOne(int noticefileId);
	
	// 전체 첨부파일 삭제
	int deleteNoticefile(int noticeId);
}

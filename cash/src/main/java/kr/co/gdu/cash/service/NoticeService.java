package kr.co.gdu.cash.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.*;
import kr.co.gdu.cash.vo.*;

@Service
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper cashbookMapper;
	
	// ISSUE : noticeList 중복. 추후 분리/제거바람.
	public Map<String, Object> getLatestNoticeListAndInOutList() {
		List<Notice> noticeList = noticeMapper.selectLatestNoticeList();
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		
		return map;
	}
	
	public List<Notice> getNoticeList() {
		return noticeMapper.selectLatestNoticeList();
	}
	
	public List<Notice> getNoticeListPage(int currentPage, int rowPerPage) {
		// currentPage, rowPerPage를 통해 beginRow, rowPerPage 전달하여
		// noticeMapper 메소드를 호출한다.
		// 이후 결과값을 받아 return 한다.
		
		return null;
	}
}
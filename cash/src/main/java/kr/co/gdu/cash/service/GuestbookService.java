package kr.co.gdu.cash.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.GuestbookMapper;
import kr.co.gdu.cash.vo.Guestbook;

@Service
@Transactional
public class GuestbookService {
	@Autowired private GuestbookMapper guestbookMapper;
	public List<Guestbook> getGuestbookListPage(int currentPage, int rowPerPage) {
		// currentPage, rowPerPage를 통해 beginRow, rowPerPage 전달하여
		// noticeMapper 메소드를 호출한다.
		// 이후 결과값을 받아 return 한다.
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<Guestbook> guestbookList = guestbookMapper.selectGuestbookListByPage(map);
		
		return guestbookList;
	}
	
	public int getCountGuestbook() {
		return guestbookMapper.countGuestbook();
	}
	
	public Guestbook getGuestbookOne(int guestbookId) {
		Guestbook guestbook = guestbookMapper.selectGuestbookOne(guestbookId);
		
		return guestbook;
	}
	
	public int addGuestbook(Guestbook guestbook) {
		return guestbookMapper.insertGuestbook(guestbook);
	}
	
	public void modifyGuestbook(Guestbook guestbook) {
		guestbookMapper.updateGuestbook(guestbook);
	}
	
	public void removeGuestbook(int guestbookId) {
		guestbookMapper.deleteGuestbook(guestbookId);
	}
}
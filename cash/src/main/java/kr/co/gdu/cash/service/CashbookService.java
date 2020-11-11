package kr.co.gdu.cash.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.*;
import kr.co.gdu.cash.vo.*;

@Service
@Transactional
public class CashbookService {
	@Autowired private CashbookMapper cashBookMapper;
	
	public List<Cashbook> getCashbookListByPage(int currentPage, int rowPerPage) {
		// currentPage, rowPerPage를 통해 beginRow, rowPerPage 전달하여
		// cashBookMapper 메소드를 호출한다.
		// 이후 결과값을 받아 return 한다.
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<Cashbook> cashbookList = cashBookMapper.selectCashbookListByPage(map);
		
		return cashbookList;
	}
	
	public int getCountCashbookList() {
		return cashBookMapper.countCashbookList();
	}
	
	public List<Cashbook> getCashbookListAll() {
		List<Cashbook> cashbookList = cashBookMapper.selectCashbookListAll();
		
		return cashbookList;
	}
	
	public int getSumCashbookPriceByInOut(String cashbookKind, int currentYear, int currentMonth) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cashbookKind", cashbookKind);
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		
		Integer sum = cashBookMapper.selectSumCashbookPriceByInOut(map);
		
		return sum;
	}
	
	public List<Map<String, Object>> getCashListByMonth(int currentYear, int currentMonth) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		
		return cashBookMapper.selectCashListByMonth(map);
	}
	
	public List<Cashbook> getCashbookListByDay(int currentYear, int currentMonth, int currentDay) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		map.put("currentDay", currentDay);
		
		return cashBookMapper.selectCashbookListByDay(map);
	}
	
	public Cashbook getCashbookByDay(int cashbookId) {
		Cashbook cashbook = cashBookMapper.selectCashbookByDay(cashbookId);
		
		return cashbook;
	}
	
	public int addCashbook(Cashbook cashbook) {
		return cashBookMapper.insertCashbook(cashbook);
	}
	
	public int modifyCashbook(Cashbook cashbook) {
		System.out.println("Debug: modifyCashbook 실행 - " + cashbook);
		return cashBookMapper.updateCashbook(cashbook);
	}
	
	public int removeCashbook(int cashbookId) {
		return cashBookMapper.deleteCashbook(cashbookId);
	}
}
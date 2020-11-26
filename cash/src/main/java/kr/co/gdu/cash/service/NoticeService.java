package kr.co.gdu.cash.service;

import java.io.File;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.mapper.*;
import kr.co.gdu.cash.vo.*;

@Service
@Transactional
public class NoticeService {
	//File file = new File("");
	//private String PATH = file.getAbsoluteFile() + "\\src\\main\\webapp\\admin\\upload\\";
	
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private NoticefileMapper noticefileMapper;
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
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<Notice> noticeList = noticeMapper.selectNoticeListByPage(map);
		
		return noticeList;
	}
	
	public int getCountNotice() {
		return noticeMapper.countNotice();
	}
	
	public List<Notice> getNoticeOne(int noticeId) {
		List<Notice> noticeOne = noticeMapper.selectNoticeOne(noticeId);
		
		return noticeOne;
	}
	
	public Notice addNotice(NoticeForm noticeForm, String myPath) {
		// 1. notice DB 입력 -> Key 값을 받는다
		Notice notice = new Notice();
		// 자바스크립트가 데이터베이스에 입력되는 것을 방지
		notice.setNoticeTitle(noticeForm.getNoticeTitle().replaceAll("(?i)<script", "&lt;script"));
		notice.setNoticeContent(noticeForm.getNoticeContent().replaceAll("(?i)<script", "&lt;script"));
		
		noticeMapper.insertNotice(notice);	// setNoticeId(SELECT LAST_INSERT_ID())
		
		List<Noticefile> noticefileList = null;
		
		// 사용자가 view에서 파일을 추가해서 null이 아님
		if (noticeForm.getNoticefileList() != null) {
			noticefileList = new ArrayList<Noticefile>();
			
			for (MultipartFile mf : noticeForm.getNoticefileList()) {
				Noticefile nf = new Noticefile();
				
				nf.setNoticeId(notice.getNoticeId());
				
				String filename = UUID.randomUUID().toString().replace("-", "");	// 랜덤한 파일 이름을 생성
				int p = mf.getOriginalFilename().lastIndexOf(".");	// 확장자 점 위치 확인
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();	// 확장자 잘라내어 저장 (+ 소문자로 저장)
				
				nf.setNoticefileName(filename + ext);	// UUID로 만든 랜덤한 파일 이름 + 파일 확장자
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				
				noticefileList.add(nf);	// 파일 추가
				
				// 5. 서버에 파일을 저장
				try {
					// 파일을 지정한 경로로 옮긴다
					mf.transferTo(new File(myPath + filename + ext));
				} catch (Exception e) {		// 오류 발생 시 예외처리
					e.printStackTrace();	// 디버깅 코드를 출력
					throw new RuntimeException();	// 오류를 발생시킴으로서 트랜잭션 중단 및 작업 취소
				}
			}
		}
		
		if (noticefileList != null) {	// 파일이 존재하는 경우
			// 리스트의 반복문 만큼 for문 반복
			for (Noticefile nf : noticefileList) {
				// 데이터베이스에 파일 정보를 저장
				noticefileMapper.insertNoticefile(nf);
			}
			
			// 2. noticefileList DB 입력
			// 3. noticefileList.size()의 횟수만큼 입력.
			// 4. 입력시마다 noticeId는 1번에서 받은 Key 값 이용
		}
		
		return notice;
	}
	
	public void modifyNotice(NoticeForm noticeForm, String myPath) {
		// 1. notice DB 입력 -> Key 값을 받는다
		Notice notice = new Notice();
		// 자바스크립트가 데이터베이스에 입력되는 것을 방지
		notice.setNoticeId(noticeForm.getNoticeId());
		notice.setNoticeTitle(noticeForm.getNoticeTitle().replaceAll("(?i)<script", "&lt;script"));
		notice.setNoticeContent(noticeForm.getNoticeContent().replaceAll("(?i)<script", "&lt;script"));
		
		noticeMapper.updateNotice(notice);
		
		List<Noticefile> noticefileList = null;
		
		// 사용자가 view에서 파일을 추가해서 null이 아님
		if (noticeForm.getNoticefileList() != null) {
			noticefileList = new ArrayList<Noticefile>();
			
			for (MultipartFile mf : noticeForm.getNoticefileList()) {
				Noticefile nf = new Noticefile();
				
				nf.setNoticeId(notice.getNoticeId());
				
				String filename = UUID.randomUUID().toString().replace("-", "");	// 랜덤한 파일 이름을 생성
				int p = mf.getOriginalFilename().lastIndexOf(".");	// 확장자 점 위치 확인
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();	// 확장자 잘라내어 저장 (+ 소문자로 저장)
				
				nf.setNoticefileName(filename + ext);	// UUID로 만든 랜덤한 파일 이름 + 파일 확장자
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				
				noticefileList.add(nf);	// 파일 추가
				
				// 5. 서버에 파일을 저장
				try {
					// 파일을 지정한 경로로 옮긴다
					mf.transferTo(new File(myPath + filename + ext));
				} catch (Exception e) {		// 오류 발생 시 예외처리
					e.printStackTrace();	// 디버깅 코드를 출력
					throw new RuntimeException();	// 오류를 발생시킴으로서 트랜잭션 중단 및 작업 취소
				}
			}
		}
		
		if (noticefileList != null) {	// 파일이 존재하는 경우
			// 리스트의 반복문 만큼 for문 반복
			for (Noticefile nf : noticefileList) {
				// 데이터베이스에 파일 정보를 저장
				noticefileMapper.insertNoticefile(nf);
			}
			
			// 2. noticefileList DB 입력
			// 3. noticefileList.size()의 횟수만큼 입력.
			// 4. 입력시마다 noticeId는 1번에서 받은 Key 값 이용
		}
	}
	
	public void removeFile(Noticefile noticefile, String myPath) {
		int noticefileId = noticefile.getNoticefileId();
		String noticefileName = noticefile.getNoticefileName();
		
		// 첨부파일 경로 + 첨부파일 이름
		File file = new File(myPath + noticefileName);
		
		// 파일이 존재하는 경우
		if (file.exists()) {
			// 파일 삭제
			file.delete();
		}
		
		// 데이터베이스의 첨부파일 삭제
		noticefileMapper.deleteNoticefileOne(noticefileId);
	}
	
	public int removeNotice(int noticeId, String myPath) {
		// 게시물에 속해있는 첨부파일 이름 목록 조회
		List<String> noticefileNameList = noticefileMapper.selectNoticefileNameList(noticeId);
		
		// 첨부파일 목록에서 파일을 하나씩 불러온다
		for (String s: noticefileNameList) {
			// 첨부파일 경로 + 첨부파일 이름
			File file = new File(myPath + s);
			
			// 파일이 존재하는 경우
			if (file.exists()) {
				// 파일 삭제
				file.delete();
			}
		}
		
		// 데이터베이스의 첨부파일 목록 삭제
		noticefileMapper.deleteNoticefile(noticeId);
		
		// 데이터베이스의 게시물 삭제
		return noticeMapper.deleteNotice(noticeId);
	}
}
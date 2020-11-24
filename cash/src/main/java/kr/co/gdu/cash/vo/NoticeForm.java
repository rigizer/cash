package kr.co.gdu.cash.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoticeForm {
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private List<MultipartFile> noticefileList;	// MultipartFile을 통해 Form을 통해 받은 실제 파일이 저장됨
	
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	public List<MultipartFile> getNoticefileList() {
		return noticefileList;
	}
	public void setNoticefileList(List<MultipartFile> noticefileList) {
		this.noticefileList = noticefileList;
	}
	
	@Override
	public String toString() {
		return "NoticeForm [noticeId=" + noticeId + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + ", noticefileList=" + noticefileList + "]";
	}
}

package kr.co.gdu.cash.vo;

public class Guestbook {
	private int guestbookId;
	private String guestbookTitle;
	private String guestbookContent;
	private String guestbookDate;
	private String guestbookWriter;
	
	public int getGuestbookId() {
		return guestbookId;
	}
	public void setGuestbookId(int guestbookId) {
		this.guestbookId = guestbookId;
	}
	public String getGuestbookTitle() {
		return guestbookTitle;
	}
	public void setGuestbookTitle(String guestbookTitle) {
		this.guestbookTitle = guestbookTitle;
	}
	public String getGuestbookContent() {
		return guestbookContent;
	}
	public void setGuestbookContent(String guestbookContent) {
		this.guestbookContent = guestbookContent;
	}
	public String getGuestbookDate() {
		return guestbookDate;
	}
	public void setGuestbookDate(String guestbookDate) {
		this.guestbookDate = guestbookDate;
	}
	public String getGuestbookWriter() {
		return guestbookWriter;
	}
	public void setGuestbookWriter(String guestbookWriter) {
		this.guestbookWriter = guestbookWriter;
	}
	
	@Override
	public String toString() {
		return "Guestbook [guestbookId=" + guestbookId + ", guestbookTitle=" + guestbookTitle + ", guestbookContent="
				+ guestbookContent + ", guestbookDate=" + guestbookDate + ", guestbookWriter=" + guestbookWriter + "]";
	}
}

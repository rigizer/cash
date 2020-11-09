package kr.co.gdu.cash.vo;

public class Category {
	private String categoryName;
	private String categoryKind;
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryKind() {
		return categoryKind;
	}
	public void setCategoryInfo(String categoryKind) {
		this.categoryKind = categoryKind;
	}
	
	@Override
	public String toString() {
		return "Category [categoryName=" + categoryName + ", categoryKind=" + categoryKind + "]";
	}
}
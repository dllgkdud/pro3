package kr.go.ddm.dto;

public class ReviewDTO {
	private int no;			//번호
	private String tourno;	//투어번호
	private String cate;	//카테고리
	private String id;		//작성자
	private String content;	//내용
	private double star;	//별점
	private String imgURL;	//이미지
	private String regdate;	//작성일
	private String place;	//장소
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTourno() {
		return tourno;
	}
	public void setTourno(String tourno) {
		this.tourno = tourno;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	@Override
	public String toString() {
		return "ReviewDTO [no=" + no + ", tourno=" + tourno +", cate=" + cate
				+ ", id=" + id + ", conetnt=" + content + ", star=" + star
				+ ", imgURL=" + imgURL + ", regdate=" + regdate + "]";
	}
	
}

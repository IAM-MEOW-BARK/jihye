package kr.co.dong.catdog;

public class FaqDTO {
	private int faq_no;
	private int faq_division;
	private String faq_content;
	private String faq_reply;
	
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public int getFaq_division() {
		return faq_division;
	}
	public void setFaq_division(int faq_division) {
		this.faq_division = faq_division;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_reply() {
		return faq_reply;
	}
	public void setFaq_reply(String faq_reply) {
		this.faq_reply = faq_reply;
	}
	@Override
	public String toString() {
		return "faqDAO [faq_no=" + faq_no + ", faq_division=" + faq_division + ", faq_content=" + faq_content
				+ ", faq_reply=" + faq_reply + "]";
	}
	
	
}

package kr.co.dong.catdog;

public class CartDTO {
	private String user_id;
	private int product_code;
	private int cart_quantity;
	
	private String thumbnail_img;
	private String product_name;
	private int product_price;
	private int totalPrice;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public int getCart_quantity() {
		return cart_quantity;
	}
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	public String getThumbnail_img() {
		return thumbnail_img;
	}
	public void setThumbnail_img(String thumbnail_img) {
		this.thumbnail_img = thumbnail_img;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	@Override
	public String toString() {
		return "CartDTO [user_id=" + user_id + ", product_code=" + product_code + ", cart_quantity=" + cart_quantity
				+ ", thumbnail_img=" + thumbnail_img + ", product_name=" + product_name + ", product_price="
				+ product_price + ", totalPrice=" + totalPrice + "]";
	}
	
	
}

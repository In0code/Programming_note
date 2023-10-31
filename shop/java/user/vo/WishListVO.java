package user.vo;

public class WishListVO {

	private String gcode,img,id,wcode,gname ;
	private int price;
	public WishListVO() {
		super();
	}
	public WishListVO(String gcode, String img, String id, String wcode, String gname, int price) {
		super();
		this.gcode = gcode;
		this.img = img;
		this.id = id;
		this.wcode = wcode;
		this.gname = gname;
		this.price = price;
	}
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWcode() {
		return wcode;
	}
	public void setWcode(String wcode) {
		this.wcode = wcode;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "WishListVO [gcode=" + gcode + ", img=" + img + ", id=" + id + ", wcode=" + wcode + ", gname=" + gname
				+ ", price=" + price + "]";
	}
	
	
}

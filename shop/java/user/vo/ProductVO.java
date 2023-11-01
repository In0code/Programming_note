package user.vo;

public class ProductVO {
	String gcode, gname, main_img, img1, img2, img3, input_date, cat_code, cat_name, tmi, eng_tmi, top, heart, base, ing;
	int price, quantity, total_buy;
	
	public ProductVO() {
		super();
	}
	
	public ProductVO(String gcode, String gname, String cat_code, String cat_name, String main_img, String img1, int price, int quantity) {
		super();
		this.gcode = gcode;
		this.gname = gname;
		this.main_img = main_img;
		this.img1 = img1;
		this.cat_code = cat_code;
		this.cat_name = cat_name;
		this.price = price;
		this.quantity = quantity;
	}

	public ProductVO(String gcode, String gname, String main_img, String img1, String img2, String img3,
			String input_date, String cat_code, String tmi, String eng_tmi, String top, String heart, String base,
			String ing, int price, int quantity, int total_buy) {
		super();
		this.gcode = gcode;
		this.gname = gname;
		this.main_img = main_img;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.input_date = input_date;
		this.cat_code = cat_code;
		this.tmi = tmi;
		this.eng_tmi = eng_tmi;
		this.top = top;
		this.heart = heart;
		this.base = base;
		this.ing = ing;
		this.price = price;
		this.quantity = quantity;
		this.total_buy = total_buy;
	}
	
	public String getCat_name() {
		return cat_name;
	}

	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}

	public String getGcode() {
		return gcode;
	}

	public void setGcode(String gcode) {
		this.gcode = gcode;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getMain_img() {
		return main_img;
	}

	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getInput_date() {
		return input_date;
	}

	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}

	public String getCat_code() {
		return cat_code;
	}

	public void setCat_code(String cat_code) {
		this.cat_code = cat_code;
	}

	public String getTmi() {
		return tmi;
	}

	public void setTmi(String tmi) {
		this.tmi = tmi;
	}

	public String getEng_tmi() {
		return eng_tmi;
	}

	public void setEng_tmi(String eng_tmi) {
		this.eng_tmi = eng_tmi;
	}

	public String getTop() {
		return top;
	}

	public void setTop(String top) {
		this.top = top;
	}

	public String getHeart() {
		return heart;
	}

	public void setHeart(String heart) {
		this.heart = heart;
	}

	public String getBase() {
		return base;
	}

	public void setBase(String base) {
		this.base = base;
	}

	public String getIng() {
		return ing;
	}

	public void setIng(String ing) {
		this.ing = ing;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotal_buy() {
		return total_buy;
	}

	public void setTotal_buy(int total_buy) {
		this.total_buy = total_buy;
	}

	@Override
	public String toString() {
		return "ProductVO [gcode=" + gcode + ", gname=" + gname + ", main_img=" + main_img + ", img1=" + img1
				+ ", img2=" + img2 + ", img3=" + img3 + ", input_date=" + input_date + ", cat_code=" + cat_code
				+ ", cat_name=" + cat_name + ", tmi=" + tmi + ", eng_tmi=" + eng_tmi + ", top=" + top + ", heart="
				+ heart + ", base=" + base + ", ing=" + ing + ", price=" + price + ", quantity=" + quantity
				+ ", total_buy=" + total_buy + "]";
	}

}

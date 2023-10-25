package admin.vo;

public class BoardManageVO {
	String gname, title, rev_cont, img, rev_date, cancle, id, cat_name; 
	int star, r_view, rcode;
	
	public BoardManageVO() {
		super();
	}

	public BoardManageVO(int rcode, String cat_name, String gname, String id, String rev_date, int star) {
		super();
		this.cat_name = cat_name;
		this.gname = gname;
		this.rev_date = rev_date;
		this.id = id;
		this.star = star;
		this.rcode = rcode;
	}

	public BoardManageVO(String gname, String title, String rev_cont, String img, String rev_date, String cancle,
			String id, String cat_name, int star, int r_view, int rcode) {
		super();
		this.gname = gname;
		this.title = title;
		this.rev_cont = rev_cont;
		this.img = img;
		this.rev_date = rev_date;
		this.cancle = cancle;
		this.id = id;
		this.cat_name = cat_name;
		this.star = star;
		this.r_view = r_view;
		this.rcode = rcode;
	}
	
	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getCat_name() {
		return cat_name;
	}

	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRev_cont() {
		return rev_cont;
	}

	public void setRev_cont(String rev_cont) {
		this.rev_cont = rev_cont;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getRev_date() {
		return rev_date;
	}

	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}

	public String getCancle() {
		return cancle;
	}

	public void setCancle(String cancle) {
		this.cancle = cancle;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getR_view() {
		return r_view;
	}

	public void setR_view(int r_view) {
		this.r_view = r_view;
	}

	public int getRcode() {
		return rcode;
	}

	public void setRcode(int rcode) {
		this.rcode = rcode;
	}

	@Override
	public String toString() {
		return "BoardManageVO [gname=" + gname + ", title=" + title + ", rev_cont=" + rev_cont + ", img=" + img
				+ ", rev_date=" + rev_date + ", cancle=" + cancle + ", id=" + id + ", cat_name=" + cat_name + ", star="
				+ star + ", r_view=" + r_view + ", rcode=" + rcode + "]";
	}

}

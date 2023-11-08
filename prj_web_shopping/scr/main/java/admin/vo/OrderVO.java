package admin.vo;

public class OrderVO {

	private String ord_date,gname,name,dlvy_pro, ord_dno,ordno;
	private int amount,price ; 
	public OrderVO() {
		super();
	}
	public OrderVO(String ord_date, String gname, String name, String dlvy_pro, String ord_dno, String ordno,
			int amount, int price) {
		super();
		this.ord_date = ord_date;
		this.gname = gname;
		this.name = name;
		this.dlvy_pro = dlvy_pro;
		this.ord_dno = ord_dno;
		this.ordno = ordno;
		this.amount = amount;
		this.price = price;
	}
	public String getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(String ord_date) {
		this.ord_date = ord_date;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDlvy_pro() {
		return dlvy_pro;
	}
	public void setDlvy_pro(String dlvy_pro) {
		this.dlvy_pro = dlvy_pro;
	}
	public String getOrd_dno() {
		return ord_dno;
	}
	public void setOrd_dno(String ord_dno) {
		this.ord_dno = ord_dno;
	}
	public String getOrdno() {
		return ordno;
	}
	public void setOrdno(String ordno) {
		this.ordno = ordno;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "OrderVO [ord_date=" + ord_date + ", gname=" + gname + ", name=" + name + ", dlvy_pro=" + dlvy_pro
				+ ", ord_dno=" + ord_dno + ", ordno=" + ordno + ", amount=" + amount + ", price=" + price + "]";
	}
	
	
}

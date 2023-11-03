package admin.vo;

public class OrderVO {

	private String ord_date,gname,name,dlvy_pro;
	private int ordno,amount,price ,ord_dno; 
	public OrderVO() {
		super();
	}
	public OrderVO(String ord_date, String gname, String name, String dlvy_pro, int ordno, int amount, int price,
			int ord_dno) {
		super();
		this.ord_date = ord_date;
		this.gname = gname;
		this.name = name;
		this.dlvy_pro = dlvy_pro;
		this.ordno = ordno;
		this.amount = amount;
		this.price = price;
		this.ord_dno = ord_dno;
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
	public int getOrdno() {
		return ordno;
	}
	public void setOrdno(int ordno) {
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
	public int getOrd_dno() {
		return ord_dno;
	}
	public void setOrd_dno(int ord_dno) {
		this.ord_dno = ord_dno;
	}
	@Override
	public String toString() {
		return "OrderVO [ord_date=" + ord_date + ", gname=" + gname + ", name=" + name + ", dlvy_pro=" + dlvy_pro
				+ ", ordno=" + ordno + ", amount=" + amount + ", price=" + price + ", ord_dno=" + ord_dno + "]";
	}

	
}

package admin.vo;

public class RecallVO {

	private String name, ord_date, recall_date ,gname ,dlvy_pro, ordno ,ord_dno;
	private int amount ,price ; 
	public RecallVO() {
		super();
	}
	public RecallVO(String name, String ord_date, String recall_date, String gname, String dlvy_pro, String ordno,
			String ord_dno, int amount, int price) {
		super();
		this.name = name;
		this.ord_date = ord_date;
		this.recall_date = recall_date;
		this.gname = gname;
		this.dlvy_pro = dlvy_pro;
		this.ordno = ordno;
		this.ord_dno = ord_dno;
		this.amount = amount;
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(String ord_date) {
		this.ord_date = ord_date;
	}
	public String getRecall_date() {
		return recall_date;
	}
	public void setRecall_date(String recall_date) {
		this.recall_date = recall_date;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getDlvy_pro() {
		return dlvy_pro;
	}
	public void setDlvy_pro(String dlvy_pro) {
		this.dlvy_pro = dlvy_pro;
	}
	public String getOrdno() {
		return ordno;
	}
	public void setOrdno(String ordno) {
		this.ordno = ordno;
	}
	public String getOrd_dno() {
		return ord_dno;
	}
	public void setOrd_dno(String ord_dno) {
		this.ord_dno = ord_dno;
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
		return "RecallVO [name=" + name + ", ord_date=" + ord_date + ", recall_date=" + recall_date + ", gname=" + gname
				+ ", dlvy_pro=" + dlvy_pro + ", ordno=" + ordno + ", ord_dno=" + ord_dno + ", amount=" + amount
				+ ", price=" + price + "]";
	}
	
	
}

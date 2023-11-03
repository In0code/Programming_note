package admin.vo;

public class RecallVO {

	private String name, ord_date, recall_date ,gname ,dlvy_pro;
	private int ordno ,amount ,price ; 
	public RecallVO() {
		super();
	}
	public RecallVO(String name, String ord_date, String recall_date, String gname, String dlvy_pro, int ordno,
			int amount, int price) {
		super();
		this.name = name;
		this.ord_date = ord_date;
		this.recall_date = recall_date;
		this.gname = gname;
		this.dlvy_pro = dlvy_pro;
		this.ordno = ordno;
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
	@Override
	public String toString() {
		return "RecallVO [name=" + name + ", ord_date=" + ord_date + ", recall_date=" + recall_date + ", gname=" + gname
				+ ", dlvy_pro=" + dlvy_pro + ", ordno=" + ordno + ", amount=" + amount + ", price=" + price + "]";
	}
	
	
}

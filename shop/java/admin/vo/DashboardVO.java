package admin.vo;

public class DashboardVO {
	
	String gname, date;
	int amount, sales, signCnt, visitCnt, ordCnt;
	
	public DashboardVO() {
		super();
	}
	
	public DashboardVO(String gname, int amount) {
		super();
		this.gname = gname;
		this.amount = amount;
	}
	
	public DashboardVO(int sales, int signCnt, int visitCnt, int ordCnt) {
		super();
		this.sales = sales;
		this.signCnt = signCnt;
		this.visitCnt = visitCnt;
		this.ordCnt = ordCnt;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getSignCnt() {
		return signCnt;
	}

	public void setSignCnt(int signCnt) {
		this.signCnt = signCnt;
	}

	public int getVisitCnt() {
		return visitCnt;
	}

	public void setVisitCnt(int visitCnt) {
		this.visitCnt = visitCnt;
	}

	public int getOrdCnt() {
		return ordCnt;
	}

	public void setOrdCnt(int ordCnt) {
		this.ordCnt = ordCnt;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}
	
	public String getGname() {
		return gname;
	}
	
	public void setGname(String gname) {
		this.gname = gname;
	}
	
	public int getAmount() {
		return amount;
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
	}


}

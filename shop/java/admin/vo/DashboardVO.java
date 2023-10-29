package admin.vo;

public class DashboardVO {
	
	String gname;
	int amount;
	
	public DashboardVO() {
		super();
	}
	
	public DashboardVO(String gname, int amount) {
		super();
		this.gname = gname;
		this.amount = amount;
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

	@Override
	public String toString() {
		return "DashboardVO [gname=" + gname + ", amount=" + amount + "]";
	}
	
}

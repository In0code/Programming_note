package user.vo;

public class BuyPaymentVO {
	
	private String ordno, cardNum;
	
	public BuyPaymentVO() {
	}

	public BuyPaymentVO(String ordno, String cardNum) {
		this.ordno = ordno;
		this.cardNum = cardNum;
	}

	public String getOrdno() {
		return ordno;
	}

	public void setOrdno(String ordno) {
		this.ordno = ordno;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	@Override
	public String toString() {
		return "BuyPaymentVO [ordno=" + ordno + ", cardNum=" + cardNum + "]";
	}
}
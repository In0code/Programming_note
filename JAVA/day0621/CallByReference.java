package day0621;

public class CallByReference {
	int i;
	int j;
	
	public void swap (CallByReference cbr) {
		int temp=0;
		temp=cbr.i;
		cbr.i=cbr.j;
		cbr.j=temp;
		System.out.println("swap 안 i = "+cbr.i+", j = "+cbr.j);
		
	}
	public static void main(String[] args) {
		CallByReference cbr=new CallByReference();
		cbr.i=6;
		cbr.j=21;
		System.out.println("swap 전 i = "+cbr.i+", j = "+cbr.j);
		cbr.swap(cbr);
		System.out.println("swap 후 i = "+cbr.i+", j = "+cbr.j);
	}

}

package day0726;

import day0725.UseThread;

public class UseSleep2 implements Runnable {

	@Override
	public void run() {


		System.out.print("loading");
		for(int i=0; i<15; i++) {
			System.out.print(".");
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//end catch
		}//and for
		System.out.print("finish");
	}// run

	public static void main(String[] args) {
		Thread t = new Thread(new UseSleep2());
		t.run();
	}// main

}// class

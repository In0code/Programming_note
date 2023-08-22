package day0629;

public class UseRamen {

	public static void main(String[] args) {
		
		ShinRamen shin=new ShinRamen();
		NeoguriRamen guri=new NeoguriRamen();
		
		System.out.printf("신라면 맛의 비결 %s\n신라면은 %s\n라면의 종류는 %s\n라면을 한 층 더 업그레이드 시켜주는 %s\n라면은 %s\n",
				shin.soup(),shin.hotSpicy(),shin.type(),shin.ingredients(),shin.paperbag());
		System.out.println("---------------------------------------");
		System.out.printf("너구리 라면의 %s\n%s\n%s\n라면은 %s\n너구리 라면은 %s\n",
				guri.soup(),guri.ingredients(),guri.type(),guri.paperbag(),guri.kelp());
		
		
		
		
	}//main

}//class

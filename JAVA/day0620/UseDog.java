package day0620;

public class UseDog {

	public static void main(String[] args) {

		Dog chiwawa=new Dog();
		chiwawa.setEye(2);
		chiwawa.setTail(1);
		chiwawa.setLegs(4);
		chiwawa.setSpecies("치와와");
		
		System.out.printf("이 강아지의 종은 %s이고, 눈은 %d개입니다. 꼬리는 %d개 있고, 다리는 %d개입니다\n"
				,chiwawa.getSpecies(),chiwawa.getEye(),chiwawa.getTail(),chiwawa.getLegs());
		System.out.printf(chiwawa.bark());
		System.out.printf(chiwawa.bark("병원",50000));
		
		System.out.printf(chiwawa.smell());
		System.out.printf(chiwawa.smell("바나나",5000));
		
		System.out.println("--------------------------------------------------------");
		Dog maltiz=new Dog();
		maltiz.setEye(2);
		maltiz.setTail(1);
		maltiz.setLegs(4);
		maltiz.setSpecies("말티즈");
		
		System.out.printf("이 강아지의 종은 %s이고, 눈은 %d개입니다. 꼬리는 %d개 있고, 다리는 %d개입니다\n"
				,maltiz.getSpecies(),maltiz.getEye(),maltiz.getTail(),maltiz.getLegs());
		System.out.printf(maltiz.bark());
		System.out.printf(maltiz.bark("법원",850000));
		
		System.out.printf(maltiz.smell());
		System.out.printf(maltiz.smell("개껌",3600));
		
		System.out.println("----------------------------------------------------------");
		
		Dog huski=new Dog();
		huski.setEye(2);
		huski.setTail(1);
		huski.setLegs(4);
		huski.setSpecies("허스키");
		
		System.out.printf("이 강아지의 종은 %s이고, 눈은 %d개입니다. 꼬리는 %d개 있고, 다리는 %d개입니다\n"
				,huski.getSpecies(),huski.getEye(),huski.getTail(),huski.getLegs());
		System.out.printf(huski.bark());
		System.out.printf(huski.bark("레스토랑",32000));
		
		System.out.printf(huski.smell());
		System.out.printf(huski.smell("당근",9500));
		
	}

}

package day0616;

public class Work0616 {
   //고정일-반환값없고 매개변수 없는형
   //public void typeA(){
   // 일
   //}
   
//   호출) 
//   객체명.typeA();
   public void printName(String name) {
      System.out.println("내이름은 "+name);
   }//고정일
   
   //고정값- 반환값 있고, 매개변수 없는 형
   //public int typeC(){
   //  return k;
   //}
//   호츨
//   데이터형 변수명=객체명.typeC();
   public char printInital() {
      return 'k';
   }//고정값
   
//   가변일 - 반환값 없고, 매개변수 있는 형
   public void score(int num){
      if(num>-1 && num<101) {
         if(num<40) {
            System.out.println(num+"점은 과락");
         }else if (num>39 && num<60){
            System.out.println(num+"점은 다른과목 참조");
         }else {
            System.out.println(num+"점은 합격");
         }
      }else {
         System.out.println(num+"점은 잘못된 점수");
      }//end if
   }//가변일
   
   public void text(int te) {
      if (te>64 && te<91) {
         System.out.println((char)te+" 는 대문자");
      }else if(te>98 && te<123) {
         System.out.println((char)te+ " 는 소문자");
      }else {
         System.out.println((char)te+ " 는 숫자");
      }
   }//문자 판별 - 가변일
   
   public int born(int br, int a) {
      System.out.println("나이는 "+ (br-a+1));
      return br;
   }//나이 판정 - 가변값
   
   public int number(int nb, int bn) {
      
      if (nb > bn) {
         System.out.println(nb+"와 "+bn+" 중에 큰 수는 "+nb);
      }else if(nb < bn) {
         System.out.println(nb+"와 "+bn+" 중에 큰 수는 "+bn);
      }else {
         System.out.println(nb);
      }
      
      return nb;
   }//큰 수 반환 - 가변 값
   
     
   public static void main(String[] args) {
      //이름출력 - 고정일
      Work0616 n = new Work0616();
      n.printName("김인영"); 
      
      //이니셜 첫글자 출력- 고정값
      char ini=n.printInital();
      System.out.println("내 이니셜의 첫 글자는 "+ini);
      
      //점수판정 - 가변일
      n.score(Integer.parseInt(args[0]));
      
      //문자 판별- 가변일
      n.text(Integer.parseInt(args[1]));
      n.text('k');
      
      //태어난 해 입력받아 나이 반환 - 가변값
      n.born(2023, Integer.parseInt(args[2]) );
      
      //큰 수 반환 - 가변값
      n.number(Integer.parseInt(args[3]), Integer.parseInt(args[4]) );
      
   }//main

}//class
package day0615;

public class Work0615 {


   /**
    * 숙제.
   구구단 전체 단을 옆으로 출력해 보세요.
    2x1=2      3x1 =3                 9x1=9
       
    2x9=18     3x9=27                9x9=81
    * 
    * @author user
    *
    */
      
      public static void main(String[] args) {
         int i;
         int j;
         for (i=1; i<10; i++) {
            for (j=2; j<10; j++) {
               System.out.print(" "+j+" * "+i+" = "+i*j+" \t ");
               
            }
            System.out.println();
         }
         
         System.out.println();
         
         
         
         
//숙제 2. 아래와 같은 형태로 숫자 앞에 공백을 넣어 출력하세요.
//0
//  1
//      2
//        3
//          4
//            5
//              6
//                7
//                  8
//                    9
         
         for (i=0; i<10; i++) {
            //스페이스
            for (j=0; j<i; j++) {
            System.out.print(" ");
               }//end for
         //숫자
            System.out.print(i);
         System.out.println();
         }
            
         System.out.println();
         
//////         숙제 3. 1~100까지 수중 3의 배수합을 출력해보세요.
//      
         int sum=0;
         for (i=1; i<101; i++) {
            if (i%3==0) {
               sum +=i;
            }
         }
         System.out.println(sum);
         
         System.out.println();
         
         
         
         
         
         
         
         
         
         
         
      

   }

}
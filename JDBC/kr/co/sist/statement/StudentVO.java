package kr.co.sist.statement;

import java.sql.Date;

public class StudentVO {
   private int num;
   private String name;
   private int age;
   private String email;
   private Date input_date;
   
   public StudentVO () {
      
   }
   
   /**
    * @return the num
    */
   public int getNum() {
      return num;
   }

   /**
    * @param num the num to set
    */
   public void setNum(int num) {
      this.num = num;
   }

   /**
    * @return the name
    */
   public String getName() {
      return name;
   }

   /**
    * @param name the name to set
    */
   public void setName(String name) {
      this.name = name;
   }

   /**
    * @return the age
    */
   public int getAge() {
      return age;
   }

   /**
    * @param age the age to set
    */
   public void setAge(int age) {
      this.age = age;
   }

   /**
    * @return the email
    */
   public String getEmail() {
      return email;
   }

   /**
    * @param email the email to set
    */
   public void setEmail(String email) {
      this.email = email;
   }

   /**
    * @return the input_date
    */
   public Date getInput_date() {
      return input_date;
   }

   /**
    * @param input_date the input_date to set
    */
   public void setInput_date(Date input_date) {
      this.input_date = input_date;
   }

   
   public StudentVO(int num, String name, int age, String email, Date input_date) {
      super();
      this.num = num;
      this.name = name;
      this.age = age;
      this.email = email;
      this.input_date = input_date;
   }

   @Override
   public String toString() {
      return "StudentVO [num=" + num + ", name=" + name + ", age=" + age + ", email=" + email + ", input_date="
            + input_date + "]";
   }
}
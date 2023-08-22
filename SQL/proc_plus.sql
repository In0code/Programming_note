   -- 숫자 2개를 입력받아 +연산 후 연산결과를 내보내는 Procedure작성
CREATE OR REPLACE  PROCEDURE plus_proc(num1 IN NUMBER, num2 NUMBER, num3 OUT number)
IS

BEGIN
      num3 := num1 + num2;

END;
/
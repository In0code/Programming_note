--숫자 두 개를 입력받아 +연산 후 연산 결과를 내보내는 Procedure 작성

CREATE OR REPLACE PROCEDURE plus_proc(num1 IN NUMBER , num2 NUMBER, num3 NUMBER OUT NUMBER)
IS 

BEGIN
	num2 := num1 + num2;
END;

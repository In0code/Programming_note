   -- ���� 2���� �Է¹޾� +���� �� �������� �������� Procedure�ۼ�
CREATE OR REPLACE  PROCEDURE plus_proc(num1 IN NUMBER, num2 NUMBER, num3 OUT number)
IS

BEGIN
      num3 := num1 + num2;

END;
/
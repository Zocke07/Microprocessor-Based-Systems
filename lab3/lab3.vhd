LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE work.lab3_package.all;

ENTITY lab3 IS
PORT(
	X,Y : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
	a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2,led : out std_logic);
END lab3;

ARCHITECTURE Structure OF lab3 IS
  SIGNAL C  : STD_LOGIC_VECTOR(0 TO 7);
  SIGNAL S  : STD_LOGIC_VECTOR(0 To 7);
  SIGNAL judge : STD_LOGIC_VECTOR(0 to 7);
  SIGNAL temp  : STD_LOGIC_VECTOR(0 to 7);
  SIGNAL carry  : std_logic_vector(0 to 1);
  SIGNAL Cjudge : std_logic_vector(0 to 1);
  SIGNAL add  : std_logic;
  SIGNAL Cout : std_logic;
  SIGNAL light : std_logic;
	
BEGIN
  stage0:fulladd PORT MAP (C(0),X(0),Y(0),temp(0),C(1));
  stage1:fulladd PORT MAP (C(1),X(1),Y(1),temp(1),C(2));
  stage2:fulladd PORT MAP (C(2),X(2),Y(2),temp(2),C(3));
  stage3:fulladd PORT MAP (C(3),X(3),Y(3),temp(3),Cjudge(0));
  carry(0) <= (Cjudge(0) or (temp(3) and temp(2)) or (temp(3) and temp(1)));
  stage4:fulladd PORT MAP (judge(0),temp(0),'0',S(0),judge(1));
  stage5:fulladd PORT MAP (judge(1),temp(1),carry(0),S(1),judge(2));
  stage6:fulladd PORT MAP (judge(2),temp(2),carry(0),S(2),judge(3));
  stage7:fulladd PORT MAP (judge(3),temp(3),'0',S(3),judge(4));
  add <= (Cjudge(0) or judge(4));

  stage8:fulladd PORT MAP (add,X(4),Y(4),temp(4),C(5));
  stage9:fulladd PORT MAP (C(5),X(5),Y(5),temp(5),C(6));
  stage10:fulladd PORT MAP (C(6),X(6),Y(6),temp(6),C(7));
  stage11:fulladd PORT MAP (C(7),X(7),Y(7),temp(7),Cjudge(1));
  carry(1) <= (Cjudge(1) or (temp(7) and temp(6)) or (temp(7) and temp(5)));
  stage12:fulladd PORT MAP (judge(4),temp(4),'0',S(4),judge(5));
  stage13:fulladd PORT MAP (judge(5),temp(5),carry(1),S(5),judge(6));
  stage14:fulladd PORT MAP (judge(6),temp(6),carry(1),S(6),judge(7));
  stage15:fulladd PORT MAP (judge(7),temp(7),'0',S(7),Cout);
  light <= (Cout or (S(7) and S(6)) or (S(7) and S(5)));
  stage16:decto7 PORT MAP (S(0), S(1), S(2), S(3), S(4), S(5), S(6), S(7), light, a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2,led);
END Structure;

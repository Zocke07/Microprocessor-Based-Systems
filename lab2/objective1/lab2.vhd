LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE work.lab2_package.all;

ENTITY lab2 IS
PORT(
	X,Y : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
	a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2,led: out std_logic);

END lab2;

ARCHITECTURE Structure OF lab2 IS
	SIGNAL C : STD_LOGIC_VECTOR(0 TO 7);
	SIGNAL S : STD_LOGIC_VECTOR(0 To 7);
	SIGNAL Cout: std_logic;
	
	
BEGIN
	stage0:fulladd PORT MAP (C(0),X(0),Y(0),S(0),C(1));
	stage1:fulladd PORT MAP (C(1),X(1),Y(1),S(1),C(2));
	stage2:fulladd PORT MAP (C(2),X(2),Y(2),S(2),C(3));
	stage3:fulladd PORT MAP (C(3),X(3),Y(3),S(3),C(4));
	stage4:fulladd PORT MAP (C(4),X(4),Y(4),S(4),C(5));
	stage5:fulladd PORT MAP (C(5),X(5),Y(5),S(5),C(6));
	stage6:fulladd PORT MAP (C(6),X(6),Y(6),S(6),C(7));
	stage7:fulladd PORT MAP (C(7),X(7),Y(7),S(7),Cout);
	stage8:hex PORT MAP (S(3), S(2), S(1), S(0), S(7), S(6), S(5), S(4), Cout, a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2,led);
	

END Structure;

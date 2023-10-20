library ieee;
use ieee.std_logic_1164.all;

entity hex IS
	PORT (s0,s1,s2,s3,s4,s5,s6,s7,Cout: in std_logic;
			a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2,led: out std_logic);
END hex;

architecture func of hex is
begin
	a1 <= (s1 and not s2 and not s3) or (s0 and s1 and not s2) or (not s0 and not s1 and not s2 and s3) or (s0 and not s1 and s2 and s3);
	b1 <= (s1 and s2 and not s3) or (s0 and s2 and s3) or (s0 and s1 and not s3) or (not s0 and s1 and not s2 and s3);
	c1 <= (not s0 and not s1 and s2 and not s3) or (s0 and s1 and not s3) or (s0 and s1 and s2);
	d1 <= (not s1 and not s2 and s3) or (not s0 and s1 and not s2 and not s3) or (s1 and s2 and s3) or (s0 and not s1 and s2 and not s3);
	e1 <= (not s0 and s3) or (not s0 and s1 and not s2) or (not s1 and not s2 and s3);
	f1 <= (not s0 and not s1 and s3) or (not s0 and not s1 and s2) or (not s0 and s2 and s3) or (s0 and s1 and not s2);
	g1 <= (not s0 and not s1 and not s2) or (not s0 and s1 and s2 and s3);
	a2 <= (s5 and not s6 and not s7) or (s4 and s5 and not s6) or (not s4 and not s5 and not s6 and s7) or (s4 and not s5 and s6 and s7);
	b2 <= (s5 and s6 and not s7) or (s4 and s6 and s7) or (s4 and s5 and not s7) or (not s4 and s5 and not s6 and s7);
	c2 <= (not s4 and not s5 and s6 and not s7) or (s4 and s5 and not s7) or (s4 and s5 and s6);
	d2 <= (not s5 and not s6 and s7) or (not s4 and s5 and not s6 and not s7) or (s5 and s6 and s7) or (s4 and not s5 and s6 and not s7);
	e2 <= (not s4 and s7) or (not s4 and s5 and not s6) or (not s5 and not s6 and s7);
	f2 <= (not s4 and not s5 and s7) or (not s4 and not s5 and s6) or (not s4 and s6 and s7) or (s4 and s5 and not s6);
	g2 <= (not s4 and not s5 and not s6) or (not s4 and s5 and s6 and s7);
	led <= Cout;
	
end func;
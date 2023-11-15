library ieee;
use ieee.std_logic_1164.all;

entity hex IS
	PORT (s0,s1,s2,s3,s4,s5,s6,s7,Cout: in std_logic;
	      a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2,led: out std_logic);
END hex;

architecture func of hex is
begin
	a1 <= (s2 and not s1 and not s0) or (s3 and s2 and not s1) or (not s3 and not s2 and not s1 and s0) or (s3 and not s2 and s1 and s0);
	b1 <= (s2 and s1 and not s0) or (s3 and s1 and s0) or (s3 and s2 and not s0) or (not s3 and s2 and not s1 and s0);
	c1 <= (not s3 and not s2 and s1 and not s0) or (s3 and s2 and not s0) or (s3 and s2 and s1);
	d1 <= (not s2 and not s1 and s0) or (not s3 and s2 and not s1 and not s0) or (s2 and s1 and s0) or (s3 and not s2 and s1 and not s0);
	e1 <= (not s3 and s0) or (not s3 and s2 and not s1) or (not s2 and not s1 and s0);
	f1 <= (not s3 and not s2 and s0) or (not s3 and not s2 and s1) or (not s3 and s1 and s0) or (s3 and s2 and not s1);
	g1 <= (not s3 and not s2 and not s1) or (not s3 and s2 and s1 and s0);
	a2 <= (s6 and not s5 and not s4) or (s7 and s6 and not s5) or (not s7 and not s6 and not s5 and s4) or (s7 and not s6 and s5 and s4);
	b2 <= (s6 and s5 and not s4) or (s7 and s5 and s4) or (s7 and s6 and not s4) or (not s7 and s6 and not s5 and s4);
	c2 <= (not s7 and not s6 and s5 and not s4) or (s7 and s6 and not s4) or (s7 and s6 and s5);
	d2 <= (not s6 and not s5 and s4) or (not s7 and s6 and not s5 and not s4) or (s6 and s5 and s4) or (s7 and not s6 and s5 and not s4);
	e2 <= (not s7 and s4) or (not s7 and s6 and not s5) or (not s6 and not s5 and s4);
	f2 <= (not s7 and not s6 and s4) or (not s7 and not s6 and s5) or (not s7 and s5 and s4) or (s7 and s6 and not s5);
	g2 <= (not s7 and not s6 and not s5) or (not s7 and s6 and s5 and s4);
	led <= Cout;
end func;

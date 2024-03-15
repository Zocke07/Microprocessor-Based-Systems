library ieee;
use ieee.std_logic_1164.all;

entity hex IS
	PORT (s0,s1,s2,s3: in std_logic;
	      a1,b1,c1,d1,e1,f1,g1: out std_logic);
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
end func;

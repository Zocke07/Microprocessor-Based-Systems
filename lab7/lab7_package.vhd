library ieee;
use ieee.std_logic_1164.all; 

package lab7_package is 
	component hex
		PORT (s0,s1,s2,s3: in std_logic;
				a1,b1,c1,d1,e1,f1,g1: out std_logic);
	end component hex;
end lab7_package;
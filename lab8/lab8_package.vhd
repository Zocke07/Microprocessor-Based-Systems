LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
package lab8_package IS
	component hex
		PORT (s7,s6,s5,s4,s3,s2,s1,s0: in std_logic;
			a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2: out std_logic);
	END component hex;
END lab8_package;
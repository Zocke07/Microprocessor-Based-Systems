LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
package lab2_package IS
	component fullsub
		PORT ( Cin, X, Y : IN STD_LOGIC ;
				S, Cout : OUT STD_LOGIC ) ;
	END component fullsub;
	
	component hex
		PORT (s0,s1,s2,s3,s4,s5,s6,s7,Cout: in std_logic;
			a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2,led: out std_logic);
	END component hex;
END lab2_package;

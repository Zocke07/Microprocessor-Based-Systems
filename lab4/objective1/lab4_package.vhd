LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
package lab4_package IS
	component fulladd
		PORT ( Cin, X, Y : IN STD_LOGIC ;
		      S, Cout : OUT STD_LOGIC ) ;
	END component fulladd;
	
	component decto7
		port ( sum0,sum1,sum2,sum3,sum4,sum5,sum6,sum7,light 	: in std_logic;
		      a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2,led  : out std_logic);
	END component decto7;
END lab4_package;

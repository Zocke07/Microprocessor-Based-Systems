LIBRARY ieee;
USE ieee.std_logic_1164.all;
package lab4_package IS
	component lab4
	port (A, B, less, cin	: in STD_LOGIC;
			opcode	: in STD_LOGIC_VECTOR(3 downto 0);
			result, set, cout	: OUT STD_LOGIC);
	END component lab4;
	
	component hex
		PORT (s0,s1,s2,s3,s4,s5,s6,s7: in std_logic;
	      a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2: out std_logic);
	END component hex;
	
	component fulladd
		PORT(Cin,X,Y : in std_logic;
			S,Cout : out std_logic);
	END component fulladd;
	
	component mux2to1 IS
	  PORT (w0, w1, s  : IN STD_LOGIC;
			  f  	       : OUT STD_LOGIC);
	END component mux2to1;
	
	component mux4to1 IS
	  PORT ( w0, w1, w2, w3   : IN STD_LOGIC;
				s                : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
				f                : OUT STD_LOGIC);
	END component mux4to1;
END lab4_package;
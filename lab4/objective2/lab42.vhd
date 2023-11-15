library ieee;
use ieee.std_logic_1164.all;
use WORK.lab4_package.all;

entity lab42 is
	port (opcode	: in std_logic_vector(3 downto 0);
			A, B		: in std_logic_vector(6 downto 0);
			a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2	: out std_logic);
end lab42;

architecture behavior of lab42 is
	signal set, ignore, cin	: std_logic;
	signal result, cout	: std_logic_vector(6 downto 0);

begin
	forlabel : for i in 0 to 6 generate
		if1 : if i = 0 generate
			stage1 : lab4 port map (A(i), B(i), set, '0', opcode(3 downto 0), result(i), ignore, cout(i));
			end generate;
		if2 : if (6 > i) and (i > 1) generate
			stage2 : lab4 port map (A(i), B(i), '0', cout(i-1), opcode(3 downto 0), result(i), ignore, cout(i));
			end generate;
		if3 : if i = 6 generate
			stage3 : lab4 port map (A(i), B(i), '0', cout(i-1), opcode(3 downto 0), result(i), set, cout(i));
			end generate;
		end generate;
	resultstage : hex port map (result(0), result(1), result(2), result(3), result(4), result(5), result(6), '0', a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2);
end behavior;
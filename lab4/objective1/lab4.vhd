library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE work.lab4_package.all;


entity lab4 is
	port(A,B,less,Cin: in STD_LOGIC;
			opcode: in STD_LOGIC_VECTOR(3 downto 0);
			result,set,Cout1,Cout2,over: out STD_LOGIC);
end;

Architecture LogicFunc of lab4 is
	signal first : STD_LOGIC;
	signal second : STD_LOGIC;
	signal temp1,temp2,temp3 : STD_LOGIC;
begin
	first <= A xor opcode(3);
	second <= B xor opcode(2);
	
	stage1:fulladd PORT MAP ('0',first,second,temp1,Cout1);
	stage2:fulladd PORT MAP ('1',first,second,temp2,temp3);
	
	With opcode Select
		result <=first and second When "0000",
					first or second When "0001",
					temp1 When "0010",
					temp2 When "0110",
					first and second When "1100",
					'0' when Others;
					
	With opcode Select
		 over <= temp3 When "0110",
					'0' when Others;
	
end LogicFunc;
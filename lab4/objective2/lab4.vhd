library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE work.lab4_package.all;

entity lab4 is
	port (A, B, less, cin	: in STD_LOGIC;
			opcode	: in STD_LOGIC_VECTOR(3 downto 0);
			result, set, cout	: OUT STD_LOGIC);
end lab4;

architecture func of lab4 is
	signal orgate, andgate, add	: STD_LOGIC;
	signal outA, outB	: STD_LOGIC;
begin
	stage1 : mux2to1 port map (w0 => A, w1 => not(A), s => opcode(3), f => outA);
	stage2 : mux2to1 port map (w0 => B, w1 => not(B), s => opcode(2), f => outB);
	
	addstage : fulladd port map (cin, outA, outB, add, cout);
	
	orgate <= outA or outB;
	andgate <= outA and outB;
	
	stage3 : mux4to1 port map (w0 => andgate, w1 => orgate, w2 => add, w3 => less, s(0) => opcode(0), s(1) => opcode(1), f => result);
end func;
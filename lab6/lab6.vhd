library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity lab6 is
	port(
		clk,reset,w	:	in std_logic;
		output	:	out std_logic_vector(2 downto 0)
	);
end lab6;
	
architecture logicFunc of lab6 is
	SIGNAL y_present, y_next : STD_LOGIC_VECTOR(2 DOWNTO 0);
	CONSTANT A : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000" ;
	CONSTANT B : STD_LOGIC_VECTOR(2 DOWNTO 0) := "001" ;
	CONSTANT C : STD_LOGIC_VECTOR(2 DOWNTO 0) := "010" ;
	CONSTANT D : STD_LOGIC_VECTOR(2 DOWNTO 0) := "011" ;
	CONSTANT E : STD_LOGIC_VECTOR(2 DOWNTO 0) := "100" ;
	CONSTANT F : STD_LOGIC_VECTOR(2 DOWNTO 0) := "101" ;
	
BEGIN
	PROCESS ( w, y_present )
	BEGIN
		CASE y_present IS
			WHEN A =>
				IF w = '0' THEN y_next <= A ;
				ELSE y_next <= B ;
				END IF ;
			WHEN B =>
				IF w = '0' THEN y_next <= C ;
				ELSE y_next <= D ;
				END IF ;
			WHEN C =>
				IF w = '0' THEN y_next <= E ;
				ELSE y_next <= E ;
				END IF ;
			WHEN D =>
				IF w = '0' THEN y_next <= E ;
				ELSE y_next <= E ;
				END IF ;
			WHEN E =>
				IF w = '0' THEN y_next <= B ;
				ELSE y_next <= F ;
				END IF ;
			WHEN OTHERS =>
				y_next <= F ;
		END CASE ;
	END PROCESS ;
	
	PROCESS ( clk, reset )
	BEGIN
	IF reset = '1' THEN
		y_present <= A ;
	ELSIF (clk'EVENT AND clk = '1') THEN
		y_present <= y_next ;
	END IF ;
	END PROCESS ;
	output <= y_present;
END logicFunc;
		

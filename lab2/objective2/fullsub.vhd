library ieee;
use ieee.std_logic_1164.all;

entity fullsub is
	PORT(Cin,X,Y : in std_logic;
			S,Cout : out std_logic);
end fullsub;

architecture func of fullsub is
begin
	S <= X xor Y xor Cin;
	Cout <= (Y and Cin) or (not X and Y) or (not X and Cin);
end func;
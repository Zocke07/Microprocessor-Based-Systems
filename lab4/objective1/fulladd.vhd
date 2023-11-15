library ieee;
use ieee.std_logic_1164.all;

entity fulladd is
	PORT(Cin,X,Y : in std_logic;
			S,Cout : out std_logic);
end fulladd;

architecture func of fulladd is
begin
	S <= X xor Y xor Cin;
	Cout <= (X and Y) or (Cin and X) or (Cin and Y);
end func;

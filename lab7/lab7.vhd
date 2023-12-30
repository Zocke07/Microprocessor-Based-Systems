library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.lab7_package.all;

entity lab7 is
	generic (N: integer:=8);
    port (
		clk, reset: in std_logic;
		divisor: in std_logic_vector(7 downto 0);
		dividend: in std_logic_vector(7 downto 0);
		quotient: out std_logic_vector(7 downto 0);
		remainder: out std_logic_vector(7 downto 0);
		output: out std_logic_vector(2 downto 0);
		hex0: out std_logic_vector(6 downto 0);
		hex1: out std_logic_vector(6 downto 0);
		hex2: out std_logic_vector(6 downto 0);
		hex3: out std_logic_vector(6 downto 0)
    );
end lab7;

architecture dosth of lab7 is
	TYPE state_type is (start, s1, s2a, s2b, s3, s4);
	signal w : std_logic :='0';	
	signal repeat:integer range 0 to 9 :=0;
	signal state : state_type := start;
--	signal counter : std_logic :='0';
	signal nowDivisor: std_logic_vector(16 downto 0) :=  "00000000000000000";
	signal nowRemainder: std_logic_vector(16 downto 0) :=  "00000000000000000";
--	signal nowSub: std_logic_vector(16 downto 0) :=  "00000000010000000";
	signal nowQuotient: std_logic_vector(7 downto 0) :=  "00000000";
begin
	
	process(nowDivisor, nowQuotient, state, clk, reset,nowRemainder,w,repeat)
	variable tmp : std_logic_vector(16 downto 0) := "00000000000000000";
	begin
--		if (rising_edge(clk)) then
--			if(counter = '1') then
--				counter <= '0';
--			else 
--				counter <= '1';
--			end if;
--		end if;

--		if (rising_edge(counter)) then 
		if clk'event and clk = '1' then
			
			case(state) is
				when start => 
					repeat<=0;
					nowDivisor <= "0" &divisor & "00000000";
					nowRemainder <= "000000000" & dividend;
					nowQuotient <= "00000000";
				--	nowSub <= "00000000100000000";
					state <= s1;
					output <= "001";

				when s1 => 
					tmp := "00000000000000000";
					tmp := nowRemainder - nowDivisor;
					nowRemainder <= nowRemainder - nowDivisor;

					case tmp(15) is 
						when '1'=>
							state <= s2b;
							output <= "011";
						when others =>
							state <= s2a;
							output <= "010";
					end case;
					
				when s2a => 
					nowQuotient <= nowQuotient(6 downto 0) & "1";
					state <= s3;
					output <= "100";
					
				when s2b => 
					nowQuotient <= nowQuotient(6 downto 0) & "0";
					nowRemainder <= nowRemainder +nowDivisor;
					state <= s3;
					output <= "100";

				when s3 => 

					w<='0';
				--	nowSub <= "0" & nowSub(16 downto 1);
					nowDivisor <= "0"&nowDivisor(16 downto 1);
					case(repeat) is	
						when 7=> --7 or 8?
							w<='1';
							repeat <= 0;
						when others=>
							w <='0';
							repeat <= repeat +1;
					end case;
					if w ='1' then
						-- nowQuotient <= "0" & nowQuotient(7 downto 1) ;
						state <= s4;
						output <= "101";
					else 
						state <= s1;
						output <= "001";
					end if;

				when s4 => 
					output <= "101";
						
				when others => output <= "111";

			end case ;

			if reset = '1' then
				state <= start;
				output <= "000";
			end if ;

		end if;
	end process;
	remainder<= nowRemainder(7 downto 0);
	quotient <= nowQuotient(7 downto 0);

	hexq0: hex port map(nowQuotient(0),nowQuotient(1),nowQuotient(2),nowQuotient(3),hex0(0),hex0(1),hex0(2),hex0(3),hex0(4),hex0(5),hex0(6));
	hexq1: hex port map(nowQuotient(4),nowQuotient(5),nowQuotient(6),nowQuotient(7),hex1(0),hex1(1),hex1(2),hex1(3),hex1(4),hex1(5),hex1(6));
	hexr0: hex port map(nowRemainder(0),nowRemainder(1),nowRemainder(2),nowRemainder(3),hex2(0),hex2(1),hex2(2),hex2(3),hex2(4),hex2(5),hex2(6));
	hexr1: hex port map(nowRemainder(4),nowRemainder(5),nowRemainder(6),nowRemainder(7),hex3(0),hex3(1),hex3(2),hex3(3),hex3(4),hex3(5),hex3(6));
	
end dosth;


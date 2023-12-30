library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.lab8_package.all;

entity lab8 is
	port( Data: in std_logic_vector(7 downto 0);
			Control: in std_logic_vector(7 downto 0);
			Clock: in std_logic;
			hexBus: out std_logic_vector(13 downto 0);
			hexRs: out std_logic_vector(13 downto 0);
			hexRt: out std_logic_vector(13 downto 0)
			);
end lab8;

architecture func of lab8 is

	signal R3, R2, R1, R0: std_logic_vector(7 downto 0);
	
	signal Opcode: std_logic_vector(3 downto 0);
	signal Rs_pointer: std_logic_vector(1 downto 0);
	signal Rt_pointer: std_logic_vector(1 downto 0);
	
	signal tmpRs, tmpRt, tmpData: std_logic_vector(7 downto 0);
	
	signal D_Bus: std_logic_vector(7 downto 0);
	signal D_Rs: std_logic_vector(7 downto 0);
	signal D_Rt: std_logic_vector(7 downto 0);
	
	signal divisionCount: integer := 0;
	signal localRemainder: std_logic_vector(15 downto 0);
	signal localDivisor: std_logic_vector(15 downto 0);
	signal localQuotient: std_logic_vector(7 downto 0);
	
begin
	Opcode <= Control(3 downto 0);
	Rs_pointer <= Control(5 downto 4);
	Rt_pointer <= Control(7 downto 6);
	D_Bus <= Data;

	process(Clock)
		variable excuteStep: integer := 0;
		variable prevOpcode: std_logic_vector(3 downto 0);
		variable tmpData2: std_logic_vector(7 downto 0);
	begin
		if rising_edge(Clock) then
			if excuteStep = 0 then
				case Opcode is
					when "0000" =>
						tmpData <= Data;
						case Rs_pointer is
							when "00" => R0 <= Data;
							when "01" => R1 <= Data;
							when "10" => R2 <= Data;
							when others => R3 <= Data;
						end case;
					when "0001" =>
						case Rt_pointer is
							when "00" => tmpData <= R0;
							when "01" => tmpData <= R1;
							when "10" => tmpData <= R2;
							when others => tmpData <= R3;
						end case;
						
						case Rs_pointer is
							when "00" => R0 <= tmpData;
							when "01" => R1 <= tmpData;
							when "10" => R2 <= tmpData;
							when others => R3 <= tmpData;
						end case;
					when others =>
						case Rs_pointer is
							when "00" => tmpData <= R0;
							when "01" => tmpData <= R1;
							when "10" => tmpData <= R2;
							when others => tmpData <= R3;
						end case;
						---
						prevOpcode := Opcode;
						excuteStep := excuteStep + 1;
				end case;
				
			elsif excuteStep = 1 then		--Load Rt to data
				tmpData2 := tmpData;
				case Rt_pointer is
					when "00" => tmpData <= R0;
					when "01" => tmpData <= R1;
					when "10" => tmpData <= R2;
					when others => tmpData <= R3;
				end case;
				---
				excuteStep := excuteStep + 1;
				
			elsif excuteStep = 2 then		--Process operate
				
				case prevOpcode is
					when "0010" =>		--Add
						tmpData <= tmpData2 + tmpData;
					when "0011" =>		--And
						tmpData <= tmpData2 and tmpData;
					when "0101" =>		--Sub(A-B)
						tmpData <= tmpData2 - tmpData;
					when "1001" =>		--Sub(B-A)
						tmpData <= tmpData - tmpData2;
					when "0100" =>		--slt
						if unsigned(tmpData2) < unsigned(tmpData) then
							tmpData <= "00000001";
						else
							tmpData <= "00000000";
						end if;
					when "1000" =>		--Div
						if divisionCount = 0 then
							divisionCount <= 1;
							localRemainder <= (others => '0');
							localRemainder(7 downto 0) <= tmpData2;
							localDivisor <= (others => '0');
							localDivisor(15 downto 8) <= tmpData;
							localQuotient <= (others => '0');
						elsif divisionCount = 10 then
							tmpData2 := localQuotient;
							divisionCount <= 0;
						else
							divisionCount <= divisionCount + 1;
							if localRemainder >= localDivisor then
								localQuotient <= localQuotient(6 downto 0) & '1';
								localRemainder <= localRemainder - localDivisor;
							else
								localQuotient <= localQuotient(6 downto 0) & '0';
							end if;
							localDivisor <= '0' & localDivisor(15 downto 1);
						end if;
						tmpData <= tmpData2;
					when others =>
						--ignore
				end case;
				---
				excuteStep := excuteStep + 1;
			else					--Write back to Rs
				case Rs_pointer is
					when "00" => R0 <= tmpData;
					when "01" => R1 <= tmpData;
					when "10" => R2 <= tmpData;
					when others => R3 <= tmpData;
				end case;
				---
				excuteStep := 0;
			end if;
		end if;
	end process;
				

	process(R0, R1, R2, R3)
	begin
		case Rs_pointer is
			when "00" => D_Rs <= R0;
			when "01" => D_Rs <= R1;
			when "10" => D_Rs <= R2;
			when others => D_Rs <= R3;
		end case;
	
		case Rt_pointer is
			when "00" => D_Rt <= R0;
			when "01" => D_Rt <= R1;
			when "10" => D_Rt <= R2;
			when others => D_Rt <= R3;
		end case;
	end process;
	
	busport: hex port map(D_Bus(7), D_Bus(6), D_Bus(5), D_Bus(4), D_Bus(3), D_Bus(2), D_Bus(1), D_Bus(0), hexBus(0), hexBus(1), hexBus(2), hexBus(3), hexBus(4), hexBus(5), hexBus(6), hexBus(7), hexBus(8), hexBus(9), hexBus(10), hexBus(11), hexBus(12), hexBus(13));
	rsport: hex port map(D_Rs(7), D_Rs(6), D_Rs(5), D_Rs(4), D_Rs(3), D_Rs(2), D_Rs(1), D_Rs(0), hexRs(0), hexRs(1), hexRs(2), hexRs(3), hexRs(4), hexRs(5), hexRs(6), hexRs(7), hexRs(8), hexRs(9), hexRs(10), hexRs(11), hexRs(12), hexRs(13));
	rtport: hex port map(D_Rt(7), D_Rt(6), D_Rt(5), D_Rt(4), D_Rt(3), D_Rt(2), D_Rt(1), D_Rt(0), hexRt(0), hexRt(1), hexRt(2), hexRt(3), hexRt(4), hexRt(5), hexRt(6), hexRt(7), hexRt(8), hexRt(9), hexRt(10), hexRt(11), hexRt(12), hexRt(13));
	
end func;
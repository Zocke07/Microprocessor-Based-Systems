library ieee;
use ieee.std_logic_1164.all;
use work.final_package.all;

entity final is
	port( Data: in std_logic_vector(7 downto 0);
			Instruction: in std_logic_vector(7 downto 0);
			Clock: in std_logic;
			Data_HEX1, Data_HEX0: out std_logic_vector(6 downto 0);
			Rs_HEX1, Rs_HEX0: out std_logic_vector(6 downto 0);
			Rt_HEX1, Rt_HEX0: out std_logic_vector(6 downto 0);
			HazardDetection: out std_logic;
			ExcuteStatus: out std_logic_vector(3 downto 0));
end final;

architecture func of final is
	signal tmpRs, tmpRt: std_logic_vector(7 downto 0);

begin
	PCPU: PipelineCPU
		port map(Data, Instruction, Clock, tmpRs, tmpRt, HazardDetection, ExcuteStatus);
	
	HEX1_Data: hex
		port map(Data(4), Data(5), Data(6), Data(7), Data_HEX1(0), Data_HEX1(1), Data_HEX1(2), Data_HEX1(3), Data_HEX1(4), Data_HEX1(5), Data_HEX1(6));
	HEX0_Data: hex
		port map(Data(0), Data(1), Data(2), Data(3), Data_HEX0(0), Data_HEX0(1), Data_HEX0(2), Data_HEX0(3), Data_HEX0(4), Data_HEX0(5), Data_HEX0(6));

	HEX1_Rs: hex
		port map(tmpRs(4), tmpRs(5), tmpRs(6), tmpRs(7), Rs_HEX1(0), Rs_HEX1(1), Rs_HEX1(2), Rs_HEX1(3), Rs_HEX1(4), Rs_HEX1(5), Rs_HEX1(6));
	HEX0_Rs: hex
		port map(tmpRs(0), tmpRs(1), tmpRs(2), tmpRs(3), Rs_HEX0(0), Rs_HEX0(1), Rs_HEX0(2), Rs_HEX0(3), Rs_HEX0(4), Rs_HEX0(5), Rs_HEX0(6));

	HEX1_Rt: hex
		port map(tmpRt(4), tmpRt(5), tmpRt(6), tmpRt(7), Rt_HEX1(0), Rt_HEX1(1), Rt_HEX1(2), Rt_HEX1(3), Rt_HEX1(4), Rt_HEX1(5), Rt_HEX1(6));
	HEX0_Rt: hex
		port map(tmpRt(0), tmpRt(1), tmpRt(2), tmpRt(3), Rt_HEX0(0), Rt_HEX0(1), Rt_HEX0(2), Rt_HEX0(3), Rt_HEX0(4), Rt_HEX0(5), Rt_HEX0(6));

end func;

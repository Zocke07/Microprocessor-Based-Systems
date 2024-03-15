library ieee;
use ieee.std_logic_1164.all; 

package final_package is 
	component hex
		PORT (s0,s1,s2,s3: in std_logic;
				a1,b1,c1,d1,e1,f1,g1: out std_logic);
	end component hex;

	component PipelineCPU
		port( Data: in std_logic_vector(7 downto 0);
				Instruction: in std_logic_vector(7 downto 0);
				Clock: in std_logic;
				D_Rs: out std_logic_vector(7 downto 0);
				D_Rt: out std_logic_vector(7 downto 0);
				HazardDetection: out std_logic;
				ExcuteStatus: out std_logic_vector(3 downto 0));
	end component;
end final_package;

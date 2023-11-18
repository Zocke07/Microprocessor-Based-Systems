LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY lab5 IS
	GENERIC (N : INTEGER := 8);
	PORT(	clk 	: IN STD_LOGIC;
			clear	: IN STD_LOGIC;
			load	: IN STD_LOGIC;
			lr_sel: IN STD_LOGIC;
			di		: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sdi	: IN STD_LOGIC;
			qo		: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END;

ARCHITECTURE func OF lab5 IS
BEGIN
	PROCESS
	BEGIN
	WAIT UNTIL clk'event and clk='1';
	IF clear='1' THEN
		clearloop: FOR i IN 0 TO N-1 LOOP
			qo(i) <= '0';
		END LOOP;
	ELSE
		IF load='1' THEN
			qo <= di;
		ELSE
			IF lr_sel='0' THEN
				leftloop: FOR i IN 0 TO N-2 LOOP
					qo(i) <= qo(i + 1);
				END LOOP;
				qo(N - 1) <= sdi;
			ELSE
				rightloop: FOR i IN N-1 DOWNTO 1 LOOP
					qo(i) <= qo(i - 1);
				END LOOP;
				qo(0) <= sdi;
			END IF;
		END IF;
	END IF;
	END PROCESS;
END func;
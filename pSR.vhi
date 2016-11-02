
-- VHDL Instantiation Created from source file pSR.vhd -- 19:29:26 11/01/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT pSR
	PORT(
		nzvc : IN std_logic_vector(3 downto 0);
		reset : IN std_logic;
		Clock : IN std_logic;          
		carry : OUT std_logic
		);
	END COMPONENT;

	Inst_pSR: pSR PORT MAP(
		nzvc => ,
		reset => ,
		Clock => ,
		carry => 
	);



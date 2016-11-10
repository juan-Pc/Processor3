--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:18:26 11/05/2016
-- Design Name:   
-- Module Name:   D:/Desktop/PROCESADOR NUEVO/PROCESADOR4/tbrf.vhd
-- Project Name:  PROCESADOR4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rF
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_rF IS
END Tb_rF;
 
ARCHITECTURE behavior OF Tb_rF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rF
    PORT(
         registros1 : IN  std_logic_vector(4 downto 0);
         registros2 : IN  std_logic_vector(4 downto 0);
         reset : IN  std_logic;
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0);
         crd : IN  std_logic_vector(31 downto 0);
         rdestino : IN  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal registros1 : std_logic_vector(4 downto 0) := (others => '0');
   signal registros2 : std_logic_vector(4 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal crd : std_logic_vector(31 downto 0) := (others => '0');
   signal rdestino : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rF PORT MAP (
          registros1 => registros1,
          registros2 => registros2,
          reset => reset,
          crs1 => crs1,
          crs2 => crs2,
          crd => crd,
          rdestino => rdestino
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;
			reset <='0';
			registros1 <= "10000";
			registros2 <= "10001";
			rdestino <= "10010";
			crd <= x"00010110";
	
end process; 

END;

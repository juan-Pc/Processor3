--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:16:52 11/05/2016
-- Design Name:   
-- Module Name:   D:/Desktop/PROCESADOR NUEVO/PROCESADOR4/tbpsrmodifier.vhd
-- Project Name:  PROCESADOR4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pSR_modifier
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
 
ENTITY Tb_pSRmodifier IS
END Tb_pSRmodifier;
 
ARCHITECTURE behavior OF Tb_pSRmodifier IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pSR_modifier
    PORT(
         alu_op : IN  std_logic_vector(5 downto 0);
         alu_resultado : IN  std_logic_vector(31 downto 0);
         Crs1 : IN  std_logic_vector(31 downto 0);
         Crs2 : IN  std_logic_vector(31 downto 0);
			reset: in STD_LOGIC;
         nzvc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal alu_op : std_logic_vector(5 downto 0) := (others => '0');
   signal alu_resultado : std_logic_vector(31 downto 0) := (others => '0');
   signal Crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Crs2 : std_logic_vector(31 downto 0) := (others => '0');
	signal reset : std_logic := '0';

 	--Outputs
   signal nzvc : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pSR_modifier PORT MAP (
          alu_op => alu_op,
          alu_resultado => alu_resultado,
			 reset => reset,
          Crs1 => Crs1,
          Crs2 => Crs2,
          nzvc => nzvc
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
     reset <= '1';
      wait for 100 ns;
			reset <='0';
			alu_op<= "010100";
			Crs1 <= x"00010000";
			Crs2 <= x"00010001";
			alu_Resultado<="11111111111111111111111111110011";
			
      wait;
   end process;

END;

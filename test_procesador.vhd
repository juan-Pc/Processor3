--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:34:31 11/01/2016
-- Design Name:   
-- Module Name:   C:/Users/Juan/Documents/Procesador32bits/test_procesador.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Procesador_AMD_FULL
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
 
ENTITY ProcesadorTB IS
END ProcesadorTB;
 
ARCHITECTURE behavior OF ProcesadorTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador_AMD_FULL
    PORT(
         Clock : IN  std_logic;
         Reset : IN  std_logic;
         OutProcesador : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal OutProcesador : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador_AMD_FULL PORT MAP (
          Clock => Clock,
          Reset => Reset,
          OutProcesador => OutProcesador
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
		Reset <= '1';
      -- hold reset state for 100 ns.
      wait for 30 ns;	
		Reset <= '0';	

      wait;
   end process;

END;

--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:12:46 11/01/2016
-- Design Name:   
-- Module Name:   C:/Users/Juan/Documents/Procesador32bits/test_psr.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pSR
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
 
ENTITY Tb_pSR IS
END Tb_pSR;
 
ARCHITECTURE behavior OF Tb_pSR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pSR
    PORT(
         nzvc : IN  std_logic_vector(3 downto 0);
         reset : IN  std_logic;
         Clock : IN  std_logic;
         carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal Clock : std_logic := '0';

 	--Outputs
   signal carry : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pSR PORT MAP (
          nzvc => nzvc,
          reset => reset,
          Clock => Clock,
          carry => carry
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
			reset <= '1';
								nzvc<="0010";
								wait for 50 ns;
								reset<='0';
								nzvc<="1010";
								wait for 50 ns;
								nzvc<="1110";
								wait for 50 ns;
								nzvc<="0101";
     
      wait;
   end process;

END;

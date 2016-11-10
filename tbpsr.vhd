--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:17:35 11/05/2016
-- Design Name:   
-- Module Name:   D:/Desktop/PROCESADOR NUEVO/PROCESADOR4/tbpsr.vhd
-- Project Name:  PROCESADOR4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: psr
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
         clk : IN  std_logic;
         carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal carry : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pSR PORT MAP (
          nzvc => nzvc,
          reset => reset,
          clk => clk,
          carry => carry
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
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

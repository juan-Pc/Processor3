--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:20:42 11/05/2016
-- Design Name:   
-- Module Name:   D:/Desktop/PROCESADOR NUEVO/PROCESADOR4/tbwm.vhd
-- Project Name:  PROCESADOR4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: wm
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
 
ENTITY Tb_wmanger IS
END Tb_wmanger;
 
ARCHITECTURE behavior OF Tb_wmanger IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT wm
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         cwp : IN  std_logic;
         ncwp : OUT  std_logic;
         rs1w : OUT  std_logic_vector(5 downto 0);
         rs2w : OUT  std_logic_vector(5 downto 0);
         rdw : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal cwp : std_logic := '0';

 	--Outputs
   signal ncwp : std_logic;
   signal rs1w : std_logic_vector(5 downto 0);
   signal rs2w : std_logic_vector(5 downto 0);
   signal rdw : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wm PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          op => op,
          op3 => op3,
          cwp => cwp,
          ncwp => ncwp,
          rs1w => rs1w,
          rs2w => rs2w,
          rdw => rdw
        );

  

   -- Stimulus process
  stim_proc: process
   begin	
				rs1 <= "10000";
				rs2 <= "10001";
				rd <= "10010";
				cwp <= '0';
				op <= "10";
				op3 <="000000";
		
				wait for 20 ns;
		
				cwp <= '1';
		
				wait for 20 ns;
		
				rs1 <= "11000";
				rs2 <= "11001";
				rd <= "11010";
		
				wait for 20 ns;
		
				cwp <= '0';
		
				wait for 20 ns;
		
				rs1 <= "00000";
				rs2 <= "00001";
				rd <= "00010";
		
				wait for 20 ns;
		
				cwp <= '1';
			
		--	cwp <= '1';
		--	op <= "10";
		--	op3 <= "111101";
		--	rfuente1 <= "00011";
		--	rfuente2 <= "10001";
		--	registrod <= "10010";

      wait;
		 end process;

END;
